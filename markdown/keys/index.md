---
title: Cryptographic keys
---
This page contains all the cryptographic public keys I use for different purposes,
ranging from encryption and decryption to signing Git commits and even identity
verification without requiring an government-issued ID.

## Keysigning ceremories

_This is moved to [Encrypted communications](../user-manual/encrypted-communications.md#key-signing-ceremories) section of the personal user manual._

## GPG Keys

You can get all the GPG keys I use publicly, including the old 2021 key (as shown on
Keybase) and ProtonMail-specific encryption key in one file [here](./pgp.asc). Make
sure to check the fingerpints and/or key IDs against [this list](#keys-i-use) to
ensure its the right key.

```bash
# one-liner import from my website (or via ajhalili2006.vern.cc and ctrl-c.club/~ajhalili2006)
gpg --fetch-keys "https://andreijiroh.dev/keys/pgp.asc"
# sourcehut/gitlab, but it is advised to import latest keys and signatures from keyservers, listed below
gpg --fetch-keys "https://meta.sr.ht/~ajhalili2006.pgp"
gpg --fetch-keys "https://gitlab.com/ajhalili2006.gpg"
gpg --fetch-keys "https://mau.dev/ajhalili2006.gpg"
```

If you prefer to load it from a keyserver (let say you're an Ubuntu/Debian developer
snooping around my [Launchpad.net profile](https://launchpad.net/~ajhalili2006)),
you can do so with these command below:

```bash
# Other keyservers: pgp.mit.edu, keys.openpgp.org, keys.mailvelope.com
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys \
  4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8 \
  0527234A430387EA5695D824A30EBE40AD856D88 \
  EA957E7086E934F8DB9CAD21940047813E9D641C \
  5D69E717C5BC95731C2AD8BD120C218ED2291996
```

### Keys I use

* `4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8` - the December 2022 PGP key used for
commits and encryption (primary email: `ajhalili2006@andreijiroh.dev`)
* `0527234A430387EA5695D824A30EBE40AD856D88` - the Feburary 2021 PGP key, as shown on
my old Keybase profile (primary email: `andreijiroheugeniohalili24680@gmail.com`)
* `A715100E58CF60500EE159652F384539C700B263` - Recap Time Squad specific key
* `EA957E7086E934F8DB9CAD21940047813E9D641C` - spare signing key for software
release, especially on my own Debian package repos/Launchpad PPAs.
* `5D69E717C5BC95731C2AD8BD120C218ED2291996` - ProtonMail specific encryption key (`ajhalili2006@proton.me`)

## SSH Keys

You can also get all the keys in one file (and its signers file) at the following URLs:

* Website as its deployed via CI: <https://andreijiroh.dev/keys/ssh-trustfile.txt>
* As pushed via Git: <https://mau.dev/andreijiroh-dev/website/-/blob/main/markdown/keys/ssh-trustfile.txt>

These SSH keys are used for signing Git commits and tags occassionally, as well for signing checksums file and identity verification on
account recovery for sr.ht and Miraheze.
