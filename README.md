# TestTravisWithUnity

Worked based on https://jonathan.porta.codes/2015/04/17/automatically-build-your-unity3d-project-in-the-cloud-using-travisci-for-free/ original implementation
and extended to Unity3D 5.3 by changes in an active pull request here https://github.com/JonathanPorta/ci-build/pull/3#issuecomment-187911545

Install.sh needs version and hash updated on a per-version basis. Additional build target components must be added, similar to the Windows component,
to support other platforms.

Deployment is no setup and there is currently no solution for caching large projects (they currently time out TravisCI) so opt for Jenkins and a hosted
cloud solution for large and important projects.
