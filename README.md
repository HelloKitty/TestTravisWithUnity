# TestTravisWithUnity

Worked based on https://jonathan.porta.codes/2015/04/17/automatically-build-your-unity3d-project-in-the-cloud-using-travisci-for-free/ original implementation, extended to Unity3D 5.3 by changes in an active pull request here https://github.com/JonathanPorta/ci-build/pull/3#issuecomment-187911545 and continued by myself to add Mega.co deployment.

Install.sh needs version and hash updated on a per-version basis. Additional build target components must be added, similar to the Windows component,
to support other platforms.

Deployment is setup to deploy to Mega.co and report information about it to a Discord server.
