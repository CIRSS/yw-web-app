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

1. Ensure that Git, Docker, and GNU Make are installed (it is OK if the versions differ on your system):

	```
	$ git --version
	git version 2.29.1.windows.1d

	$ docker --version
	Docker version 19.03.13, build 4484c46d9d

	$ make --version
	GNU Make 4.3
	Built for Windows32
	Copyright (C) 1988-2020 Free Software Foundation, Inc.
	License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.
	```
2. Clone this repo with options ensuring the line-endings are Linux-compatible on all platforms:

	```
	$ git clone https://github.com/cirss/yw-web-app.git --config core.eol=lf --config core.autocrlf=input
    ```

3. Then `cd` to the top-level directory of the repo:
    ```
    $ cd yw-web-app
	```

4. Run `make` with no arguments to view the targets defined in the Makefile:

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

5. Start the service by invoking the `run` target:

	```
    $ make run

    docker run -it --rm -p 8080:8080 --volume C:/Users/tmcphill/GitRepos/yw-web-app:/mnt/yw-web-app cirss/yw-web-app:latest bash -ic /mnt/yw-web-app/service/run.sh

    --------------------------------------------------------------------------
    The YesWorkflow web app service has been started in the REPRO.
    Connect to it by navigating in a web browser to http://localhost:8080

    Terminate the service by typing CTRL-C in this terminal.
    --------------------------------------------------------------------------
	```

6. Navigate to the web application in your browser at http://localhost:8080.

## Running the service with GitHub Codespaces
1. Create a Codespaces by clickling the link below
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/yilinxia/yw-web-app)
2. Once the Codespaces created, you can start the service by invoking the `run` target:

	```
    $ make run

    docker run -it --rm -p 8080:8080 --volume C:/Users/tmcphill/GitRepos/yw-web-app:/mnt/yw-web-app cirss/yw-web-app:latest bash -ic /mnt/yw-web-app/service/run.sh

    --------------------------------------------------------------------------
    The YesWorkflow web app service has been started in the REPRO.
    Connect to it by navigating in a web browser to http://localhost:8080

    Terminate the service by typing CTRL-C in this terminal.
    ---------------
3. Open the link (Note: If you encounter any error, you can refresh the page, or access the WebAPP from `PORTS -> Local Address`)

## Running the service on a Windows system without Make

There are two alternatives for running the YesWorkflow web app service on Windows systems:

- The preferred approach is install the Make utility using the `Chocolatey` package manager for Windows. Install [Chocolatey](https://chocolatey.org/install). Then install the [GNU make Chocolatey package](https://chocolatey.org/packages/make). The `make` command in the instructions above then will work correctly on a Windows system enabling all the features of this REPRO.

- Alternatively, the YesWorkflow web app service may be run on Windows without installing GNU Make. Clone the [cirss/yw-web-app](https://github.com/cirss/yw-web-app) repository as in step 2 above.  Then invoke the `run.bat` Windows batch file in the top-level directory of the repository:

	```
    C:\Users\tmcphill\GitRepos\yw-web-app> .\run.bat

    --------------------------------------------------------------------------
    The YesWorkflow web app service has been started in the REPRO.
    Connect to it by navigating in a web browser to http://localhost:8080

    Terminate the service by typing CTRL-C in this terminal.
    --------------------------------------------------------------------------	
    ```

## Licensing

All of contents of this repo are licensed under the MIT license. See https://mit-license.org/.


