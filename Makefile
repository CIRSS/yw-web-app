# detect if Make is running on Windows
ifeq ('$(OS)', 'Windows_NT')
PWSH=powershell -noprofile -command
endif

default_target: help

include repro.config
include targets/01_setup.makefile
include targets/02_aliases.makefile
include targets/05_service.makefile
include targets/06_image.makefile
include targets/07_docker.makefile
include targets/08_help.makefile

