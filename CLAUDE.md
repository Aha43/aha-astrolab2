# aha-astrolab2 — working notes for Claude Code

This is a [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) documentation site.
The content is an equipment manual for a solar/H-Alpha astronomy setup, with general astronomy
planned to follow.

## Layout

- `docs/` — Markdown source (one folder per top-level section, pages one level deep).
- `docs/images/`, `docs/videos/` — media, referenced from pages as `../images/<file>` and
  `../videos/<file>` (every content page sits exactly one folder under `docs/`).
- `mkdocs.yml` — theme, palette (neutral **blue**, light default + dark toggle), and the
  explicit `nav:`. **Add every new page to `nav:`** or it won't appear in the sidebar.
- `site/` — build output, git-ignored. Never edit by hand.

## Adding / editing content

- Pages are plain Markdown. Start each page with a single `# Title` (H1).
- New page: create `docs/<section>/<kebab-name>.md`, then add it under the right section in
  `mkdocs.yml` `nav:` with a human-readable title.

### Figures (image with caption)

Images use a centered Material figure. Width is a percentage via inline style:

```html
<figure markdown="span">
  ![Alt / caption text](../images/your-image.jpg){ style="width:40%;" }
  <figcaption>Caption shown under the image</figcaption>
</figure>
```

### Video

Use a plain `<figure>` (no `markdown="span"` — there's no Markdown to parse inside,
and it avoids stray `<br>` tags). Size videos with `max-width`, not a small percentage:
a small percentage width shrinks the player until its controls can't be clicked.

**Path gotcha:** MkDocs rewrites relative paths inside *Markdown* (`![](../images/x)` becomes
the right depth automatically), but it does **not** touch `src`/`href` inside raw HTML. With
directory URLs (the default), a content page one level under `docs/` lives at a URL two
segments deep, so raw-HTML media must go up **two** levels: `../../videos/...` (same depth
MkDocs emits for the sibling images, `../../images/...`). Using `../videos/` 404s and the
player shows a black screen with dead controls.

```html
<figure>
  <video controls playsinline style="width:100%; max-width:360px;">
    <source src="../../videos/your-clip.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  <figcaption>Caption</figcaption>
</figure>
```

### Callouts (optional)

Use Material admonitions for safety notes — important here since this is solar gear:

```md
!!! warning
    Never point the telescope at the Sun without the correct filters installed.
```

## Verify before committing

```sh
make build   # mkdocs build --strict — fails on any broken link, image, or nav entry
make serve   # visual check at http://localhost:8000
```

## History

This site is a rebuild of the older `aha-astrolab` repo, which used a custom PowerShell
`.txt`-to-HTML generator. Content was migrated to Markdown; the old `_img_`/`_video_`/`_link_`
mini-markup is no longer used.
