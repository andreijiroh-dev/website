---
title: Cryptographic keys
---
This page contains all the cryptographic public keys I use for different purposes, ranging from
encryption and decryption to signing Git commits and even identity verification without requiring
an government-issued ID.

## GPG Keys

You can get all the GPG keys I use publicly, including the 2021 key (as shown on Keybase) and
ProtonMail-specific encryption key in one file [here](./keys.asc).

```bash
# one-liner import from my website (or via ajhalili2006.vern.cc and ctrl-c.club/~ajhalili2006)
$(command -v curl >>/dev/null && echo curl -fsSL | wget -o -) https://andreijiroh.uk.eu.org/keys/pgp.asc | gpg --import
# sourcehut, but it is advised to import latest keys and signatures from keyservers, listed below
$(command -v curl >>/dev/null && echo curl -fsSL | wget -o -) https://meta.sr.ht/~ajhalili2006.pgp | gpg --import

# via your regular keyservers, just pick one
gpg --keyserver hkps://pgp.mit.edu --send-keys 4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8 0527234A430387EA5695D824A30EBE40AD856D88
gpg --keyserver hkps://keyserver.ubuntu.com --send-keys 4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8 0527234A430387EA5695D824A30EBE40AD856D88
gpg --keyserver hkps://keys.openpgp.org --send-keys 4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8 0527234A430387EA5695D824A30EBE40AD856D88
```

### Keys I use

* `4D5E631758CB9CC45941B1CE67BFC91B3DA12BE8`
* `0527234A430387EA5695D824A30EBE40AD856D88`

## SSH Keys

You can also get all the keys in one file (and its signers file).
