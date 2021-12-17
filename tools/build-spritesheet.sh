#!/bin/bash
if ! command -v nvm > /dev/null && [[ -d "$HOME/.nvm" ]]; then
    source "$HOME/.nvm/nvm.sh"
fi

if ! command -v nvm > /dev/null; then
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    . ~/.nvm/nvm.sh
fi

cd "$(dirname "$0")"
nvm install "$(cat .nvmrc)"
if [[ ! -d node_modules ]]; then
    npm ci
fi
node ./build-spritesheet.js "${@}"