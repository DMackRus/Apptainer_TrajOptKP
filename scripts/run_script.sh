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
fi

source $HOME/.bashrc
alias xterm="xterm -fa 'Monospace' -fs 14 &"

