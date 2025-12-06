# GitHub Copilot / AI agent instructions

Purpose: help an AI coding agent be immediately productive in this repository.

- Big picture
  - Static site built with MkDocs + Material theme. Sources live in `markdown/`; generated site is written to `public/` ([mkdocs.yml](mkdocs.yml)).
  - Theme customizations and build hooks are in `overrides/` (Python hooks + theme assets).
  - A parallel Gemini site lives in `gmi/` (different format, separate publishing flow).
  - Cloudflare Pages / Workers integration: see `wrangler.jsonc` (publishes assets from `public/`).

- Key workflows (concrete commands)
  - Install dependencies (preferred): `pipenv install` (or `pip install -r requirements.txt`). See [Pipfile](Pipfile) and [requirements.txt](requirements.txt).
  - Local preview: `mkdocs serve --watch overrides --watch-theme --livereload` or `pipenv run dev` (see `Pipfile` scripts and [mkdocs.yml](mkdocs.yml)).
  - Build site: `pipenv run build` or `pipenv run build -f mkdocs.readthedocs.yml` (build targets in `Pipfile` and `build.sh`). `build.sh` copies favicon into `public/` after build.
  - Cloudflare deploy (manual): `npm run deploy` -> `wrangler deploy` (see `package.json` and [wrangler.jsonc](wrangler.jsonc)). CI deploy logic uses `npx wrangler pages publish` in `bin/deploy.sh` when running under CI.
  - CI: deployments happen via GitLab CI; do not rely on a repository-local Docker CI image.

- Project-specific conventions & patterns
  - Content separation: author-managed Markdown in `markdown/` is canonical. Do not edit `public/` — it is generated.
  - Theme overrides and custom assets live in `overrides/`; changes there affect build behavior and the site theme.
  - The build copies `assets/images/favicon.png` to `public/favicon.ico` after building (see `build.sh` and `bin/build.sh`). Keep favicon at that path.
  - Python environment targets Python 3.13 (see `Pipfile`). The repo commonly uses `pipenv` and a `.venv` pattern in local scripts (`bin/localdev.sh`).
  - CI: deployments happen via GitLab CI and `bin/deploy.sh` (see `wrangler.jsonc` for Cloudflare Pages configuration).

- Integration points & external dependencies
  - Cloudflare Pages / Workers via `wrangler`/`wrangler.jsonc` (assets directory: `./public`).
  - CI builds run on GitLab. Avoid referencing the `docker/` folder — it may be moved to a separate repo.
  - `npm` is used only for `wrangler` dev/deploy and Docker convenience scripts (`package.json`).

- Helpful files to inspect
  - Repository README: [README.md](README.md)
  - MkDocs config: [mkdocs.yml](mkdocs.yml)
  - Build scripts: [build.sh](build.sh) and [bin/build.sh](bin/build.sh)
  - CI/deploy: [bin/deploy.sh](bin/deploy.sh) and [wrangler.jsonc](wrangler.jsonc)
  - Python deps: [Pipfile](Pipfile) and [requirements.txt](requirements.txt)
  -

- What NOT to do
  - Do not edit generated files under `public/` directly — change sources in `markdown/` or `overrides/`.
  - Avoid changing `site_dir` or `assets` layout without verifying `wrangler.jsonc` and `bin/deploy.sh` updates.

- If you need clarification
  - Ask the maintainer which mirror/CI (GitLab primary) you want to target before modifying CI configs.

- Next steps
  - If you want, I can expand the CI section with example GitLab job snippets or add examples for contributing patches.

- Commit attribution
  - Adopt the `Assisted-by` commit trailer for AI-assisted changes to comply with attribution policies.
  - Required trailer format (commit footer):

```
Assisted-by: <Model Name> via <Tool Name>
```

  - Example:

```
Assisted-by: GLM 4.6 via Claude Code
```

  - Repository also requires Linux DCO sign-off for patches. Ensure commits include `Signed-off-by:` lines in the footer alongside `Assisted-by:` when applicable.

If any section is unclear or you want deeper examples (e.g., contributing workflow, CI job templates), tell me which area to expand.

- Example: GitLab CI snippet
  - Minimal job that builds the site and publishes to Cloudflare Pages using `wrangler`.

```yaml
stages:
  - build
  - deploy

build_site:
  stage: build
  image: node:20-bullseye
  script:
    - pip install pipenv
    - pipenv install --deploy --ignore-pipfile
    - pipenv run build
  artifacts:
    paths:
      - public/

publish_pages:
  stage: deploy
  image: node:20-bullseye
  dependencies:
    - build_site
  script:
    - npm install -g wrangler
    - npx wrangler pages publish public --project-name "$CF_PAGES_PROJECT_NAME" --branch "$CI_COMMIT_BRANCH"
  only:
    - main
```

  - Notes: set `CF_PAGES_PROJECT_NAME` in CI variables; the repo's `bin/deploy.sh` also contains an example `npx wrangler pages publish` invocation used by CI.
