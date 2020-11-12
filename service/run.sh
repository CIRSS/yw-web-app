#!/bin/bash

# avoid error message on ctrl-c
cleanup() {
    echo
    exit 0
}
trap cleanup EXIT

# run the yw-editor-web service and discard output to terminal
sudo ${JAVA_HOME}/bin/java                                      \
    -jar ~/yw-editor-webapp/target/yw-editor-app-0.2.1.2.jar    \
    --server.port=8080 > /dev/null