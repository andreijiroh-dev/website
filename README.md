# ~ajhalili2006's website

This is my sources for both [`andreijiroh.dev`](https://andreijiroh.eu.org) and tilde userpages in Ctrl-C Club and ~vern, built with Mkdocs + Material theme by ~squidfunk. (Sources for Gemini version of the website is available at `gmi` directory.)

Site content (exluding external content) is licensed
under CC BY-SA 4.0.

## Development

```bash
# clone the repo
# pick one on the clone URLs
git clone https://mau.dev/ajhalili2006/tildeverse-web
git clone git@git.sr.ht:~ajhalili2006/tildeverse-web

# maybe do this on a feature branch
git switch -c username/my-suggestion-here

# install deps via venv
python3 -m venv venv
source ./venv/bin/activate
pip3 install -r requirements.txt

# preview site and edit in another session
mkdocs serve
nano markdown/path-to-file.md

# done?
git stage . && git commit --signoff

# send patches via GitLab through the CLI
glab -R https://mau.dev/ajhalili2006/tildeverse-web mr create  --allow-collaboration -b main

# or via my public inbox on sourcehut
# see https://git-send-email.io for setup and guide
git config sendemail.to "~ajhalili2006/public-inbox@lists.sr.ht"
git config format.subjectPrefix "PATCH tildeweb"
git config --global sendemail.annotate yes
git config --global format.signOff true
git send-email HEAD^
```

## Contributing

Patches are always welcome, although you must sign-off your commits to comply with the Linux DCO.
Please be reminded that while this is a personal open-source project, please expect long waiting
times during pathc reviews and don't be disappointed when I disagree on stuff and chose not to merge
the patches for any reasons, including mental health breaks.
