sudo docker rm -f foundationpose
DIR=$(pwd)/../
xhost +  && sudo docker run --gpus all --env NVIDIA_DISABLE_REQUIRE=1 -it --network=host --name foundationpose  --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $DIR:$DIR -v /home:/home -v /mnt:/mnt -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp:/tmp  --ipc=host -e DISPLAY=${DISPLAY} -e GIT_INDEX_FILE foundationpose:latest bash -c "cd $DIR && bash"

# note-by-kai: 
# in my situation, "bash run_container.sh" can only be excuted from MobaXterm terminal, or from 
# vscode terminal with MobaXterm being connected/opened. Command "xclock" requires the same.