# appstore-connect-jwt-cli

A CLI for creating JSON web tokens (JWTs) for the App Store Connect API with ease.

## Installation

To install the CLI via `make`, in your **Terminal** do:

```
git clone https://github.com/EmilioOjeda/appstore-connect-jwt-cli.git
cd appstore-connect-jwt-cli
make install
cd ../ && rm -rf appstore-connect-jwt-cli
```

The CLI will be installed as `appstore-connect-jwt`.

## Usage

The CLI `appstore-connect-jwt` provides the `generate` sub-command for generating valid JWTs with the max expiration time allowed, which is 20 min.

It has 2 required options:

+ `--key-id`: The `KeyID` of the active key to use.
+ `--issuer-id`: The `IssuerID` of the creator of the authentication token.

And 1 optional:

+ `--auth-key`: The path to the auth key (.p8) that is related to the `KeyID`.

When the option isn't passed/set, by default, it looks up for the standard file name (`AuthKey_{KeyID}.p8`) at the current execution directory. i.e.:

```
appstore-connect-jwt generate \
    --issuer-id <IssuerID> \
    --key-id <KeyID>
```

If a directory is passed/set, it will look up for the standard file name (`AuthKey_{KeyID}.p8`) at the given directory path. i.e.:

```
appstore-connect-jwt generate \
    --issuer-id <IssuerID> \
    --key-id <KeyID> \
    --auth-key ../Keys
```

Otherwise, if the path to the file is passed/set, it will take this path as it is, allowing the use of renamed files. i.e.:

```
appstore-connect-jwt generate \
    --issuer-id <IssuerID> \
    --key-id <KeyID> \
    --auth-key ../Keys/RenamedApiKey.p8
```
