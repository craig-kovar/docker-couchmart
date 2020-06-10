#Test image from tomcat with Git and Maven
FROM python:2.7.15-jessie
MAINTAINER craig.kovar@couchbase.com

RUN apt-get update
RUN apt-get -y install lsb-release && apt-get -y install sudo && apt-get -y install vim && apt-get -y install psmisc

RUN mkdir /couchmart && chmod 777 /couchmart
RUN wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-4-amd64.deb
RUN sudo dpkg -i couchbase-release-1.0-4-amd64.deb

RUN apt-get update
RUN sudo apt-get -y install libcouchbase-dev libcouchbase2-bin build-essential

RUN sudo pip install couchbase tornado twisted flask

RUN git clone https://github.com/couchbaselabs/couchmart-demo.git /couchmart && chmod 777 /couchmart/*.py

COPY scripts /scripts
RUN chmod 777 /scripts/restart_couchmart.sh

COPY solutions /solutions

CMD tail -f /dev/null
