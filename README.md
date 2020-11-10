# easydk Docker Images #

Build docker images for [easydk](https://github.com/Cambricon/CNStream/tree/master/easydk).

## Directory tree ##

```bash
.
├── build-image-easydk.sh
├── Dockerfile
├── load-image-easydk.sh
├── README.md
└── run-container-easydk.sh
```

## Clone ##
```bash
git clone https://github.com/CambriconKnight/easydk-docker-image.git
```
```bash

```

## Build ##
```bash
./build-image-easydk.sh
```
```bash
cam@cam-3630:/data/github/easydk-docker-image$ ./build-image-easydk.sh
Directory(easydk): Not exist!
Copy your easydk into the directory[easydk-docker-image]!
eg:cp -r /data/ftp/demo/easydk ./
cam@cam-3630:/data/github/easydk-docker-image$ cp -r /data/ftp/demo/easydk ./
cam@cam-3630:/data/github/easydk-docker-image$ ls
build-image-easydk.sh  Dockerfile  easydk  load-image-easydk.sh  README.md  run-container-easydk.sh
cam@cam-3630:/data/github/easydk-docker-image$ ./build-image-easydk.sh
Directory(easydk): Exists!
File(./easydk/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb): Not exist!
Copy your neuware package(neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb) into the directory of easydk!
eg:cp -v /data/ftp/v1.5.0/neuware/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb ./easydk
cam@cam-3630:/data/github/easydk-docker-image$ cp -v /data/ftp/v1.5.0/neuware/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb ./easydk
'/data/ftp/v1.5.0/neuware/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb' -> './easydk/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb'
cam@cam-3630:/data/github/easydk-docker-image$
cam@cam-3630:/data/github/easydk-docker-image$ ls -la ./easydk/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb
-rw-rw-r-- 1 cam cam 77759334 11月 10 11:58 ./easydk/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb
cam@cam-3630:/data/github/easydk-docker-image$
cam@cam-3630:/data/github/easydk-docker-image$ ./build-image-easydk.sh
Directory(easydk): Exists!
File(./easydk/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb): Exists!
====================== build image ======================
Sending build context to Docker daemon  692.4MB
Step 1/11 : FROM ubuntu:16.04
 ---> c522ac0d6194
Step 2/11 : MAINTAINER <Cambricon, Inc.>
 ---> Using cache
 ......
 ......
 ......
[100%] Linking CXX executable tests
[100%] Built target tests
Removing intermediate container 1720c8e5e705
 ---> 6b163b589920
Step 11/11 : WORKDIR /root/work/
 ---> Running in 814d742774b9
Removing intermediate container 814d742774b9
 ---> e8ab54975586
Successfully built e8ab54975586
Successfully tagged ubuntu16.04_easydk:v1.5.0
====================== save image ======================
-rw------- 1 cam cam 1719766016 11月 10 12:57 ubuntu16.04_easydk-v1.5.0.tar.gz
cam@cam-3630:/data/github/easydk-docker-image$
```

## Load ##
```bash
./load-image-easydk.sh
```
```bash
cam@cam-3630:/data/github/easydk-docker-image$ ./load-image-easydk.sh
[sudo] password for cam:
1
ubuntu16.04_easydk:v1.5.0
The image(ubuntu16.04_easydk:v1.5.0) is already loaded!
The image(ubuntu16.04_easydk:v1.5.0) information:
REPOSITORY                                                   TAG                 IMAGE ID            CREATED             SIZE
ubuntu16.04_easydk                                           v1.5.0              e8ab54975586        5 minutes ago       1.7GB
cam@cam-3630:/data/github/easydk-docker-image$
```

## Run ##
```bash
./run-container-easydk.sh
```
```bash
cam@cam-3630:/data/github/easydk-docker-image$ ./run-container-easydk.sh
0
container-easydk-v1.5.0
root@cam-3630:~/work# ls
3rdparty        CPPLINT.cfg  README.md     build  docs     infer_server  samples  tests
CMakeLists.txt  LICENSE      README_cn.md  cmake  include  lib           src      tools
root@cam-3630:~/work#
```

## Update ##
Execute the following command when logging in to the container for the first time.
```bash
#更新软件列表、更新软件
apt-get update && apt-get upgrade -y
#设置环境变量
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/neuware/lib64
echo $LD_LIBRARY_PATH
```

## Test ##
```bash

```
