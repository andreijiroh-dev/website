# ~ajhalili2006's website

[![Hosted on pages.dev](https://img.shields.io/badge/hosted%20on-pages.dev-F48120?style=flat-square&logo=cloudflare)](https://pages.dev)
[![Open in Gitpod](https://img.shields.io/badge/open%20in-Gitpod-yellow?style=flat-square&logo=gitpod)](https://gitpod.io/#https://mau.dev/andreijiroh-dev/website)
[![Open in Codespaces](https://img.shields.io/badge/open%20in-Codespaces-black?style=flat-square&logo=github)](https://codespaces.new/andreijiroh-dev/website)
[![GitLab last commit](https://img.shields.io/gitlab/last-commit/andreijiroh-dev/website?gitlab_url=https%3A%2F%2Fmau.dev&style=flat-square)](https://mau.dev/andreijiroh.dev/website/commits)
[![Staging builds on Read The Docs Community](https://readthedocs.org/projects/ajhalili2006/badge/?version=latest&style=flat-square)](https://readthedocs.org/projects/ajhalili2006/)
[![Docker Image Builds](https://github.com/andreijiroh-dev/docker-images/actions/workflows/docker-buildops.yml/badge.svg?event=schedule)](https://github.com/andreijiroh-dev/docker-images/actions/workflows/docker-buildops.yml)
[![GitLab CI status](https://mau.dev/andreijiroh-dev/website/badges/main/pipeline.svg?style=flat-square)](https://mau.dev/andreijiroh-dev/website/-/pipelines)

This is my sources for both [`andreijiroh.dev`](https://andreijiroh.dev) and tilde userpages,
built with Mkdocs + [Material theme](https://go.andreijiroh.eu.org/mkdocs-material) by
[~squidfunk](https://github.com/squidfunk). Sources for Gemini version of the website is
available at `gmi` directory.

## Information for people wishing to use this repository

While this is fairly just static site (with CI configs and even Cloudflare Pages references)
and not licensed under the Zlib license ([context from Xe/site repo][zlib-chaos]), please don't
just fork this repo unless you know what you're REALLY doing.

[zlib-chaos]: https://github.com/Xe/site/blob/HEAD/README.md#information-for-people-wishing-to-use-this-code

If you're pretty serious, please keep several things in mind:

- You must heavily edit the Markdown content of the website. Make your own personal user manual
and portfolio, or heck even go nuts on the homepage.[^1]
- Blog posts I written in Gemini version are licensed under CC-BY-SA-4.0,
[as mentioned below](#legalese) unless specified otherwise.
But [for the love of god], please use your own blog posts when writing for
Gemini users instead.
- For the favicon, use your own profile picture or pick/make another one.

[for the love of god]: https://english.stackexchange.com/questions/351296/what-exactly-does-for-the-love-of-god-mean#351326
[^1]: Please keep it SFW, since you don't want to get that censored by the MTRCB, right?

**Looking for a template instead with same Mkdocs theme?** No problem! [I contributed one at lorebooks.wiki's GitHub org](https://github.com/lorebooks-wiki/mkdocs-material-template)
with some fine defaults, alongside a blog section if you prefer.

## Mirrors

Canonically developed at [GitLab SaaS](https://gitlab.com/andreijiroh-dev/website) (formerly on
[mau.dev](https://mau.dev/andreijiroh-dev/website.git)) where the deployments happen, with the
following mirrors being maintained:

- GitHub: <https://github.com/andreijiroh-dev/website>, where Docker image builds happen
- Sourcehut: <https://git.sr.ht/~ajhalili2006/web>

## Structure

- [`markdown`](./markdown/) - the source Markdown files for the website
- [`overrides`](./overrides) - theme customizations and Mkdocs build hooks in Python

## Site Development

Use the clone links from either the canonical repository URL or its mirrors
[as mentioned above](#mirrors) or open this repo in a cloud development
environment using the `open in` links above.

### Building from source

```bash
# install deps via pipenv...
pipenv install
# ...or via pip3 with --user -flag (generated from "pipenv requirements" and sending its output
# to requirements.txt)
pip install -r requirements.txt --user

# preview site and edit in another session
# if you have pipenv installed, just prefix them with pipenv run
mkdocs serve --watch overrides --watch-theme --livereload
```

### Sending patches

The gist via the CLI:

```bash
# send patches via GitLab or GitHub through the CLI
glab auth login # authenticate CLI against GitLab CI
gh auth login # authenticate CLI, GitHub.com edition
glab -R andreijiroh.dev/website mr create --allow-collaboration -b main
gh -R andreijiroh-dev/website pr create # might automatically closes PR due to mirror status

# or via my public inbox on sourcehut
# see https://git-send-email.io for setup and guide
git config sendemail.to "~ajhalili2006/public-inbox@lists.sr.ht" # NOT my personal email
git config format.subjectPrefix "PATCH web" # identification in archives + builds.sr.ht
git config --global sendemail.annotate yes
git config --global format.signOff true # needed for compliance with Linux DCO
git send-email HEAD^
```

## Contributing

Patches are always welcome, although you must sign-off your commits to comply with the Linux DCO.
Please be reminded that while this is a personal open-source project, please expect long waiting
times during pathc reviews and don't be disappointed when I disagree on stuff and chose not to merge
the patches for any reasons, including mental health breaks.

## Legalese

Unless otherwise noted, source code is licensed under the MPL-2.0 while website content
(text and ooriginal graphics) is under CC BY-SA 4.0.

For my profile picture (which used as a favicon anyways), while it is technically under CC BY-SA 4.0
([see Wikimedia Commons for context][commonspage]), please note that [I still retain personality rights][wikic-pr]
there.

### Third-party code

- [OpenWeb Icons Set](https://iconduck.com/sets/openweb-icons-set) ([source code](https://github.com/pfefferle/openwebicons?ref=iconduck.com))- [SIL Open Font License 1.1](https://github.com/pfefferle/openwebicons/blob/main/License.txt)
- Upstream template code from Material for Mkdocs for overrides directory - MIT

[commonspage]: https://commons.wikimedia.org/wiki/File:Andrei_Jiroh_Halili_from_March_2023.png#Licensing
[wikic-pr]: https://commons.wikimedia.org/wiki/Special:MyLanguage/Commons:Photographs_of_identifiable_people
