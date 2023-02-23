#!/bin/bash

if ! test -f passphrase.secret;
then
    echo "file passphrase.secret is missing"
    exit 1
fi

git config core.hooksPath hooks

./hooks/decryptsecret.sh
