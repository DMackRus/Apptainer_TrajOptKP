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
    libglfw3-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libeigen3-dev \
    libyaml-cpp-dev \
    libgtest-dev

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

# Install clion with wget and unzipping
#wget https://download.jetbrains.com/cpp/CLion-2022.3.3.tar.gz
#mv CLion-2022.3.3.tar.gz /opt 
#cd /opt 
#tar xvzf CLion-2022.3.3.tar.gz

# Install firefox
apt install -y --force-yes firefox

# Let's have a custom PS1 to help people realise in which container they are
# working.
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[TrajOptKP_apptainer] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV

# Install MuJoCo
git clone git@github.com:DMackRus/mujoco.git mujoco_temp
cd mujoco_temp
mkdir build
cd build
cmake ..
cmake --build .
cmake .. -DCMAKE_INSTALL_PREFIX="~/mujoco"
cmake --install .

#Remove temp MuJoCo directory
cd $HOME
rm -rf mujoco_temp

# Export environment variables to bashrc
echo export MJ_HOME='"'$(pwd)/mujoco'"' >> ~/.bashrc

