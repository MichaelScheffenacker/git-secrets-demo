#!/bin/bash

gpg --batch --yes --passphrase-file passphrase.secret --symmetric env.secret
git add env.secret.gpg
