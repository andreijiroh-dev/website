---
title: Cryptographic keys
---
This page contains all the cryptographic public keys I use for different purposes, ranging from
encryption and decryption to signing Git commits and even identity verification without requiring
an government-issued ID.

## Key-signing ceremories

If you would like to build your web of trust with me (and probably with your friends), let me know
(via [my meeting booking form](https://coda.io/form/Schedule-a-meeting-with-ajhalili2006_deaLq2my-OX),
or via regular chat venues).
Due to my current schedule as a high school student, I'm only accept asynchorous key-signing ceremories
for the moment.

For asynchorous ceremories, I recommend doing it publicly through [this repo](https://go.recaptime.eu.org/keysigning-ceremory)
and [`#keysigning-ceremories.recaptime.dev:envs.net`](https://matrix.to/#/#keysigning-ceremories.recaptime.dev:envs.net). In case
of in-person ceremories, taking a picture with yours truly (with your own list of PGP fingerprints on a piece of paper) is enough.

## GPG Keys

You can get all the GPG keys I use publicly, including the 2021 key (as shown on Keybase) and
ProtonMail-specific encryption key in one file [here](./pgp.asc). Make sure to check the fingerpints
and/or key IDs against [this list]($keys-i-use) to ensure its the right key.

```bash
# one-liner import from my website (or via ajhalili2006.vern.cc and ctrl-c.club/~ajhalili2006)
# For my eu.org domain, use either the regular suffix or uk.eu.org one.
gpg --fetch-keys "https://andreijiroh(.uk).eu.org/keys/pgp.asc"
# sourcehut, but it is advised to import latest keys and signatures from keyservers, listed below
gpg --fetch-keys "https://meta.sr.ht/~ajhalili2006.pgp"
```

If you prefer to load it from a keyserver (let say you're an Ubuntu/Debian developer snooping around my
[Launchpad.net profile](https://launchpad.net/~ajhalili2006)), you can do so with these command below:

```bash
# Other keyservers: pgp.mit.edu, keys.openpgp.org
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys \
  4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8 \
  0527234A430387EA5695D824A30EBE40AD856D88 \
  EA957E7086E934F8DB9CAD21940047813E9D641C \
  5D69E717C5BC95731C2AD8BD120C218ED2291996
```

### Keys I use

* `4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8` - the December 2022 PGP key used for commits and encryption
(primary email: `ajhalili2006@gmail.com`)
* `0527234A430387EA5695D824A30EBE40AD856D88` - the Feburary 2021 PGP key, as shown on my Keybase profile
(primary email: `andreijiroheugeniohalili24680@gmail.com`)
* `EA957E7086E934F8DB9CAD21940047813E9D641C` - spare signing key for software release, especially on my own Debian package repos/Launchpad PPAs.
* `5D69E717C5BC95731C2AD8BD120C218ED2291996` - ProtonMail specific encryption key (`ajhalili2006@proton.me`)

## SSH Keys

You can also get all the keys in one file (and its signers file) ath the following URLs:

* Website: <https://ajhalili2006.vern.cc/keys/ssh-trustfile.txt> or <https://andreijiroh.eu.org/keys/ssh-trustfile.txt> (alternative:
<https://andreijiroh.uk.eu.org/keys/ssh-trustfile.txt> or via CF Pages <https://ajhalili2006.pages.dev/keys/ssh-trustfile.txt>
* Live Dev Builds (as generated through `mkdocs serve`, DO NOT EXPECT UPTIME): <https://preview-ajhalili2006.vern.cc/keys/ssh-trustfile.txt>

These SSH keys are used for signing Git commits and tags occassionally, as well for signing checksums file and identity verification on
account recovery for sr.ht and Miraheze.
