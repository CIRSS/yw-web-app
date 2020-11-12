## 
## --- Aliases for targets in this Makefile ---
## 

# Define target aliases available both inside and outside a running REPRO
run:   start-service    ## Run the service provided by this REPRO.
debug: debug-service    ## Run the service provided by this REPRO with debugging.

# Define target aliases available only outside a running REPRO
ifndef IN_RUNNING_REPRO
image: build-image      ## Build the Docker image used to run this REPRO.
endif
