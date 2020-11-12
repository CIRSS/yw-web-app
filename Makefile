# detect if Make is running on Windows
ifeq ('$(OS)', 'Windows_NT')
PWSH=powershell -noprofile -command
endif

# display help if no target is specified
default_target: help

# read the repro customization file
include repro.config

# load the generic make targets
include targets/01_setup.makefile
include targets/02_aliases.makefile
include targets/05_service.makefile
include targets/06_image.makefile
include targets/07_docker.makefile
include targets/08_help.makefile

