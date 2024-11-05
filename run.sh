#!/bin/bash
# --contain without binding /dev was causing some strange CPU usage whenever MuJoCo
# was running, two solutions found: not using --contain at all, or using --contain and
# binding host's /dev to container.

rm -rf workdir/*

singularity run \
    --contain \
    $(if lspci | grep -qi nvidia; then echo ' --nv'; else echo ''; fi) \
    $(if [ -f "${HOME}/.gitconfig" ]; then echo ' --bind='${HOME}'/.gitconfig'; else echo ''; fi) \
    $(if [ -f "${HOME}/.vimrc" ]; then echo ' --bind='${HOME}'/.vimrc'; else echo ''; fi) \
    --bind=/etc/hosts \
    --bind=/etc/localtime \
    --workdir=workdir \
    --bind=/proc \
    --bind=/sys \
    --bind=/dev \
    --bind=scripts:/scripts \
    --bind=/run/user/${UID} \
    --home=home:${HOME} \
    --bind /usr/lib/x86_64-linux-gnu:/host-libs \
    --bind=$HOME/.ssh \
    TrajOptKP_apptainer
    
    #--bind /usr/lib/x86_64-linux-gnu/libGL.so.1:/usr/lib/x86_64-linux-gnu/libGL.so.1 \
    #--bind /usr/lib/x86_64-linux-gnu/libnvidia-glcore.so.550.120:/usr/lib/x86_64-linux-gnu/libnvidia-glcore.so.550.120 \
    #--bind /usr/lib/x86_64-linux-gnu/libnvidia-tls.so.550.120:/usr/lib/x86_64-linux-gnu/libnvidia-tls.so.550.120 \
    #--bind /usr/lib/x86_64-linux-gnu/libGLX_nvidia.so.0:/usr/lib/x86_64-linux-gnu/libGLX_nvidia.so.0 \
    #--bind /usr/lib/nvidia:/usr/lib/nvidia \
    
    #--bind /usr/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu \
    
    
    
    
    
    
    
    
