FROM ubuntu:16.04
RUN apt-get update && \
    apt-get -y install curl software-properties-common lsb-release apt-transport-https && \
    curl -fsSL https://yum.dockerproject.org/gpg | apt-key add - && \
    add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -y install docker-engine docker-compose
    
COPY swarmentry /opt/swarmentry/
WORKDIR /opt/swarmentry
ENTRYPOINT ["/opt/swarmentry/swarmentry"]
