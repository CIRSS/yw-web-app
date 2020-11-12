## 
## --- Targets for managing the Docker image for this REPRO ---
## 

ifndef IN_RUNNING_REPRO

start-image:            ## Start a new container using the Docker image.
	$(REPRO_RUN_COMMAND)

build-image:            ## Build the Docker image used to run this REPRO.
	docker build -t ${REPRO_IMAGE} .

pull-image:             ## Pull the Docker image from Docker Hub.
	docker pull ${REPRO_IMAGE}

push-image:             ## Push the Docker image to Docker Hub.
	docker push ${REPRO_IMAGE}

endif
