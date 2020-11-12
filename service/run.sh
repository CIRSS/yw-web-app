#!/bin/bash

# avoid error message on ctrl-c
cleanup() {
    echo
    exit 0
}
trap cleanup EXIT

echo
echo "--------------------------------------------------------------------------"
echo "The YesWorkflow web app service has been started in the REPRO."
echo "Connect to it by navigating in a web browser to http://localhost:8080 "
echo
echo "Terminate the service by typing CTRL-C in this terminal."
echo "--------------------------------------------------------------------------"


# run the yw-editor-web service and discard output to terminal
sudo ${JAVA_HOME}/bin/java                                      \
    -jar ~/yw-editor-webapp/target/yw-editor-app-0.2.1.2.jar    \
    --server.port=8080 > /dev/null