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

```

## Load ##
```bash
./load-image-easydk.sh
```
```bash

```

## Run ##
```bash
./run-container-easydk.sh
```
```bash

```

## Update ##
Execute the following command when logging in to the container for the first time.
```bash
#1、更新软件列表、更新软件
apt-get update && apt-get upgrade -y
#2、安装cmake
apt-get install cmake -y
#3、安装cnml 和 cnplugin
cd /var/neuware-mlu270-1.5.0
dpkg -i cnml_7.7.0-1.ubuntu16.04_amd64.deb cnplugin_1.8.0-1.ubuntu16.04_amd64.deb
cd -
#设置环境变量
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/neuware/lib64
echo $LD_LIBRARY_PATH
```

## Test ##
```bash

```
