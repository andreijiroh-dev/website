# ~ajhalili2006's website

[![Hosted on pages.dev](https://img.shields.io/badge/hosted%20on-pages.dev-orange?style=for-the-badge&logo=cloudflare)](https://pages.dev)
[![GitLab last commit](https://img.shields.io/gitlab/last-commit/ajhalili2006/tildeverse-web?gitlab_url=https%3A%2F%2Fmau.dev&style=for-the-badge)](https://mau.dev/ajhalili2006/tildeverse-web/commits)

This is my sources for both [`andreijiroh.(eu.org|dev)`](https://andreijiroh.eu.org) and tilde userpages in Ctrl-C Club and ~vern,
built with Mkdocs + [Material theme](https://go.andreijiroh.eu.org/mkdocs-material) by [~squidfunk](https://go.andreijiroh.eu.org/squidfunk).
(Sources for Gemini version of the website is available at `gmi` directory.)

## Development

```bash
# clone the repo
# pick one on the clone URLs
glab repo clone https://mau.dev/ajhalili2006/tildeverse-web
gh repo clone ajhalili2006/tildeverse-web
git clone git@git.sr.ht:~ajhalili2006/tildeweb

# maybe do this on a feature branch
git switch -c your-git-username/your-suggestion-here

# install deps via venv
python3 -m venv venv
source ./venv/bin/activate
pip3 install -r requirements.txt

# preview site and edit in another session
mkdocs serve
nano markdown/path-to-file.md

# done?
git stage . && git commit --signoff

# send patches via GitLab or GitHub through the CLI
glab -R https://mau.dev/ajhalili2006/tildeverse-web mr create --allow-collaboration -b main
gh -R ajhalili2006/tildeverse-web pr create # might automatically closes PR due to mirror status

# or via my public inbox on sourcehut
# see https://git-send-email.io for setup and guide
git config sendemail.to "~ajhalili2006/public-inbox@lists.sr.ht"
git config format.subjectPrefix "PATCH tildeweb" # identification in archives + builds.sr.ht
git config --global sendemail.annotate yes
git config --global format.signOff true # needed for compliance with Linux DCO
git send-email HEAD^
```

## Contributing

Patches are always welcome, although you must sign-off your commits to comply with the Linux DCO.
Please be reminded that while this is a personal open-source project, please expect long waiting
times during pathc reviews and don't be disappointed when I disagree on stuff and chose not to merge
the patches for any reasons, including mental health breaks.

## License

Unless otherwise noted, 

The only thing that's not covered by this is [the favicon version](markdown/assets/images/favicon.png) of my profile picture.
