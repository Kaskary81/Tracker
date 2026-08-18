# Trackers

Material, procurement, design and engineering tracking for the
**MAADEN — TAIF AR RJUM Water Pipeline Project, Package B**.

The site is this repository, served by GitHub Pages:

**https://kaskary81.github.io/Trackers/**

`index.html` is the whole application — one file, no build step, no
dependencies, with the Supabase client compiled in. It reads and writes the
Supabase project it is configured for, so everyone sees the same figures.

## Enabling the site

Settings → Pages → **Source: Deploy from a branch**, branch `main`, folder
`/ (root)` → Save. The first build takes a minute or two.

`.nojekyll` stops GitHub running the files through Jekyll, which would
otherwise ignore anything beginning with an underscore.

## Anything committed here is public

GitHub Pages serves every file in this repository to anyone with the URL, and
on a free account the repository itself must be public. So this repository
holds the application only.

**Do not commit** the comparison data — `maaden_comparisons.sql`, the filled
offline build, or the load report. They carry vendor prices, rates and
commercial terms. Keep them on your own disk.

The Supabase URL and anon key in `index.html` are meant to be public: every
table has row-level security on and every policy is granted to `authenticated`
only, so the key on its own reads nothing. A sign-in is still required.

## Changing which database it points at

The `APP_CONFIG` block near the top of `index.html` holds the project URL and
anon key. Change those two values and the app talks to a different project.
