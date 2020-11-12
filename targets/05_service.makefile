## 
##    --- Targets for managing the service provided by this REPRO ---
## 

start-service:          ## Start the service provided by this REPRO.
	@echo "\n--------------------------------------------------------------------------"
	@echo "The YesWorkflow web app service will now be started in the REPRO."
	@echo "Connect to it by navigating in a web browser to http://localhost:8080 "
	@echo
	@echo "Terminate the service by typing CMD-C or CTRL-C in this terminal."
	@echo "--------------------------------------------------------------------------"
	@$(REPRO_RUN_COMMAND) $(REPRO_SERVICE_COMMAND)

debug-service:          ## Start the service provided by this REPRO with debugging.
	$(REPRO_RUN_COMMAND) $(REPRO_SERVICE_DEBUG_COMMAND)
