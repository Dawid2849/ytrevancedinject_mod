## YouTube ReVanced

YouTube ReVanced package by Dawid2849.

### Background

Dynamic mount YouTube ReVanced APK and make bind mount only be visible for YouTube App to avoid detection, other app will only see the original `base.apk` of YouTube.
This package doesn't provide detach function like the orignal package did. Please use some other module for detach instead (I use [zygisk-detach](https://github.com/j-hc/zygisk-detach)).

### Requirements

- [Process Monitor Tool](https://github.com/HuskyDG/magic_proc_monitor) module with version 2.1+ (2.3 is recommended as it's the latest version and it supports [KSU](https://github.com/tiann/KernelSU))
- normal YouTube already installed (version has to be the same as the one in this module)

### Note

If you are using KSU, please make sure that umount modules is DISABLED for YouTube in your KSU Manager.

### Credits

- [HuskyDG](https://github.com/HuskyDG/) - original script for dynamic mount
