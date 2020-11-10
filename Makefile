TARGETS=.repro/Makefile.targets

include ${TARGETS}/Makefile.init
include repro.config
include ${TARGETS}/Makefile.setup
#include ${TARGETS}/Makefile.examples
#include ${TARGETS}/Makefile.code
include ${TARGETS}/Makefile.image
include ${TARGETS}/Makefile.docker
include ${TARGETS}/Makefile.help

