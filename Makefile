SHELL := /usr/bin/env bash

MAKEFLAGS += --warn-undefined-variables
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help
.DELETE_ON_ERROR:
.SUFFIXES:


.PHONY: help
help: ## Show this help
	@grep -E -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = "(: ).*?## "}; {gsub(/\\:/,":",$$1)}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: module\:diff
module\:diff: ## Show a diff of all modules. Makes most sense after running 'msync update --noop'
	@find modules -type d -name .git | xargs dirname | xargs -I '%' make diff -e dir=%

.PHONY: diff
diff: dir = .
diff: ## Show the diff of a single directory (set with '-e dir=my-dir', default: .)
	@cd $(dir) && \
	echo =========== SHOWING DIFF OF $(dir) ================ && \
	git diff HEAD~1..HEAD
