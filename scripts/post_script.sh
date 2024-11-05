-c /bin/bash

apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

apt-get install -y \
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
    python-is-python3 \
    psmisc \
    apt-utils \
    python3-pip \
    mesa-utils \
    libglfw3 \
    libglfw3-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libeigen3-dev \
    libyaml-cpp-dev \
    libgtest-dev \
    libpng-dev

# Install clion with wget and unzipping
wget https://download.jetbrains.com/cpp/CLion-2022.3.3.tar.gz
mv CLion-2022.3.3.tar.gz /opt 
cd /opt 
tar xvzf CLion-2022.3.3.tar.gz

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

