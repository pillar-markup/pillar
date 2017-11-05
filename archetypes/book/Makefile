.DEFAULT_GOAL = help

PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar
MUSTACHE_EXEC ?= $(PILLAR_HOME)/mustache

# Redirect to bootstrap makefile if pillar is not found
PILLAR ?= $(wildcard $(PILLAR_HOME)/pillar)
ifeq (,$(PILLAR))
	include support/makefiles/bootstrap.mk
else
	include support/makefiles/main.mk
endif
