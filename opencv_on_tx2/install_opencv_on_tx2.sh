#!/bin/sh
sudo apt-add-repository universe
sudo apt-get update

# install opencv dependencies
sudo apt-get install -y \
build-essential \
curl \
g++ \
git \
libatlas-base-dev \
libavcodec-dev \
libavformat-dev \
libdc1394-22-dev \
libeigen3-dev \
libgstreamer0.10-dev \
libgstreamer-plugins-base0.10-dev \
libjasper-dev \
libjpeg8-dev \
libopenblas-dev \
libpng12-dev \
libprotobuf-dev \
libtiff5-dev \
libswscale-dev \
libtbb-dev \
libv4l-dev \
libxine2-dev \
subversion \
swig \
unzip \
v4l-utils \
vim \
wget \
x264 \
zip

pip2 install -U pip numpy==1.15 
&& pip3 install -U pip numpy==1.15 
&& pip3 install scipy matplotlib scikit-image scikit-learn

# build and install opencv
cd /opt \
&& sudo git clone --verbose https://github.com/opencv/opencv.git -b 3.4.5 \
&& cd /opt/opencv \
&& sudo mkdir release \
&& cd release \
&& sudo cmake -DCMAKE_BUILD_TYPE=RELEASE \
-DCMAKE_INSTALL_PREFIX=/usr/local \
-DWITH_TBB=ON \
-DBUILD_NEW_PYTHON_SUPPORT=ON \
-DWITH_V4L=ON \
-DINSTALL_C_EXAMPLES=OFF \
-DINSTALL_PYTHON_EXAMPLES=OFF \
-DBUILD_EXAMPLES=OFF \
-DWITH_QT=OFF \
-DWITH_OPENGL=OFF \
-DWITH_CUDA=ON \
-DCUDA_GENERATION=Auto .. \
&& sudo make -j"$(nproc)" \
&& sudo make install \
&& sudo ldconfig \
&& cd /opt/opencv/release \
&& sudo make clean