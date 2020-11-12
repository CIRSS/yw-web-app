# YesWorkflow Web Application

## Overview

The purpose of this repo to enable the service supporting the YesWorkflow web
application to be run on any computer that has Git, Docker, and GNU Make
installed. The versions of Java and Graphviz required to run the service are
preinstalled in a Docker image associated with this repo. This Docker image is
used automatically by the targets in the Makefile as needed. The Makefile in
the top-level directory of the repository provides the means for running the 
service and rebuilding the required Docker image if necessary.

## Running the service

Perform the following steps on a computer running Linux, MacOS, or Windows.

1. Ensure that Git, Docker, and GNU Make are installed:

	```
	$ git --version
	git version 2.11.0

	$ docker --version
	Docker version 19.03.5, build 633a0ea838

	$ make --version
	GNU Make 4.1
	Built for x86_64-pc-linux-gnu
	Copyright (C) 1988-2014 Free Software Foundation, Inc.
	License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.
	```

2. Clone this repo and `cd` to its top-level directory:

	```
	$ git clone https://github.com/cirss/yw-web-app.git
    $ cd yw-web-app
	```

3. Run `make` with no arguments to view the targets defined in the Makefile:

    ```
    $ make

    --- Aliases for targets in this Makefile ---

    run:   start-service     Run the service provided by this REPRO.
    debug: debug-service     Run the service provided by this REPRO with debugging.
    image: build-image       Build the Docker image used to run this REPRO.

    --- Targets for managing the service provided by this REPRO ---

    start-service:           Start the service provided by this REPRO.
    debug-service:           Start the service provided by this REPRO with debugging.

    --- Targets for managing the Docker image for this REPRO ---

    start-image:             Start a new container using the Docker image.
    build-image:             Build the Docker image used to run this REPRO.
    pull-image:              Pull the Docker image from Docker Hub.
    push-image:              Push the Docker image to Docker Hub.

    --- Targets for managing Docker containers and images on the host ---

    stop-all-containers:     Gently stop all running Docker containers.
    kill-all-containers:     Forcibly stop all running Docker containers.
    remove-all-containers:   Delete all stopped Docker containers.
    remove-all-images:       Delete all Docker images on this computer.
    purge-docker:            Purge all Docker containers and images from computer.

    --- Targets for learning about this REPRO and Makefile ---

    help:                    Show this help.
    ```

3. Start the service by invoking the `run` target:

	```
    $ make run

    docker run -it --rm -p 8080:8080 --volume C:/Users/tmcphill/GitRepos/yw-web-app:/mnt/yw-web-app tmcphillips/yw-web-app:latest bash -ic /mnt/yw-web-app/service/run.sh

    --------------------------------------------------------------------------
    The YesWorkflow web app service has been started in the REPRO.
    Connect to it by navigating in a web browser to http://localhost:8080

    Terminate the service by typing CTRL-C in this terminal.
    --------------------------------------------------------------------------
	```

4. Navigate to the web application in your browser at http://localhost:8080.

## Licensing

All of contents of this repo are licensed under the MIT license. See https://mit-license.org/.


