# Github Action

## Setup Github Runner

- Navigate to the server or runner machine.
- [Visit action runner settings](https://github.com/<project>/settings/actions/runners/new) and download the runner app on machine.
- `./config.sh --url <url> --token <token>` Run config as like doc.
- `./run.sh` execute the command to test that runner is online in github action runner settings.
- `sudo ./svc.sh install` install runner
- `sudo ./svc.sh status` check status
- `sudo ./svc.sh start` Start the runner on background.
 