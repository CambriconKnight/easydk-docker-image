#/bin/bash
set -e

# 1. copy your neuware package into the directory of easydk
# 2. docker build -f dockerfile/Dockerfile --build-arg mlu_platform=MLU270 --build-arg neuware_package=neuware-mlu270-1.4.0-1_Ubuntu16.04_amd64.deb -t ubuntu_ffmpeg-mlu:v1 .
# 3. docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --privileged -v /dev:/dev --net=host --pid=host --ipc=host -v $HOME/.Xauthority -it --name ubuntu_ffmpeg-mlu  -v $PWD:/workspace ubuntu_ffmpeg-mlu:v1
# 4. if docker is ready, can execute it by docker start ubuntu_ffmpeg-mlu / docker exec -it  ubuntu_ffmpeg-mlu /bin/bash

#Version
VERSION="v1.5.0"
PATH_EASYDK_MLU="easydk"
neuware_version=neuware-mlu270-1.5.0
neuware_package_name="${neuware_version}-1_Ubuntu16.04_amd64.deb"
NAME_IMAGE="ubuntu16.04_easydk:$VERSION"
FILENAME_IMAGE="ubuntu16.04_easydk-$VERSION.tar.gz"

none="\033[0m"
green="\033[0;32m"
red="\033[0;31m"
yellow="\033[1;33m"

##0.git clone
if [ ! -d "${PATH_EASYDK_MLU}" ];then
    git clone http://172.10.80.76/video/easydk.git
    echo "Directory(${PATH_EASYDK_MLU}): Exists!"
fi
cd "${PATH_EASYDK_MLU}"
# del .git
find . -name ".git" | xargs rm -Rf
cd ../

##copy your neuware package into the directory of easydk
if [ -f "./${PATH_EASYDK_MLU}/${neuware_package_name}" ];then
    echo "File(./${PATH_EASYDK_MLU}/${neuware_package_name}): Exists!"
else
    echo -e "${red}File(./${PATH_EASYDK_MLU}/${neuware_package_name}): Not exist!${none}"
    echo -e "${yellow}Copy your neuware package(${neuware_package_name}) into the directory of easydk!${none}"
    echo -e "${yellow}eg:cp -v /data/ftp/v1.5.0/neuware/${neuware_package_name} ./${PATH_EASYDK_MLU}${none}"
    #Manual copy
    #cp -v /data/ftp/v1.5.0/neuware/neuware-mlu270-1.5.0-1_Ubuntu16.04_amd64.deb ./easydk
    exit -1
fi

#1.build image
echo "====================== build image ======================"
docker build -f ./Dockerfile --build-arg neuware_version=${neuware_version} -t $NAME_IMAGE .
#2.save image
echo "====================== save image ======================"
docker save -o $FILENAME_IMAGE $NAME_IMAGE
ls -la $FILENAME_IMAGE
