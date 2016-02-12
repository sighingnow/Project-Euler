## Makefile script to build pdf documentation.

PANDOC 				:= pandoc
LS					:= ls
LATEX_ENGINE		:= xelatex
TEMPLATE 			:= template.tex
TARGET_DOC			:= project-euler-solutions.pdf
PANDOC_FLAGS		:= --template=$(TEMPLATE) 		\
					--latex-engine=$(LATEX_ENGINE) 	\
					--number-sections 				\
					--chapters 						\
					--from=markdown 				\
					--to=latex 						\
					--output=$(TARGET_DOC)
META_FILE 			:= meta.txt
MD_FILES 			:= solutions/*.md

all: format build

build:
	$(PANDOC) $(META_FILE) `$(LS) $(MD_FILES)` $(PANDOC_FLAGS)
.PHONY: build

format:
	@./format.sh
.PHONY: format

submit:
	git push github master
.PHONY: submit

