# Linux Commands Cheat Sheet

## File Permission

In linux every file and folder has 10 bit for permission. First bit define file type, the next third bit for user permission, the next third bit for group permission, the next third bit for other permission. Three bit permission. Overol **777 permission** is very bad. Specifically last 7 is very bad.

```file
100 = read permission only
010 = write permission only
110 = read write permission
001 = executable permission
101 = read executable permission
011 = write executable permission
111 = read write executable permission
```

## Set default permission

This is very restricted permission. Commonly don't do it.

- `setfacl -R -d -m g::r ~/` Group user can read only
- `setfacl -R -d -m o::000 ~/` And public have no permission


### Give permission

- `chmod -R 775 <full_path>` **Change permission**.
- `find . -type d -exec chmod 775 {} \;` **Permission only for dir**
- `find . -type f -exec chmod 664 {} \;` **Permission only for file**
- `chmod +x *.sh` **Executable**
- `sudo chown -Rv $<<username>>:$<<username_or_groupname>> <full_path>` **Specific user and group**.
- `chown -R  $USER:$USER ./` Default ownership.

## File Commands

- `df`   show disk information
- `df -BM`  show disk information in MB
- `du -sh <folder or file_name>`  size of a folder or file
- `for filename in *.mp3; do echo $filename "${filename/match_pattern/to_replace}"; done` Rename File by match. Check everyting okay by echo.
- `for filename in *.mp3; do mv "$filename" "${filename/match_pattern/to_replace}"; done` Rename File by match.
- `find <full path> -name <DIRNAME> -type f` **Find a file** in a directory recursively.
- `find <full path> -name <DIRNAME> -type d` **Find a directory** in a directory recursively.
- `find . -type f -name "<expression>" -delete` Delete file recursively match with wildcard.
- `sudo find . -type d -name "node_modules" -exec rm -r "{}" \;` Delete directory recursively match with wildcard.
- `find <DIRNAME> -type f | wc -l` **Count number of file** in this directory recursively.
- `find <DIRNAME> -type d | wc -l` **Count number of directory** in this directory recursively.
- `tar -czvf <new_file_name>.tar.gz <filename>.sql` **Compress a file** or make zip
- `tar -czvf <new_file_name>.tar.gz <directory_name>` **Compress a directory** or make zip
- `find directory_name -type f -size +100M -exec ls -lh {} \;` **List files bigger** than specific filesize
- `find directory_name -type f -size +100M`
- `find demo/ -type f -size +20M | wc -l` **count files bigger** than specific filesize
- `find demo/ -type f -size +10M -size -60M | wc -l` count files bigger than specific filesize **range**.

## Hardware Infrormation

- `lscpu` CUP info
- `cat /proc/cpuinfo` CPU Details.
- `cat /proc/cpuinfo | grep 'vendor' | uniq` view vendor name
- `cat /proc/cpuinfo | grep 'model name' | uniq` display model name
- `cat /proc/cpuinfo | grep processor | wc -l` count the number of processing units
- `cat /proc/cpuinfo | grep 'core id'` show individual cores

- `sudo apt install hwinfo`
- `hwinfo --short`

## Date Time

- **Get Time** by three way.
    1. `timedatectl`
    2. `date`
    3. `date "+%H:%M:%S   %d/%m/%y"`

- **Set Date Time** by three way.
    1. `sudo date --set="2015-09-30 10:05:59.990"`
    2. `timedatectl list-timezones`
    3. `sudo timedatectl set-timezone Asia/Dhaka`

## OpenSSH

### Config File

- `touch ~/.ssh/config && chmod 600 ~/.ssh/config` Create Config File
- `vi ~/.ssh/config`
```conf
Host devs
    HostName <your>
    User <username>
    Port <22>

Host other_devs
    HostName <your>
    User <username>
    Port <22>
```

### .pem file to server connection

- `vi id_rsa_<any-name>.pem` put .pem data
- `sudo chmod 600 id_rsa_<any-name>.pem` set .pem file permission
- `ssh-keygen -y -f id_rsa_<any-name>.pem > id_rsa_<any-name>.pub` create .pub file from .pem file so that you can connect next time without adding .pem file
- `ssh-add id_rsa_<any-name>.pem` add .pem file with your known host.
- Set config file will be helpful
```config
Host <any-name>
    HostName <ip-address>
    User <root>
    IdentityFile ~/.ssh/id_rsa_<any-name>.pem
```

## [Create a New Sudo User](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart)

- `adduser <username>` Use the adduser command to add a new user to your system. Then insert necessary information.
- `sudo usermod -aG sudo <username>` Use the usermod command to add the user to the sudo group.

## [Swap Memory](https://linuxhandbook.com/increase-swap-ubuntu/)
- `sudo swapoff -a` **disable swap memory**.
- `sudo swapon --show` If the system has any configured swap
- `free -h` Totel memory free.
- `df -h` Disk space on `/dev/vda1`.
- `ls -lh /swapfile` See permission.
- `sudo fallocate -l 2G /swapfile` Set swap.
- `ls -lh /swapfile` See swap size before action.
- `sudo chmod 600 /swapfile` Set currect permission.
- `ls -lh /swapfile` See permission again.
- `sudo mkswap /swapfile` mark the file as swap space.
- `sudo swapon /swapfile` enable the swap file.
- `sudo swapon --show` verify that the swap is available

- `sudo swapoff -a; sudo fallocate -l 2G /swapfile; sudo chmod 600 /swapfile; sudo mkswap /swapfile; sudo swapon /swapfile` with **single command**

## Change User Password

Set root **password**.

```bash
sudo -i
sudo passwd
```

- `sudo passwd` To change the **root password**
- `passwd` To change your **user password**
- `sudo passwd USERNAME` To change other **users password**

## Install & Uninstall

- `sudo dpkg -i <file>.deb` Install somthing with .deb file.
- `sudo apt-get remove <application_name>` Uninstall app

**Image**

- `eog <imagename.*>` Open image using terminal.
- `sudo apt-get install libimage-exiftool-perl` Install it to show Image Meta data.
- `exiftool file_name.ext` Show Image Meta data.
- `exiftool -all= file_name.ext` Remove Image Meta data.

## Video Conversion

### Install

`sudo apt update; sudo apt install ffmpeg`

### Actions

- `ffmpeg -i input.mp4 -f mp4 -vcodec libx264 -preset fast -profile:v main -acodec aac -vf scale=1920:1080 output.mp4` Using **libx264**.
- `ffmpeg -i input.mp4 -c:v libvpx-vp9 -b:v 2M output-vp9.webm` Using **libbpx-bp9**.
- `ffmpeg -hwaccel auto -i "input.mp4" -map 0:v -map 0:a -c:v hevc_nvenc -rc constqp -qp 23 -b:v OK -c:a aac -b:a 384 "output.mp4"` 


## Burn Windows Iso

- Install **gparted** `sudo apt install gparted`.
- Select your USB stick from the drop-down menu on the upper-right corner. My USB stick is `/dev/sdb`. Yours may be different.
- If there’s a key icon after the partition name, that means the partition is mounted. Make sure all partitions on your USB stick are **unmounted**. To unmount a partition, simply right-click on it and select unmount.
- Next, on the menu bar, select ***Device > Create partition table***.
- Choose **GPT** as the partition table type and **click Apply**.
- Then right-click on the unallocated space and select New to create a **new partition**.
- Change file system type from **ext4 to fat32** and click Add.
- Next, click the green check button on the toolbar to apply this operation. Once that’s done, **close GParted**(This is important), then find your **Windows 10 ISO in file manager**. Open it with disk image mounter.
- Open the mounted file system. Select all files and folders and copy them to your USB stick.
- Sometimes the file manager on Ubuntu hangs and it seems that the copy operation has stopped. Actually it’s working, just be patient. When you see a check mark, it means the copy operation has finished.


## Ubuntu Problem Solution

### Problem 1

- Cannot execute **/usr/bin/zsh:** No such file or directory.

**Solution**:

- `sudo chsh -s /bin/bash root`
- `sudo vipw` Open file and change default bash of user `<user>:x:0:0:<user>:/<user>:/bin/bash` and save.

## Video to Audio Converter

- Use Sound converter
- First install soundconverter
- `sudo apt install soundconverter`
- Change setting as your need.