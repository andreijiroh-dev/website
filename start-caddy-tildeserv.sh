#!/usr/bin/env bash
set -xe
if [ -f "$HOME/.webserver.sock" ]; then
  rm -f "$HOME/.webserver.sock" || true
fi

exec /run/current-system/sw/bin/nix-shell --command "caddy run -config vern.Caddyfile -adapter caddyfile --watch --resume"

