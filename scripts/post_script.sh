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
    libgtest-dev \
    libpng-dev

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
wget https://download.jetbrains.com/cpp/CLion-2022.3.3.tar.gz
mv CLion-2022.3.3.tar.gz /opt 
cd /opt 
tar xvzf CLion-2022.3.3.tar.gz

# Install firefox
apt install -y --force-yes firefox

# Install CUDA-12.4
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda-repo-ubuntu2004-12-4-local_12.4.0-550.54.14-1_amd64.deb
dpkg -i cuda-repo-ubuntu2004-12-4-local_12.4.0-550.54.14-1_amd64.deb
cp /var/cuda-repo-ubuntu2004-12-4-local/cuda-*-keyring.gpg /usr/share/keyrings/
apt-get update
apt-get -y install cuda-toolkit-12-4

# Always slightly unsure about this last command, this is the legacy kernel module flavor?
apt-get install -y cuda-drivers

# ------------ Clone pngwriter and build from source -----------------------
git clone https://github.com/pngwriter/pngwriter.git

mkdir -p pngwriter-build
cd pngwriter-build

# for own install prefix append: -DCMAKE_INSTALL_PREFIX=$HOME/somepath
cmake ../pngwriter

make -j

# optional
make test

# sudo is only required for system paths
make install
# -----------------------------------------------------------------------------

# Let's have a custom PS1 to help people realise in which container they are
# working.
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[TrajOptKP_apptainer] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV

