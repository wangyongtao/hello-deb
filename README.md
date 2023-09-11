# hello-deb

> Debian is an operating system and a distribution of Free Software.   
> deb is the format, as well as filename extension of the software package format for the Debian Linux distribution and its derivatives.  
> dpkg provides the basic functionality for installing and manipulating Debian packages.  


Build Debian Package Demo 


Debian Linux 11.7:

```
$ cat /etc/debian_version
11.7

$ go version
go version go1.21.0 darwin/arm64
```



build deb:

    make build-deb


check:

```bash
root@VM-0-4-debian:~/hello-deb# ls -lh release/
total 2.2M
drwxr-xr-x 5 root root 4.0K Sep 10 23:56 hello-deb-1.0.1
-rw-r--r-- 1 root root 2.2M Sep 10 23:57 hello-deb-1.0.1.deb
```

install deb package:

```bash
root@VM-0-4-debian:~/hello-deb# dpkg -i release/hello-deb-1.0.1.deb 
Selecting previously unselected package hello-deb.
(Reading database ... 105809 files and directories currently installed.)
Preparing to unpack release/hello-deb-1.0.1.deb ...
[I] preinst script start...
/
[I] preinst script done...
Unpacking hello-deb (1.0.0) ...
Setting up hello-deb (1.0.0) ...
```

check status:

```bash
root@VM-0-4-debian:~/hello-deb# dpkg -s hello-deb
Package: hello-deb
Status: install ok installed
Priority: optional
Section: BioInfoServ
Installed-Size: 4096
Maintainer: WYT
Architecture: amd64
Version: 1.0.0
Description: This is a test deb package.
```

Errors:

  dpkg-deb --build release/"hello-deb"-1.0.1  
  dpkg-deb: error: maintainer script 'preinst' has bad permissions 644 (must be >=0555 and <=0775)  

  chmod -R 755 hello_deb/DEBIAN/


run :
  
    ./hello-deb-cli 
