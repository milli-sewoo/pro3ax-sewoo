#!/bin/bash

echo " # nouveau 비활성 화 확인 "

lsmod | grep nouveau

echo " cuda-repo (cuda 저장소) 설치 "

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

dpkg -i  cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

cat /etc/apt/sources.list.d/cuda.list

echo " cuda repo 에서 설치가능한 패키지 목록 확인. "

apt-get update

apt-cache search cuda

echo " 쿠다 샘플 컴파일에 필요한 라이브러리 설치 ( libGLU.so 외 ) "

apt-get install -y \
libglu1-mesa  libxi-dev  libxmu-dev  libglu1-mesa-dev libgl1-mesa-glx \
libgles2-mesa-dev freeglut3-dev  build-essential  libx11-dev  libxmu-dev

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

ln -s /usr/lib/x86_64-linux-gnu/libGLU.so    /usr/lib/libGLU.so

ln -s /usr/lib/x86_64-linux-gnu/libGL.so      /usr/lib/libGL.so

ln -s /usr/lib/x86_64-linux-gnu/libX11.so     /usr/lib/libX11.so

ln -s /usr/lib/x86_64-linux-gnu/libXi.so        /usr/lib/libXi.so

ln -s /usr/lib/x86_64-linux-gnu/libXmu.so    /usr/lib/libXmu.so

echo " cuda 9.0 설치 "

apt-get install -y cuda-9-0

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

echo " Nvidia Driver 동작 확인. "

nvidia-smi -L

nvidia-smi

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

echo " Cuda 9.0 환경변수를 Profile 에 추가 "

EC2='
### ADD Cuda PATH
export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-9.0
export CUDA_INC_DIR=/usr/local/cuda-9.0/include
### add end.
'


echo "${EC2}"
echo "${EC2}" >> /etc/profile

tail  /etc/profile
source /etc/profile
source .bashrc

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

echo " Cuda 컴파일러 동작 확인. "

nvcc -V

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

echo " Cuda 9.0 샘플 컴파일 "

cp -r  /usr/local/cuda-9.0/samples/   ~/NVIDIA_CUDA-9.0_Samples
cd ~/NVIDIA_CUDA-9.0_Samples

time make -j$(grep process /proc/cpuinfo | wc -l)

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

echo " Cuda 9.0 샘플 테스트 "

cd ~

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/deviceQuery

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/nbody  --help

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/nbody  -benchmark  -numdevices=2
