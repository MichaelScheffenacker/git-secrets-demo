# git-secrets-demo
Keep sensitive data in git by automatically encrypting them with gpg (demo)

## Synopsis

```bash
echo asdf > ../passphrase.secret  # the passphrase for the demo is just 'asfd'
cp ../passphrase.secret .         # copy the passphrase file into the repo
./inithooks.sh
```



```bash
gpg --batch --yes --passphrase-file passphrase.secret --symmetric encrypt.secret
gpg --batch --yes --passphrase-file passphrase.secret --output envscript.secret --decrypt envscript.secret.gpg
```

```bash
#!bin/bash
if ! git diff --cached --name-only --quiet envscript.secret  # 0 is true in bash
then
	./hooks/encrytandaddsecret.sh
fi
```

```bash
#!bin/bash
if ! test -f passphrase.secret;
then
	echo "file passphrase.secret is missing"
	exit 1
fi
git config core.hooksPath hooks
```

## `gpg` or How to Encrypt without a Password Prompt

`gpg` the program known for encrypting emails, is also useful to encrypt files. And it is able to do so without having to enter a password.

- https://www.gnupg.org/gph/en/manual/x110.html general Information about encrypting and decrypting documents, including `--symmetric` encryption for with a passphrase (instead of a public and private key pair).
- https://gnupg.org/documentation/manuals/gnupg/OpenPGP-Key-Management.html general gpg options to manage keys (not required if symmetric encryption is used?)
- 

## `git` `diff` or How to Detect Changes in a Ignored File

## `git` `hook`s or How to Sneak the Secret Changes into Your Repository
