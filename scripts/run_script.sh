#!/bin/bash

# TODO: cd into the dir you joust binded
# TODO: make/build
# TODO: running the unit tests

if [ ! -d "$HOME/TrajOptKP" ]; then
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
	echo export PATH="/opt/clion-2022.3.3/bin:{PATH}"

    	git clone --recursive git@github.com:DMackRus/TrajOptKP.git

    	cd $HOME
    
fi


source $HOME/.bashrc
alias xterm="xterm -fa 'Monospace' -fs 14 &"
