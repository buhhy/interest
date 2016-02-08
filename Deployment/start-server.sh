#!/bin/bash

cur_dir="$(dirname "$0")"
cd $cur_dir
source settings.sh
mkdir -p $log_folder
echo "Starting server..."
nohup $server_folder/bin/$server_name \
    -Dhttp.port=$server_port \
    -mem $server_memory \
    -J-server \
    1> $log_folder/output.log \
    2> $log_folder/error.log & \
    echo $!
