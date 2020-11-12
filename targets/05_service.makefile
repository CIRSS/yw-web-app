## 
## --- Targets for managing the service provided by this REPRO ---
## 

start-service:          ## Start the service provided by this REPRO.
	$(RUN_IN_REPRO) $(REPRO_SERVICE_COMMAND)

debug-service:          ## Start the service provided by this REPRO with debugging.
	$(RUN_IN_REPRO) $(REPRO_SERVICE_DEBUG_COMMAND)
