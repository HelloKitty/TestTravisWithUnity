#! /bin/sh

echo 'Downloading from http://download.unity3d.com/download_unity/cc9cbbcc37b4/MacEditorInstaller/Unity-5.3.1f1.pkg: '
curl -o Unity.pkg http://download.unity3d.com/download_unity/cc9cbbcc37b4/MacEditorInstaller/Unity-5.3.1f1.pkg

echo 'Installing Unity.pkg'
sudo installer -dumplog -package Unity.pkg -target /