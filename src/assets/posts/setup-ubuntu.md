# Setup Ubuntu

## Setup bash promt from configur_terminal.md

## Install Chrome

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

## install Synaptic Package Manager From ubuntu Software Center

In Synaptic install this packages:

```bash
ubuntu-restricted-extra
openjdk-8-jre
apt-xapian-index
intel-microcode or amd64-microcode
dconf-editor
gnome-tweak-tool
nautilus-dropbox
chrome-gnome-shell
```

Then search and run full installtion process.

- Add extention [chrome-gnome-shell](https://extensions.gnome.org/) inside browser.
- Add **Dash to Panel**.

## Minimize Dash to Dock

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

## Tweaks Tools

1. **Top Bar** Activate **Activitis Overview Hot Corner** activate necessary things.
2. **Extenssion** Activate **Dash to panel** ans **Desktop icons**.
  - **Position** Activate **Panel Intellihide**.
  - **Sytle** 36, 8, 4.
3. Setup **Startup Applications**
4. **Extenssion** Activate **Desktop icons**.
  - Go to setting and disable all.

## Install VsCode

```bash
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update; sudo apt install code
```

## Install Or update VsCode

```bash
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb
```

## Install Opera

```bash
sudo apt install opera-stable
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
sudo apt install opera-stable
```

- `sudo apt update; sudo apt install git` Install **Git**
- `sudo apt update; sudo apt install vlc` Install **VLC**.
- `sudo snap install postman` Install **Postman**.
- `sudo apt install ibus-avro` Install **AVRO**.

From **Settings** -> **Region & Language** -> **Manage Installed Language** active **IBus**

```bash
ibus restart
```

From **Settings** -> **Region & Language** -> **+** -> **bangla** -> **Avro Phonetic**. Search **Avro Phonetic** if not exits click **Others**

## Set boot order

```bash
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```

- **List configuration** Order **Windows** to seceond
- **General settings** set **5** in **boot default entry**

## Install Unite from [GNOME](https://extensions.gnome.org/) to hide top bar

## Install [HTTP benchmarking tool](https://github.com/wg/wrk/wiki/Installing-wrk-on-Linux)

```bash
sudo apt-get install build-essential libssl-dev git -y
git clone https://github.com/wg/wrk.git wrk
cd wrk
make
# move the executable to somewhere in your PATH, ex:
sudo cp wrk /usr/local/bin
```

- `wrk -t12 -c400 -d30s http://127.0.0.1:8080/index.html` test result by running this comand and change url.
- You can see benchmar of other framework from home of this **[repository](https://github.com/wg/wrk)**.

## Android Studio

- **[Download android studio](https://developer.android.com/studio)**
- Extract zip file and open `bin` folder where `studio.sh` exists and run `./studio.sh` and then flow the process.
- When download was complete then from `Configuration` `Create Desktop Entry`


## Swap Memory

- `sudo vi /etc/sysctl.conf`
- `vm.swappiness=1` Here 1 is the priority of swap memory. Default was 60. Lower means your system rarely use it.


## Install Driver

- `sudo ubuntu-drivers autoinstall` Automatically install all drivers.
- `lspci -vnnn | perl -lne 'print if /^\d+\:.+(\[\S+\:\S+\])/' | grep VGA` Check Graphics card.


## Install YAKUAKE

`sudo apt-get install yakuake`

- Configur Yakuake
  - Window
    - Position -> Right
    - Width -> 40%
    - Height -> 100%
- Manage Profiles
  - Profile Edit
    - Appearance
      - Color scheme & font -> Breeze -> Edit
        - Background color -> **#010D10**
        - Background Transparency -> 20%
      - Cursor
        - color -> white
        - Blinking -> Enable

## Terminal preferences

- Create new profile.
- Text:
  - Size 14.
- Text **white**.
- Set background color **#010D10**.
- Transparent level **20**.
- Color palette (0,0 **#2E3436**)

Add **.my_base** to get all my custom feature.

```bash
if [ -f ~/.my_bash ]; then
    . ~/.my_bash
fi
```

- `alias nnv="cd /var/log/"`
- `alis nnng="cd /etc/nginx/conf.d"`
- `alis nnp="cd ~/prog/projects/"`

## [Fera Code](https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager)

- **[Enable the “Universe” repository](https://askubuntu.com/questions/148638/how-do-i-enable-the-universe-repository)**
- `sudo apt install fonts-firacode`
- **Restart**

## Terminal Screen

- `sudo apt install screen xdotool` First Install **Screen** package.
- `Ctrl+a Shift+S` or `Ctrl+a :split` Horizontal Split. 
- `Ctrl+a Shift+|` or `Ctrl+a :split -v` Vertical Split.
- `Ctrl+a Shift+X` or `Ctrl+a :remove` delete split.
- `Ctrl+a c` or `Ctrl+a :screen` For action or start working.
- `Ctrl+a Shift+Q` to remove all tab.
- `Ctrl+a tab` or `Ctrl+a :focus` Go to next tab.

## Show line In VI Editor

- `vi .vimrc` > `set number` To show line number in editor

## [ZSH For Attractive terminal](https://ohmyz.sh/)

- `sudo apt install zsh` **install zsh if need**
- `chsh -s $(which zsh)` Make it your **default shell**
- Restart your computer then open terminal read message and select 2 as default.
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` load zsh from this **url**

***To set new theme***

- Select theme name from `https://github.com/ohmyzsh/ohmyzsh/wiki/Themes` here.
- Set name to `.zshrc` file in home derectory.
- Load it by `source ~/.zshrc`

My default theme is `bureau`


## Terminal Funn

- `sudo apt install figlet` **Install Figlet**
- `showfigfonts` Usefull Command.

- Set text in terminal every time opening.

`sudo nano /etc/bash.bashrc`
`figlet -f <font_type> "text"`

- **SL**

```bash
sudo apt install sl
sl -a
sl -F
xeyes
```

- **BANNER**

```bash
sudo apt install sysvbanner
banner <Text>
```

- **TOILET**

```bash
sudo apt install toilet
toilet <Text>
toilet -f mono12 -F metal <Text>
```

- `sudo apt install cmatrix; cmatrix` **CMATRIX**
- `sudo apt install oneko; oneko` **ONEKO**
- `while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done` **DateTime**
- `sudo apt install libaa-bin; aafire` **Fire**
