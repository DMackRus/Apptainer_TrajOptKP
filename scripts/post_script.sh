-c /bin/bash

apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

apt-get install -y --force-yes \
    wget \
    vim-gtk \
    zip \
    unzip \
    git \
    build-essential \
    software-properties-common \
    xterm \
    pypy \
    cmake \
    curl \
    python \
    psmisc \
    apt-utils \
    python3-pip \
    mesa-utils \
    software-properties-common \
    libglfw3 \
    libglfw3-dev

# Packages and installations of drake
# Install glibc6
apt-get install -y --force-yes gawk bison
cd /opt
git clone https://sourceware.org/git/glibc.git glibc-source
cd glibc-source
git checkout release/2.34/master
mkdir build
cd build
../configure --prefix=/opt/glibc
make
make install

# Installation of ROS Noetic and essential packages
#sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
#apt update
#apt install -y --force-yes \
#    ros-noetic-desktop \
#    ros-noetic-rosbash \
#    python3-rosdep \
#    python3-wstool \
#    python3-catkin-tools

# Init rosdep and update
#rosdep init
#rosdep update

# Installation of MoveIt! related packages
#apt install -y --force-yes \
#    ros-noetic-libfranka \
#    ros-noetic-franka-ros \
#    ros-noetic-panda-moveit-config \
#    ros-noetic-effort-controllers \
#    ros-noetic-position-controllers \
#    ros-noetic-ros-controllers \
#    ros-noetic-effort-controllers \
#    ros-noetic-rqt-controller-manager \
#    ros-noetic-four-wheel-steering-msgs \
#    ros-noetic-urdf-geometry-parser \
#    ros-noetic-urdf-geometry-parser \
#    ros-noetic-rosparam-shortcuts \
#    ros-noetic-moveit-resources-panda-moveit-config

# Install drake via apt - get
#apt-get update
#apt-get install --no-install-recommends \
#  ca-certificates gnupg lsb-release wget

#wget -qO- https://drake-apt.csail.mit.edu/drake.asc | gpg --dearmor - \
#  | sudo tee /etc/apt/trusted.gpg.d/drake.gpg >/dev/null

#echo "deb [arch=amd64] https://drake-apt.csail.mit.edu/$(lsb_release -cs) $(lsb_release -cs) main" \
#  | sudo tee /etc/apt/sources.list.d/drake.list >/dev/null

#apt-get update 
#apt-get install -y --force-yes --no-install-recommends drake-dev
# Add the environment variable to PATH via bashrc

# Install clion with wget and unzipping
wget https://download.jetbrains.com/cpp/CLion-2022.3.3.tar.gz
mv CLion-2022.3.3.tar.gz /opt 
cd /opt 
tar xvzf CLion-2022.3.3.tar.gz

# Install firefox
apt install -y --force-yes firefox

# Let's have a custom PS1 to help people realise in which container they are
# working.
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[PandaPlanning_Dave] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV

