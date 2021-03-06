# define ROOTDIR before using this makefile fragment
include $(ROOTDIR)/mk/base.mk

OCAMLC ?= ocamlc.opt
OCAMLOPT ?= ocamlopt.opt
OCAMLDEP ?= ocamldep.opt
OCAMLDSORT ?= miragedsort.opt
OCAMLDOC ?= ocamldoc.opt
OCAMLJS ?= ocamljs

OCAMLPACK ?= ocamlpack
OCAMLOPT_FLAGS=

ifeq ($(ARCH),x86_64)
  ifneq ($(OS),macosx)  # MacOS X does not support absolute addressing
    OCAMLOPT_FLAGS = -fno-PIC -nodynlink -g
  endif
else
OCAMLOPT_FLAGS = -g
endif

OCAML_CLIBS_linux = -lm
OCAML_CLIBS = $(OCAML_CLIBS_$(OS))
