## 
## --- Targets for managing Docker containers and images on the host ---
## 

ifndef IN_RUNNING_REPRO

stop-all-containers:    ## Gently stop all running Docker containers.
ifdef PWSH
	${PWSH} 'docker ps -q | % { docker stop $$_ }'
else
	for c in $$(docker ps -q); do docker stop $$c; done
endif

kill-all-containers:    ## Forcibly stop all running Docker containers.
ifdef PWSH
	${PWSH} 'docker ps -q | % { docker kill $$_ }'
else
	for c in $$(docker ps -q); do docker kill $$c; done
endif

remove-all-containers:  ## Delete all stopped Docker containers.
ifdef PWSH
	${PWSH} 'docker ps -aq | % { docker rm $$_ }'
else
	for c in $$(docker ps -aq); do docker rm $$c; done
endif

remove-all-images:      ## Delete all Docker images on this computer.
ifdef PWSH
	${PWSH} 'docker images -aq | % { docker rmi $$_ }'
else
	for i in $$(docker images -aq); do docker rmi $$i; done
endif

purge-docker:           ## Purge all Docker containers and images from computer.
purge-docker: stop-all-containers kill-all-containers remove-all-containers remove-all-images

endif
