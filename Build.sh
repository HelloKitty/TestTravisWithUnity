#! /bin/sh

# Change this the name of your project. This will be the name of the final executables as well.

project="ci-build"

echo "Attempting to build $project for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe" \
  -quit


# Exit with the current exit code
if [ $? -eq 0 ]
then
	cat $(pwd)/unity.log
	exit 0
else
	cat $(pwd)/unity.log
	echo "Failure to build Application"
	exit 1
fi