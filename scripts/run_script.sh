#!/bin/bash

if [ ! -d "$HOME/TrajOptKP" ]; then
    git clone --recursive git@github.com:DMackRus/TrajOptKP.git

    #Install yaml-cpp
    git clone git@github.com:jbeder/yaml-cpp.git
    cd yaml-cpp 
    mkdir build
    cd build 
    cmake ..
    make 
    make install 

    cd $HOME
    
    # Install MuJoCo
    git clone git@github.com:DMackRus/mujoco.git mujoco_temp
    cd mujoco_temp
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX="~/mujoco"
    cmake --install .
    
    #Remove temp MuJoCo directory
    cd $HOME
    rm -rf /mujoco_temp
    
    # Export environment variables to bashrc
    echo export MJ_HOME='"'$(pwd)/mujoco'"' >> ~/.bashrc

    
fi



source $HOME/.bashrc
alias xterm="xterm -fa 'Monospace' -fs 14 &"

