# Reproducible-Every-Place Research Objects (REPROs)

This repository provides a description and template for REPROs: *Reproducible-Every-Place Research Objects*.

## What is a REPRO?

A REPRO is a version-controlled code/data repository that (a) demonstrates the validity of one or more computational processes and associated results; (b) provides within it the means to execute the processes to yield those results on one's own computer; (c) makes it easy to check that these processes and results match well-defined expectations; (d) does all of this in a transparent manner such that the computations performed can be confirmed to match the provided description.

## General requirements for REPROs

To qualify as a REPRO a repository must meet these requirements:

1. The code in the REPRO must be runnable on any computer meeting some minimal hardware and software requirements for running REPROs generally. A REPRO must not require that a particular operating system be used, nor may it require installing additional software specific to the REPRO. Simple REPROs that use this repo as a template require only that `Git`, `Docker`, and `GNU Make` be installed on the user's computer and will run on Linux, macOS, and Windows-based systems, among others.

2. Running the REPRO should require nothing more than cloning the repository onto the local machine, and issuing a single command from a terminal session in the top-level directory of the cloned repository.

3. The contents and operation of a REPRO should be transparent with respect to the computer on which it is running. The user of a REPRO should be able to use the terminal, editors, web browsers, and other software tools already installed on the computer to interact with the running REPRO, to modify the data or code in the REPRO, and to inspect the code and data employed in the REPRO.

## *Git-Docker-Make* REPROs

This repository provides a template for simple REPROs that require only that `Git`, `Docker`, and `GNU Make` be installed on a user's machine.  The essential components of a *Make-Docker REPRO* are:

* A `Git` repository that provides any essential components of the REPRO including code and data.

* A `Dockerfile` in the top-level directory of the REPRO that defines the computing environment required to execute the analysis represented by the REPRO.

* A `Makefile` in the top-level directory of the REPRO that provides targets for building and starting the REPRO, for running the computations represented by the REPRO, and for comparing the results of those computations against the expected results.

## What makes a REPRO more than a Git repo and Docker image?

A key property of a *Git-Docker-Make* REPRO is that any `Make` target that starts the REPRO docker container must mount the repository cloned on the user's computer at a predefined location within the running container, and must perform all of its work within the directory tree under this mount point.

The REPRO convention is that the clone of the Git repository `<repro_name>` on the user's computer is mounted under the `/mnt/<repro_name>` directory within the running container.  All products of computations performed in the container are stored under this mount point and so can be accessed from outside the container both while the container is running, and when the container is stopped.  Whenever a terminal sessio is started in the REPRO the working directory is set automatically to `/mnt/<repro_name>` so that the user's working directory appears unchanged.





