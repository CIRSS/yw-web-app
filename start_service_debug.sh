#!/bin/bash

# echo remaining commands
set -x

# run the yw-editor-web service
sudo ${JAVA_HOME}/bin/java                                      \
    -jar ~/yw-editor-webapp/target/yw-editor-app-0.2.1.2.jar    \
    --server.port=8080