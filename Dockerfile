FROM openjdk:8-jdk-slim-buster

ENV REPRO_NAME  yw-web-app
ENV REPRO_MNT   /mnt/${REPRO_NAME}
ENV REPRO_USER  repro
ENV REPRO_UID   1000
ENV REPRO_GID   1000

RUN echo '***** Update packages *****'                                          \
    && apt-get -y update

RUN echo '***** Install packages required for creating this image *****'        \
    && apt -y install apt-utils wget curl makepasswd git                        \
                                                                                \
    && echo '***** Install command-line utility packages *****'                 \
    && apt -y install sudo less file tree graphviz

ENV MAVEN_REPO https://mirrors.gigenet.com/apache/maven/maven-3
ENV MAVEN_VERSION 3.6.3
ENV MAVEN_RELEASE_DIR ${MAVEN_REPO}/${MAVEN_VERSION}/binaries
ENV MAVEN_RELEASE_NAME apache-maven-${MAVEN_VERSION} 
ENV MAVEN_ARCHIVE ${MAVEN_RELEASE_NAME}-bin.tar.gz
ENV MAVEN_BIN_DIR /opt/${MAVEN_RELEASE_NAME}/bin
ENV MAVEN_CMD ${MAVEN_BIN_DIR}/mvn

RUN echo '***** Download and build maven *****'                             \
    && cd /opt                                                              \
    && wget -O ${MAVEN_ARCHIVE} ${MAVEN_RELEASE_DIR}/${MAVEN_ARCHIVE}  \
    && tar -xvf ${MAVEN_ARCHIVE}                                            

RUN echo '***** Add the REPRO user and group *****'                         \
    && groupadd ${REPRO_USER} --gid ${REPRO_GID}                            \
    && useradd ${REPRO_USER} --uid ${REPRO_UID} --gid ${REPRO_GID}          \
        --shell /bin/bash                                                   \
        --create-home                                                       \
        -p `echo repro | makepasswd --crypt-md5 --clearfrom - | cut -b8-`   \
    && echo "${REPRO_USER} ALL=(ALL) NOPASSWD: ALL"                         \
            > /etc/sudoers.d/${REPRO_USER}                                  \
    && chmod 0440 /etc/sudoers.d/repro

ENV HOME /home/${REPRO_USER}
ENV BASHRC ${HOME}/.bashrc
USER  ${REPRO_USER}
WORKDIR $HOME

RUN echo '***** Clone the yw-prototypes project repo and build *****'       \
 && git clone https://github.com/yesworkflow-org/yw-prototypes.git          \
 && cd yw-prototypes                                                        \
 && ${MAVEN_CMD} install

RUN echo '***** Clone the yw-graph-service project repo and build *****'    \
 && git clone https://github.com/yesworkflow-org/yw-graph-service.git       \
 && cd yw-graph-service                                                     \
 && ${MAVEN_CMD} install

RUN echo '***** Clone the yw-editor-webapp project repo and build *****'    \
 && git clone https://github.com/yesworkflow-org/yw-editor-webapp.git       \
 && cd yw-editor-webapp                                                     \
 && ${MAVEN_CMD} install

RUN echo 'PATH=${MAVEN_BIN_DIR}:$PATH' >> ${BASHRC}
RUN echo "export IN_RUNNING_REPRO=${REPRO_NAME}" >> ${BASHRC}
RUN echo "cd ${REPRO_MNT}" >> ${BASHRC}

CMD  /bin/bash -il
