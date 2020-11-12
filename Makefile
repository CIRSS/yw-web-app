# detect if Make is running on Windows
ifeq ('$(OS)', 'Windows_NT')
PWSH=powershell -noprofile -command
endif

default_target: help

include repro.config
include targets/*.makefile

