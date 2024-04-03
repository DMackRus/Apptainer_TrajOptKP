#!/bin/bash
source /opt/ros/noetic/setup.bash

if [ ! -d "$HOME/catkin_ws/devel" ]; then
    cd $HOME/catkin_ws/src
    git clone git@github.com:roboticsleeds/moveit.git; cd moveit; git checkout noetic-devel; cd ..
    git clone git@github.com:roboticsleeds/moveit_msgs
    git clone git@github.com:roboticsleeds/panda_moveit_config.git

    git clone git@github.com:DMackRus/mujocoLib.git
    git clone git@github.com:DMackRus/automaticTOTaskSpecification.git autoTOTask
    cd $HOME/catkin_ws/src/autoTOTask
    git clone git@github.com:DMackRus/Franka-emika-panda-arm.git

    cd $HOME/catkin_ws/src/

    git clone git@github.com:DMackRus/drakeTest.git

    #Install yaml-cpp
    git clone git@github.com:jbeder/yaml-cpp.git
    cd yaml-cpp 
    mkdir build
    cd build 
    cmake ..
    make 
    make install 

    cd $HOME/catkin_ws/src/

    git clone git@github.com:roboticsleeds/franka_ros.git
    cd $HOME/catkin_ws/src/franka_ros
    git submodule update --init --recursive

    cd $HOME/catkin_ws/
    catkin_make
fi

source $HOME/catkin_ws/devel/setup.bash
source $HOME/.bashrc
alias xterm="xterm -fa 'Monospace' -fs 14 &"

