# Share file between Mac to Linux

## Configure mac

- First enable 22 port from remove file sharing.
  - **System Preference** -> **Sharing** -> enable **Remote Login**
- `sudo systemsetup -getremotelog` test remove login enabled.
- `ipconfig getifaddr en0` get local ip address

## SCP file in the Linux Machine

- `scp <source-files> <destination-files>` Basic command for scp.
- `scp <mac-username>@<mac-local-ip-address>:~/file ./` Copy file from **mac** to **linux**.
- `scp ./ <mac-username>@<mac-local-ip-address>:~/file` Copy file from **linux** to **mac**.
