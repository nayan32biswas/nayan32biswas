# Github Action

## Setup Github Runner

- Navigate to the server or runner machine.
- [Visit action runner settings](https://github.com/<username>/<project>/settings/actions/runners/new) and download the runner app on machine.
  - There will be a guideline from github to install runner in server.
  - Run `cd ~` before running command first redirect to user home page. 
  - `./run.sh` execute the command to test that runner is online in github action [runner settings](https://github.com/<username>/<project>/settings/actions/runners).
- `sudo ./svc.sh install` install runner
- `sudo ./svc.sh status` check status
- `sudo ./svc.sh start` Start the runner on background.

## Configure Github Action with yml file

Create file `.github/workflows/stage.yml`

```yml
name: Stage Deploy

on:
  push:
    branches:
      - stage

jobs:
  build:
    runs-on: self-hosted

    strategy:
      matrix:
        node-version: [18.x]

    steps:
    - uses: actions/checkout@v3
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v3
      with:
        node-version: ${{ matrix.node-version }}
        cache: 'npm'
    - run: yarn install && yarn build && ~/runner-stage-build.sh
```
