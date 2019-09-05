#!/usr/bin/env bash

# 需要事先在环境变量中配置参数 jenkins_docker_workspace，
# 指向jenkins docker workspace

export container_name=qianJenkins

echo "The jenkins workspace is ${jenkins_docker_workspace}"

docker stop ${container_name}
docker rm ${container_name}

#docker image update
docker rmi jenkins:update
docker build -t jenkins:update .

docker run -d --name ${container_name} -p 8081:8080 -p 50000:50000 \
    --env JAVA_OPTS="-Dfile.encoding=UTF8 -Duser.timezone=GMT+08" \
    -v ${jenkins_docker_workspace}:/var/jenkins_home \
    --dns=114.114.114.114 -u 0  jenkins:update

# 没有配置时间
#docker run -d --name ${container_name} -p 8081:8080 -p 50000:50000 \
#    -v ${jenkins_docker_workspace}:/var/jenkins_home \
#    --dns=114.114.114.114 -u 0  jenkins:latest

