#! /bin/sh

# Change this the name of your project.
# Loads the Unity3D project by opening the editor.

project="QABuild"

echo "Attempting to build $project for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -quit


# Exit with the current exit code
if [ $? -eq 0 ]
then
	cat $(pwd)/unity.log
	exit 0
else
	cat $(pwd)/unity.log
	echo "Failed to load Unity3D project files or compile the .sln."
	exit 1
fi
