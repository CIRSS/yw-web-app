## 
##    --- Targets for managing the service provided by this REPRO ---
## 

start-service:          ## Start the service provided by this REPRO.
	$(REPRO_RUN_COMMAND) $(REPRO_SERVICE_COMMAND)

debug-service:          ## Start the service provided by this REPRO with debugging.
	$(REPRO_RUN_COMMAND) $(REPRO_SERVICE_DEBUG_COMMAND)
