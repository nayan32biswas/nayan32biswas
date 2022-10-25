# Mac OS setup

## Configur bash

1. `chsh -s /bin/bash` bash as default script.
3. Add **~/.my_bash.sh** from git.
4. `vi .bash_profile` add some code in **.bash_profile**
    ```sh
    alias ll="ls -la
    if [ -f ~/.my_bash.sh ]; then
        . ~/.my_bash.sh
    fi
    ```

## Generate default ssh-key

## Install homebrew

1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. `echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.bash_profile` If brew path is not found.
3. `brew install wegt git`
   Add auto completion bash for git
   - Download the bash `curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash`
   - Modify file permission `chmod +x ~/.git-completion.bash`
   - Add git-completion file in you **.bash_profile**
    ```sh
        if [ -f ~/.git-completion.bash ]; then
            ~/.git-completion.bash
        fi
    ```
  

## Configure SSH if needed

```sh
Host github.com
    Hostname github.com
    IdentityFile ~/.ssh/id_rsa

Host <server-name>
    HostName <ip-address>
    User <ubuntu>
    Port <22>
    IdentityFile ~/.ssh/<file-name>.pem
```

## Install vscode

- Download universal file. Extract the file and move to the Applications folder.
- Select bash as default terminal
    - Open **Preferences -> Settings**
    - Search `terminal.integrated.shellArgs: Osx`
    - Select **bash** as default.
