#!/bin/bash

# This will install various tools needed for deployment and then push the build to Mega.co

# We need to update home brew because we're gonna pull down a Mega.co tool with it
brew update 

# Install the Mega.co C tools from: https://github.com/megous/megatools
# Install some random 7zip homebrew tool
brew install megatools
brew install p7zip

# Make it runnable
chmod +x /usr/local/Cellar/megatools/megacopy
chmod +x /usr/local/Cellar/megatools/p7zip

# 7Zip the directory
# Attach the build number to the build http://stackoverflow.com/questions/12643018/how-to-get-travis-ci-build-number-within-after-script-command
cd ./Build/windows/
ls

7z a QABuild$((TRAVIS_JOB_ID - 1)).7z QABuild_data/
7z a QABuild$((TRAVIS_JOB_ID - 1)).7z QABuild.exe

# Push the single file with megaput it up to Mega.co
megaput --path /Root -u unitytravisci@yahoo.com -p TravisUnityCI69 --no-ask-password QABuild$((TRAVIS_JOB_ID - 1)).7z

cd ..
cd ..
ls
