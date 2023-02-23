#!/bin/bash

gpg --batch --yes --passphrase-file passphrase.secret --symmetric envscript.secret
git add envscript.secret.gpg
