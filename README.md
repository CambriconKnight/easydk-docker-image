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
cam@cam-3630:/data/github$ git clone https://github.com/CambriconKnight/easydk-docker-image.git
Cloning into 'easydk-docker-image'...
remote: Enumerating objects: 24, done.
remote: Counting objects: 100% (24/24), done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 24 (delta 11), reused 20 (delta 7), pack-reused 0
Unpacking objects: 100% (24/24), done.
Checking connectivity... done.
cam@cam-3630:/data/github$ ls -la easydk-docker-image
total 36
drwxrwxr-x 3 cam cam 4096 11月 11 10:39 .
drwxrwxr-x 9 cam cam 4096 11月 11 10:38 ..
-rwxrwxr-x 1 cam cam 1855 11月 11 10:39 build-image-easydk.sh
-rwxrwxr-x 1 cam cam 3396 11月 11 10:39 Dockerfile
drwxrwxr-x 8 cam cam 4096 11月 11 10:39 .git
-rwxrwxr-x 1 cam cam  682 11月 11 10:39 load-image-easydk.sh
-rw-rw-r-- 1 cam cam 7166 11月 11 10:39 README.md
-rwxrwxr-x 1 cam cam 1591 11月 11 10:39 run-container-easydk.sh
cam@cam-3630:/data/github$
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
apt-get update && apt-get upgrade -y
#If v1.5.0, download and update cndev
#ftp://username@download.cambricon.com:8821/download/demo/easydk/cndev1.14.2-0907.tar.gz
#tar zxvf cndev1.14.2-0907.tar.gz
#rm /usr/local/neuware/lib64/libcndev.so
#cp ./cndev1.14.2/libcndev.so.1.14.2 /usr/local/neuware/lib64/
#ls -la /usr/local/neuware/lib64/
#cd /usr/local/neuware/lib64/
#ln -s libcndev.so.1.14.2 libcndev.so
#ls -la
```

## Test ##
```bash
echo ${EASYDK_DIR}
export EASYDK_DIR=/root/work
echo ${EASYDK_DIR}
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/neuware/lib64
echo $LD_LIBRARY_PATH
cd ${EASYDK_DIR}/samples/stream-app/
./run.sh MLU270
```
```bash
root@cam-3630:~/work/samples/stream-app# cd ~/work/
root@cam-3630:~/work# ls
3rdparty        CPPLINT.cfg  README.md     build  docs     infer_server  samples  tests
CMakeLists.txt  LICENSE      README_cn.md  cmake  include  lib           src      tools
root@cam-3630:~/work# cd samples/stream-app/
root@cam-3630:~/work/samples/stream-app# ./run.sh MLU270
~/work/samples/stream-app ~/work/samples/stream-app
WARNING: Logging before InitGoogleLogging() is written to STDERR
I1110 05:26:52.060737 12104 model_loader.cpp:162] Load model from file: ../data/models/MLU270/resnet34_ssd.cambricon
I1110 05:26:52.086546 12104 model_loader.cpp:189] Load function from offline model succeeded
CNRT: 4.6.0 e158c88
I1110 05:26:52.094398 12104 mlu_context.cpp:99] Cambricon runtime init success.
I1110 05:26:52.094444 12104 easy_infer.cpp:79] Init inference context, device id: 0
I1110 05:26:52.121914 12104 easy_infer.cpp:97] Create MLU task queue from runtime context
I1110 05:26:52.122318 12104 easy_decode.cpp:947] CNCodec Version: 1.7.0
param                           value
-------------------------------------
Codectype                       2
Instance                        4294967295
DeviceID                        0
MemoryAllocate                  0
PixelFormat                     1
Progressive                     1
Width                           1920
Height                          1080
BitDepthMinus8                  0
InputBufferNum                  6
OutputBufferNum                 6
-------------------------------------
Invalid UE golomb code
Invalid UE golomb code
Invalid UE golomb code
Invalid UE golomb code
Invalid UE golomb code
I1110 05:26:52.172127 12108 easy_decode.cpp:657] Receive sequence
I1110 05:26:52.182080 12104 mlu_context.cpp:170] Get Core Version MLU270
I1110 05:26:52.182121 12104 resize_and_colorcvt.cpp:171] Init ResizeAndConvert Operator, [batchsize: 1], [core_number: 4].
I1110 05:26:58.324442 12102 easy_decode.cpp:853] Thread id: 140559313987200,Feed EOS data
End Of Stream
Clear ffmpeg resources
I1110 05:26:58.861109 12105 easy_decode.cpp:700] Thread id: 140558691555072,Received EOS from cncodec
I1110 05:26:58.903738 12104 easy_decode.cpp:340] Stop video decoder channel
I1110 05:26:58.904328 12104 easy_decode.cpp:346] Destroy video decoder channel
I1110 05:26:58.942287 12104 mlu_context.cpp:51] Destroy MLU task queue
I1110 05:26:58.943362 12104 model_loader.cpp:417] Destroy neural network function
I1110 05:26:58.943378 12104 model_loader.cpp:422] Unload offline model
run stream app SUCCEED!!!
I1110 05:26:58.945845 12102 mlu_context.cpp:82] Cambricon runtime destroy
~/work/samples/stream-app
root@cam-3630:~/work/samples/stream-app#
```
