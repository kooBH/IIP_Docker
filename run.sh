#! /bin/sh

### X11 forwarding 용 구문 ###
# XSOCK=/tmp/.X11-unix
# XAUTH=/tmp/.docker.xauth
# xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH iip:v4


# 현재 폴더에서 Dockerfile 로 iip:v7 라는 이미지를 생성합니다. 
docker build . -t iip:v7
# iip:v6 이미지로 working 이라는 이름을 가진 컨테이너를 만듭니다.
# 현재 폴더의 data 폴더를 docker conatiner의 /home/data 폴더와 공유합니다.
# host와 docker container 양쪽에서 같은 파일을 조작할 수 있습니다.
# 터미널로 /bin/sh를 실행합니다.
docker run --name working -v ${PWD}/data/:/home/data/ -it iip:v7 /bin/sh

