FROM ubuntu:14.04
MAINTAINER xenron <xenron@hotmail.com>

# init wheezy docker
RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
  rm -rf /var/cache/debconf/*-old && rm -rf /var/lib/apt/lists/* && rm -rf /usr/share/doc/* && \
  apt-get update -y && \
  echo "`cat /etc/issue.net` Docker Image - philcryer/min-wheezy - `date +'%Y/%m/%d'`" > /etc/motd

RUN apt-get install -y vim tar unzip wget net-tools && \
  apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y
#  rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
#  rm -rf /tmp

# dnsmasq configuration
# ADD dnsmasq/* /etc/

# install serf
#RUN  wget -q -o out.log -P /tmp/ https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_linux_amd64.zip && \
#  rm -rf /bin/serf

#RUN unzip /tmp/serf_0.7.0_linux_amd64.zip -d /bin && \
#  rm /tmp/serf_0.7.0_linux_amd64.zip

# configure serf
#ENV SERF_CONFIG_DIR /etc/serf
#ADD serf/* $SERF_CONFIG_DIR/
#ADD handlers $SERF_CONFIG_DIR/handlers
#RUN chmod +x  $SERF_CONFIG_DIR/event-router.sh $SERF_CONFIG_DIR/start-serf-agent.sh

# install openssh-server
RUN apt-get update && \
  apt-get install -y curl openssh-server nano  && \
  apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y
#  rm -rf /var/lib/{apt,dpkg,cache,log}/

# Java Version
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 111
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE       jdk

# Download and unarchive Java
RUN mkdir -p /opt &&\
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | gunzip -c - | tar -xf - -C /opt &&\
    ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk &&\
    rm -rf /opt/jdk/*src.zip \
         /opt/jdk/lib/missioncontrol \
         /opt/jdk/lib/visualvm \
         /opt/jdk/lib/*javafx* \
         /opt/jdk/jre/lib/plugin.jar \
         /opt/jdk/jre/lib/ext/jfxrt.jar \
         /opt/jdk/jre/bin/javaws \
         /opt/jdk/jre/lib/javaws.jar \
         /opt/jdk/jre/lib/desktop \
         /opt/jdk/jre/plugin \
         /opt/jdk/jre/lib/deploy* \
         /opt/jdk/jre/lib/*javafx* \
         /opt/jdk/jre/lib/*jfx* \
         /opt/jdk/jre/lib/amd64/libdecora_sse.so \
         /opt/jdk/jre/lib/amd64/libprism_*.so \
         /opt/jdk/jre/lib/amd64/libfxplugins.so \
         /opt/jdk/jre/lib/amd64/libglass.so \
         /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
         /opt/jdk/jre/lib/amd64/libjavafx*.so \
         /opt/jdk/jre/lib/amd64/libjfx*.so 

# Set environment
ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

# move all configuration files into container
ADD files/* /usr/local/  

# set jave environment variable 
ENV JAVA_HOME /opt/jdk 
ENV PATH $PATH:$JAVA_HOME/bin

#configure ssh free key access
RUN mkdir /var/run/sshd && \
  ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  mv /usr/local/ssh_config ~/.ssh/config && \
  sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# RUN sysv-rc-conf sshd on
# RUN sed -i '/exit 0/ i /etc/init.d/ssh start' /etc/rc.local

