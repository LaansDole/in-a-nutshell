SHELL := /bin/bash
.PHONY: serve
serve:
	mkdocs serve
.PHONY: build
build:
	mkdocs build
.PHONY: deploy
deploy:
	git fetch
	mkdocs gh-deploy --config-file mkdocs.yml --remote-branch gh-pages