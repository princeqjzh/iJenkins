#从tomcat的镜像开始创建
FROM jenkins:latest

USER root

#声明作者
MAINTAINER tester "tester@hogwarts.com"

ARG JENKINS_HOME=/var/jenkins_home
ARG REF=/usr/share/jenkins/ref

#清理docker镜像中已有的内容
#RUN chmod 755 /usr/share/jenkins/jenkins.war
RUN rm -f /usr/share/jenkins/jenkins.war
#RUN mkdir /usr

#下载新的jenkins.war
USER jenkins

RUN cd /usr/share/jenkins/
ADD jenkins.war .

#对外暴露8080端口
EXPOSE 8080 50000

#执行启动jenkins命令
#CMD ["java", "-Dfile.encoding=UTF8 -Duser.timezone=GMT+08", "-jar", "jenkins.war"]
#CMD ["java", "-jar", "jenkins.war", "-Dfile.encoding=UTF8 -Duser.timezone=GMT+08"]
CMD ["export"]