bootstrap:docker
From:ubuntu:22.04

%labels

AUTHOR David Russell 

%environment
    export LANG=C.UTF-8
    export LC_ALL=C.UTF-8
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/clion-2022.3.3/bin

%files
  scripts /scripts

%post
  /scripts/post_script.sh

%runscript
  exec /bin/bash "$@" --rcfile /scripts/run_script.sh
