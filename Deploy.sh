#!/bin/bash

# First to make space we need to remove Assets and Library (This is after Caching so it's safe to remove Library)
rm -r Library
rm -r Assets

# This will install various tools needed for deployment and then push the build to Mega.co

# We need to update home brew because we're gonna pull down a Mega.co tool with it
brew update 

# Install the Mega.co C tools from: https://github.com/megous/megatools
# Install some random 7zip homebrew tool
brew install megatools
brew install p7zip

echo "Added p7zip and megatools"

# Make it runnable
chmod +x /usr/local/Cellar/megatools/megacopy
chmod +x /usr/local/Cellar/megatools/megals
chmod +x /usr/local/Cellar/megatools/p7zip

# 7Zip the directory
# Attach the build number to the build http://stackoverflow.com/questions/12643018/how-to-get-travis-ci-build-number-within-after-script-command
cd ./Build/windows/
ls

echo "Going to zip build."

7z a QABuild$((TRAVIS_JOB_ID - 1)).7z QABuild_Data
7z a QABuild$((TRAVIS_JOB_ID - 1)).7z QABuild.exe

echo "Going to push build to mega"

# Push the single file with megaput it up to Mega.co
megaput --path /Root -u unitytravisci@yahoo.com -p TravisUnityCI69 --no-ask-password QABuild$((TRAVIS_JOB_ID - 1)).7z

# Get the URL
MegaURLOutput=$(megals -e /Root/QABuild$((TRAVIS_JOB_ID - 1)).7z -u unitytravisci@yahoo.com -p TravisUnityCI69 --no-ask-password)
MegaURL=${MegaURLOutput% *}

echo "Going to install mono."

# Install Mono first
brew install mono

echo "Going to publish URL with bot cloned."

# Clone the bot that will publish the build URL
git clone https://github.com/HelloKitty/DiscordCI.git
nuget restore ./DiscordCI/DiscordCI.Application.sln
xbuild ./DiscordCI/DiscordCI.Application.sln

chmod +x ./DiscordCI/src/DiscordCI.Application/bin/Debug/DiscordCI.Application.exe
mono ./DiscordCI/src/DiscordCI.Application/bin/Debug/DiscordCI.Application.exe pioneerCI@yahoo.com botpassword 163384626801278976 163415695491727361 http://www.testurl.com TestCommitHash TestBranchName TestRepo/RepoName

ls
cd ..
cd ..
