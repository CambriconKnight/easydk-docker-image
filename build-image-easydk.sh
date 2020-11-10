#/bin/bash
set -e

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

##0.copy your easydk into the directory
if [ ! -d "${PATH_EASYDK_MLU}" ];then
    echo "Directory(${PATH_EASYDK_MLU}): Exists!"
else
    echo -e "${red}Directory(${PATH_EASYDK_MLU}): Not exist!${none}"
    echo -e "${yellow}Copy your easydk into the directory[easydk-docker-image]!${none}"
    echo -e "${yellow}eg:cp -v /data/ftp/demo/easydk ./${none}"
    #Manual copy
    #cp -v /data/ftp/demo/easydk ./
    exit -1
fi

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
