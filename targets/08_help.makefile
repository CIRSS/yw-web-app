## 
## --- Targets for learning about this REPRO and Makefile ---
## 

help:                   ## Show this help.
ifdef PWSH
	@${PWSH} "Get-ChildItem targets | Select-String -Pattern '#\# ' | % {$$_.Line.replace('##','')}"
else
	@sed -ne '/@sed/!s/#\# //p' $(MAKEFILE_LIST)
endif

## 
## 