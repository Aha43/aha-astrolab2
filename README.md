# aha-astrolab2

Equipment manual and observing notes for the **aha-astrolab** astronomy setup — solar
observation in H-Alpha and white light, with general astronomy to follow.

Built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/). Content is plain
Markdown under [`docs/`](docs/); the site is published to GitHub Pages automatically on every
push to `main`.

**Live site:** https://aha43.github.io/aha-astrolab2/

## Local development

```sh
make install   # one time: create .venv and install MkDocs Material
make serve     # live preview at http://localhost:8000
make build     # build into ./site and fail on any broken link (--strict)
```

(Requires Python 3.) Editing the site means editing Markdown files in `docs/` — see
[`CLAUDE.md`](CLAUDE.md) for the content conventions (figures, captions, nav).

## Deployment

The GitHub Actions workflow in [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml)
runs `mkdocs gh-deploy` on each push to `main`, publishing the rendered site to the
`gh-pages` branch.
