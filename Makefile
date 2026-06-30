# aha-astrolab2 — MkDocs Material site
#
# First time:  make install
# Day to day:  make serve   (live preview at http://localhost:8000)

VENV := .venv
PY := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
MKDOCS := $(VENV)/bin/mkdocs

# Create the virtualenv and install dependencies
install:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Live preview with auto-reload
serve:
	$(MKDOCS) serve

# Build the static site into ./site and fail on any broken link/nav
build:
	$(MKDOCS) build --strict

# Build and force-deploy to the gh-pages branch (CI does this automatically on push)
deploy:
	$(MKDOCS) gh-deploy --force

# Remove the built site
clean:
	rm -rf site

.PHONY: install serve build deploy clean
