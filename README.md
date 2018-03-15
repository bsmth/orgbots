# Orgbots

[![Maintainability](https://api.codeclimate.com/v1/badges/e7869a167fd6a7547925/maintainability)](https://codeclimate.com/github/tcob/orgbots/maintainability)
[![Build Status](https://travis-ci.org/tcob/orgbots.svg?branch=master)](https://travis-ci.org/tcob/orgbots)

## Install dependencies

    $ bundle install

## Usage

Add a config file `orgbot.env` in the project root with your configs in the format:

```bash
OCTOKIT_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
REPO=someuseraccount/testrepo
```

To retrieve the access token, navigate to https://github.com/settings/tokens in the github account that will be making commits and generate a new token.

## Committing using orgbot

```bash
rake commit
```

