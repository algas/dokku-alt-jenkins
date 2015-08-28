FROM ubuntu:trusty
MAINTAINER Masahiro Yamauchi <sgt.yamauchi@gmail.com>

RUN apt-get update -y
RUN apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y wget
RUN apt-get install -y git-core
RUN apt-get install -y fakeroot

RUN adduser --home /jenkins --disabled-login --gecos 'Jenkins' jenkins
RUN wget -O /jenkins.war http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war

USER jenkins
ENV JENKINS_HOME /var/lib/jenkins

# Start everything
EXPOSE 5000
CMD ["java", "-jar", "/jenkins.war", "--httpPort=5000", "--ajp13Port=-1", "--httpsPort=-1"]
