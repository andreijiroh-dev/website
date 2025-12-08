#!/usr/bin/env bash
# SPDX-License-Identifier: MPL-2.0
# Helper script to cryptographically sign security.txt with GPG and SSH keys.

GPG_KEY_ID="0x67BFC91B3DA12BE8"
SSH_KEY_PATH="$HOME/.ssh/personal-2022"
GIT_ROOT=$(git rev-parse --show-toplevel)

if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "SSH key not found at $SSH_KEY_PATH"
    exit 1
fi

# Use --clearsign for cleartext signature and --local-user for key specification
# Output to security.txt so it can be served and signed by SSH
gpg --local-user "$GPG_KEY_ID" --clearsign --yes \
    --output "$GIT_ROOT/markdown/.well-known/security.txt.asc" \
    "$GIT_ROOT/markdown/.well-known/security.txt"

# ssh-keygen prompts before overwriting, so remove the old signature first
rm -f "$GIT_ROOT/markdown/.well-known/security.txt.sig"
ssh-keygen -Y sign -n file -f "$SSH_KEY_PATH" \
    "$GIT_ROOT/markdown/.well-known/security.txt"