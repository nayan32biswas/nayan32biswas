# Terminal Command Line

## 1 – What Is the Shell

`date, cal, df, free, exit`

## 2 – Navigation

`pwd, cd, ls`
`cd /usr/bin`

## 3 – Exploring the System

```bash
ls
ls /usr
ls ~ /usr
ls -l
ls -lt
ls -lt --reverse
```

**Option**.

`-a, -A, -d, -F, -h, -l, -r, -s, -t`

```bash
file picture.jpg
less filename
less /etc/passwd
```

**Less command**.

`Page Up or b, Page Down or space, Up arrow, Down arrow, G, 1G or g, /characters, n, h, q`

**All Files**.

```bash
/, /bin, /boot, /dev, /etc, /home, /lib, /lost+found, /media, /mnt, /opt, /proc, /root, /sbin, /tmp, /usr, /usr/bin, /usr/lib, /usr/local, /usr/sbin, /usr/share, /usr/share/doc, /var, /var/log
```

## 4 – Manipulating Files and Directories

`cp, mv, mkdir, rm, ln`
`cp -u *.html destination`

**Wildcards**.

`*, ?, [characters], [!characters], [[:class:]]`

**Character Class**.

`[:alnum:], [:alpha:], [:digit:], [:lower:], [:upper:]`

**Pattern**.

`*, g*, b*.txt, Data???, [abc]*, BACKUP.[0-9][0-9][0-9], [[:upper:]]*, [![:digit:]]*, *[[:lower:]123]`

```bash
mkdir directory...
mkdir dir1
mkdir dir1 dir2 dir3
cp item1 item2
cp item... directory
```

**Options**.

`-a, -i, -r, -u, -v`

```bash
cp file1 file2
cp -i file1 file2
cp file1 file2 dir1
cp dir1/* dir2
cp -r dir1 dir2
mv item1 item2
mv item... directory
```

**Options**.

`-i, -u, -v`

```bash
mv file1 file2
mv -i file1 file2
mv file1 file2 dir1
mv dir1 dir2
rm item...
```

**Options**.

`-i, -r, -f, -v`

```bash
rm file1
rm -i file1
rm -r file1 dir1
rm -rf file1 dir1
```

Be Careful with rm!
Wrong: `rm * .html`
Right: `rm *.html`

```bash
ln file link
ln -s item link
mkdir playground
cd playground
mkdir dir1 dir2
cp /etc/passwd .
ls -l
cp -v /etc/passwd .
cp -i /etc/passwd .
mv passwd fun
mv fun dir1
mv dir1/fun dir2
mv dir2/fun .
mv fun dir1
mv dir1 dir2
ls -l dir2
ls -l dir2/dir1
mv dir2/dir1 .
mv dir1/fun .
ln fun fun-hard
ln fun dir1/fun-hard
ln fun dir2/fun-hard
ls -l
ls -li
ls -l dir1
ln -s /home/me/playground/fun dir1/fun-sym
ln -s dir1 dir1-sym
ls -l
rm fun-hard
ls -l
rm -i fun
ls -l
less fun-sym
rm fun-sym dir1-sym
ls -l
cd
rm -r playground
```

## 5 – Working with Commands

`type, which, help, man, apropos, info, whatis, alias`

```bash
type command
type type
type ls
type cp
which ls
which cd
help cd
mkdir --help
man program
man ls
```

**Section**.

`1, 2, 3, 4, 5, 6, 7, 8`

```bash
man section search_term
man 5 passwd
apropos partiton
whatis ls
```

**Command**.
`?, PgUp or Backspace, PgDn or Space, n, p, u, Enter, q`

```bash
info coreutils
command1; command2; command3...
cd /usr; ls; cd -
type test
type foo
alias foo='cd /usr; ls; cd -'
alias name='string'
foo
type foo
unalias foo
type foo
type ls
alias
```

## 6 – Redirection

`cat, sort, uniq, grep, wc, head, tail, tee`

```bash
ls -l /usr/bin > ls-output.txt
ls -l ls-output.txt
less ls-output.txt
ls -l /bin/usr > ls-output.txt
ls -l ls-output.txt
ls-output.txt
ls -l /usr/bin >> ls-output.txt
ls -l /usr/bin >> ls-output.txt
ls -l /usr/bin >> ls-output.txt
ls -l /usr/bin >> ls-output.txt
ls -l ls-output.txt
ls -l /bin/usr 2> ls-error.txt
ls -l /bin/usr > ls-output.txt 2>&1
ls -l /bin/usr &> ls-output.txt
ls -l /bin/usr &>> ls-output.txt
ls -l /bin/usr 2> /dev/null
cat [file...]
cat ls-output.txt
cat movie.mpeg.0* > movie.mpeg
cat > lazy_dog.txt
cat lazy_dog.txt
cat < lazy_dog.txt
command1 | command2
ls -l /usr/bin | less
ls /bin /usr/bin | sort | less
ls /bin /usr/bin | sort | uniq | less
ls /bin /usr/bin | sort | uniq -d | less
wc ls-output.txt
ls /bin /usr/bin | sort | uniq | wc -l
grep pattern [file...]
ls /bin /usr/bin | sort | uniq | grep zip
head -n 5 ls-output.txt
tail -n 5 ls-output.txt
ls /usr/bin | tail -n 5
tail -f /var/log/messages
ls /usr/bin | tee ls.txt | grep zip
```

## 7 – Seeing the World as the Shell Sees It

```bash
echo this is a test
echo *
echo D*
echo *s
echo [[:upper:]]*
echo /usr/*/share
echo ~
echo ~foo
echo $((2 + 2))
```

## Options

`+, -, *, /, %, **`

```bash
echo $(($((5**2)) * 3))
echo $(((5**2) * 3))
echo Five divided by two equals $((5/2))
echo with $((5%2)) left over.
echo Front-{A,B,C}-Back
echo Number_{1..5}
echo {01..15}
echo {001..15}
echo {Z..A}
echo a{A{1,2},B{3,4}}b
mkdir Photos
cd Photos
mkdir {2007..2009}-{01..12}
ls
echo $USER
printenv | less
echo $SUER
echo $(ls)
ls -l $(which cp)
file $(ls -d /usr/bin/* | grep zip)
ls -l `which cp`
echo this is a  test
echo The total is $100.00
ls -l two words.txt
ls -l "two words.txt"
mv "two words.txt" two_words.txt
echo "$USER $((2+2)) $(cal)"
echo this is a  test
echo "this is a test"
echo $(cal)
echo "$(cal)"
echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'
echo "The balance for user $USER is: \$5.00"
mv bad\&filename good_filename
```

**Escape Sequence**.

`\a, \b, \n, \r, \t`

```bash
sleep 10; echo -e "Time's up\a"
sleep 10; echo "Time's up" $'\a'
```

## 8 – Advanced Keyboard Tricks

`clear, history`

**Key**.
`Ctrl-a, Ctrl-e, Ctrl-f, Ctrl-b, Alt-f, Alt-b, Alt-l`

**Key**.

`Ctrl-d, Ctrl-t, Alt-t, Alt-l, Alt-u`

**Key**.

`Ctrl-k, Ctrl-u, Alt-d, Alt-Backspace, Ctrl-y`

**Key**.

`Alt-?, Alt-*`

```bash
history | less
history | grep /usr/bin
!88
```

**Key inside history**.

`Ctrl-p, Ctrl-n, Alt-<, Alt->, Ctrl-r, Alt-p, Alt-n, Ctrl-o`

**Sequence**.

`!!, !number, !string, !?string`

## 9 – Permissions

`id, chmod, umask, su, sudo, chown, chgrp, passwd`

```bash
file /etc/shadow
less /etc/shadow
> foo.txt
ls -l foo.txt
```

**Attribute**.

-, d, l, c, b
rwx, rwx, rwx
Owner, Group, World/Public
-rwx------
-rw-------
-rw-r--r--
-rwxr-xr-x
-rw-rw----
lrwxrwxrwx
drwxrwx---
drwxr-x---

```bash
> foo.txt
ls -l foo.txt
chmod 600 foo.txt
ls -l foo.txt
```

**Symbol**.

`u, g, o, a`

**Notation**.

`u+x, u-x, +x, o-rw, go=rw, u+x,go=rx`

```bash
rm -f foo.txt
umask
> foo.txt
ls -l foo.txt
rm foo.txt
umask 0000
> foo.txt
ls -l foo.txt
rm foo.txt; umask 0002
chmod u+s program
chmod g+s dir
chmod +t dir
su [-[l]] [user]
su -
exit
su -c 'command'
su -c 'ls -l /root/*'
sudo backup_script
sudo -l
chown [owner][:[group]] file...
```

**Argument**.

`bob, bob:users, :admins, bob:`

```bash
sudo cp myfile.txt ~tony
sudo ls -l ~tony/myfile.txt
sudo chown tony: ~tony/myfile.txt
sudo ls -l ~tony/myfile.txt
sudo mkdir /usr/local/share/Music
ls -ld /usr/local/share/Music
sudo chown :music /usr/local/share/Music
sudo chmod 775 /usr/local/share/Music
ls -ld /usr/local/share/Music
> /usr/local/share/Music/test_file
ls -l /usr/local/share/Music
sudo chmod g+s /usr/local/share/Music
ls -ld /usr/local/share/Music
umask 0002
rm /usr/local/share/Music/test_file
> /usr/local/share/Music/test_file
mkdir /usr/local/share/Music/test_dir
ls -l /usr/local/share/Music
passwd [user]
passwd
```

## 10 – Processes

`ps, top, jobs, bg, fg, kill, killall, shutdown, ps`

```bash
ps x
State:
R, S, D, T, Z, <, N
ps aux
```

**Header**.

`USER, %CPU, %MEM, VSZ, RSS, START`

```bash
top
xlogo
xlogo &
ps
jobs
jobs
fg %1
xlogo
bg %1
xlogo &
kill 28401
kill [-signal] PID...
```

**Number, Name**.

`(1, HUP), (2, INT), (9, KILL), (15, TERM), (18, CONT), (19, STOP), (20, TSTP)`

```bash
xlogo &
kill -1 13546
xlogo &
kill -INT 13601
xlogo &
kill -SIGINT 13608
```

**Number, Name**.

`(3, QUIT), (11, SEGV), (28, WINCH)`

```bash
kill -l
killall [-u user] [-signal] name...
xlogo &
killall xlogo
sudo reboot
sudo shutdown -h now
sudo shutdown -r now
```

**Command**.

`Pstree, vmstat, xload, tload`

## 11 – The Environment

`printenv, set, export, alias`

```bash
Printenv | less
printenv USER
set | less
echo $HOME
alias
```

**Variable**.

`DISPLAY, EDITOR, SHELL, HOME, LANG, OLDPWD, PAGER, PATH, PS1, PWD, TERM, TZ, USER`

```bash
/etc/profile
~/.bash_profile
~/.bash_login
~/.profile
/etc/bash.bashrc
~/.bashrc
foo="This is some "
echo $foo
foo=$foo"text."
echo $foo
gedit some_file
cp .bashrc .bashrc.bak
nano .bashrc
umask 0002
export HISTCONTROL=ignoredups
export HISTSIZE=1000
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
source ~/.bashrc
ll
```

## 12 – A Gentle Introduction to vi

`vi`

`rm -f foo.txt`
`vi foo.txt`

**Then inside all in vi**.

`:q, :q!, :w`

**Key**.

```bash
l or right arrow,
h or left arrow,
j or down arrow,
k or up arrow,
0 (zero),
^, $, w, W, b, B,
Ctrl-f or Page Down,
Ctrl-b or Page Up,
numberG,
G
```

**Deleting Command**.

`x, 3x, dd, 5dd, dW, d$, d0, d^, dG, d20G`

**Cutting, Copying, and Pasting Text**.

`yy, 5yy, yW, y$, y0, y^, yG, y20G`

**Searching**.

```bash
/charecter
Global Search-and-Replace:
:%s/Line/line/g
```

**Item**.

`:, %, s, /Line/line/, g`

**Global Search-and-Replace**.

`:%s/line/Line/gc`

**Key**.

`y, n, a, q or Esc, l, Ctrl-e, Ctrl-y`

```bash
vi file1 file2 file3...
ls -l /usr/bin > ls-output.txt
vi foo.txt ls-output.txt
```

**Switching Between Files:**.

`:bn, :bp, :buffers, :buffers 2`

`vi foo.txt`

**Inside editor**.

```bash
:e ls-output.txt
:buffers
:buffers 1
:buffer 2
```

`vi ls-output.txt`

**Inside Editor**.

```bash
:r foo.txt
ZZ
:w foo1.txt
```

## 13 – Customizing the Prompt

`echo $PS1`

**Sequence**.

`\a, \d, \h, \H, \j, \l, \n, \r, \s, \t, \T, \@, \A, \u, \v, \w, \W, \!, \#, \$, \[, \]`

```bash
ps1_old="$PS1"
echo $ps1_old
PS1="$ps1_old"
PS1=
PS1="\[\a\]\$ "
PS1="\A \h \$ "
PS1="<\u@\h \W>\$ "
```

**Sequence, Text Color**.

`(\033[0;30m, Black), (\033[0;31m, Red), (\033[0;32m, Green), ...........`

```bash
PS1="\[\033[0;31m\]<\u@\h \W>\$ "
PS1="\[\033[0;31m\]<\u@\h \W>\$\[\033[0m\] "
```

**Sequence, Background Color**.

`(\033[0;40m, Black), (\033[0;41m, Red), .................`

**Escape Code**.

`\033[l;cH, \033[nA, \033[nB, \033[nC, .................`

`PS1="\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]<\u@\h \W>\$ "`

**Saving the Prompt inside .bashrc**.

```bash
PS1="\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]<\u@\h \W>\$ "
export PS1
```

## 14 – Package Management

```bash
apt-get update
apt-get install package_name
dpkg -i package_file
apt-get remove package_name
apt-get update; apt-get upgrade
dpkg -i package_file
dpkg -l
dpkg --status emacs
apt-cache show package_name
```

## 15 – Storage Media

**very dangerous**.

`mount, umount, fsck, fdisk, mkfs, dd, genisoimage, wodim, md5sum`

```bash
su -
umount /dev/sdc
mkdir /mnt/cdrom
mount -t iso9660 /dev/sdc /mnt/cdrom
cd /mnt/cdrom
ls
umount /dev/sdc
cd
umount /dev/sdc
ls /dev
sudo tail -f /var/log/messages
sudo mkdir /mnt/flash
sudo mount /dev/sdb1 /mnt/flash
df
sudo umount /dev/sdb1
sudo fdisk /dev/sdb
```

**Command action**.

`a, b, c, d, l, m, n, o, p, q, s, t, u, v, w, x.`

```bash
sudo mkfs -t ext4 /dev/sdb1
sudo mkfs -t vfat /dev/sdb1
sudo fsck /dev/sdb1
dd if=input_file of=output_file [bs=block_size [count=blocks]]
dd if=/dev/sdb of=/dev/sdc
dd if=/dev/cdrom of=ubuntu.iso
genisoimage -o cd-rom.iso -R -J ~/cd-rom-files
wodim dev=/dev/cdrw blank=fast
wodim dev=/dev/cdrw image.iso
md5sum image.iso
md5sum /dev/cdrom
md5sum dvd-image.iso; dd if=/dev/dvd bs=2048 count=$(( $(stat -c "%s"dvd-image.iso) / 2048 )) | md5sum
```

## 16 – Networking

`ping, traceroute, ip, netstat, ftp, wget, ssh`

```bash
ping linuxcommand.org
traceroute slashdot.org
ip a
netstat -ie
netstat -r
```

```bash
wget http://linuxcommand.org/index.php
ssh remote-sys
ssh bob@remote-sys
ssh remote-sys free
ssh remote-sys 'ls *' > dirlist.txt
ssh remote-sys 'ls * > dirlist.txt'
ssh -X remote-sys
xload
scp remote-sys:document.txt .
scp bob@remote-sys:document.txt .
sftp remote-sys
```

**Into ftp mode**.

```bash
lcd Desktop
get ubuntu-8.04-desktop-i386.iso
```

## 17 – Searching for Files

`locate, find, xargs, touch, stat`

```bash
locate bin/zip
locate zip | grep bin
find ~
find ~ | wc -l
find ~ -type d | wc -l
find ~ -type f | wc -l
```

**File Type**.

`b, c, d, f, l`

`find ~ -type f -name "*.JPG" -size +1M | wc -l`

**Character size**.

`b, c, w, k, M, G`

**Test**.

```bash
-cmin n,
-cnewer file,
-ctime n,
-empty,
-group name,
-iname pattern,
-inum n,
-mmin n,
-mtime n,
-name pattern,
-newer file,
-nouser,
-nogroup,
-perm mode,
-samefile name,
-size n
-type c
-user name
```

```bash
find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
find . \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
find ~
find ~ -print
find ~ -type f -name '*.bak' -delete
find ~ -type f -name '*.bak' -print
find ~ -type f -and -name '*.bak' -and -print
```

**Test/Action**
`-print, -name ‘*.bak’, -type f`

```bash
find ~ -print -and -type f -and -name '*.bak'
-exec rm '{}' ';'
find ~ -type f -name 'foo*' -ok ls -l '{}' ';'
find ~ -type f -name 'foo*' -exec ls -l '{}' ';'
find ~ -type f -name 'foo*' -exec ls -l '{}' +
find ~ -type f -name 'foo*' -print | xargs ls -l
find ~ -iname '*.jpg' -print0 | xargs --null ls -l
```

```bash
mkdir -p playground/dir-{001..100}
touch playground/dir-{001..100}/file-{A..Z}
find playground -type f -name 'file-A'
find playground -type f -name 'file-A' | wc -l
touch playground/timestamp
stat playground/timestamp
touch playground/timestamp
stat playground/timestamp
find playground -type f -name 'file-B' -exec touch '{}' ';'
find playground \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
find playground \( -type f -not -perm 0600 -exec chmod 0600 '{}' ';' \) -or \( -type d -not -perm 0700 -exec chmod 0700 '{}' ';' \)
```

**Option**
`-depth, -maxdepth levels, -mindepth levels, -mount, -noleaf`

## 18 – Archiving and Backup

`gzip, bzip2, tar, zip, rsync`

```bash
ls -l /etc > foo.txt
ls -l foo.*
gzip foo.txt
ls -l foo.*
gunzip foo.txt
ls -l foo.*
```

**Option**
`-c, -d, -f, -h, -l, -r, -t, -v , -number`

```bash
gzip foo.txt
gzip -tv foo.txt.gz
gzip -d foo.txt.gz
ls -l /etc | gzip > foo.txt.gz
gunzip foo.txt
gunzip -c foo.txt | less
zcat foo.txt.gz | less
```

```bash
ls -l /etc > foo.txt
ls -l foo.txt
bzip2 foo.txt
ls -l foo.txt.bz2
bunzip2 foo.txt.bz2
```

**Mode**
`c, x, r, t`

```bash
mkdir -p playground/dir-{001..100}
touch playground/dir-{001..100}/file-{A..Z}
tar cf playground.tar playground
```

```bash
tar tf playground.tar
tar tvf playground.tar
mkdir foo
cd foo
tar xf ../playground.tar
ls
cd
tar cf playground2.tar ~/playground
cd foo
tar xf ../playground2.tar
ls home
ls home/me
sudo tar cf /media/BigDisk/home.tar /home
cd /
sudo tar xf /media/BigDisk/home.tar
tar xf archive.tar pathname
cd foo
tar xf ../playground2.tar --wildcards 'home/me/playground/dir-*/file-A'
find playground -name 'file-A' -exec tar rf playground.tar '{}' '+'
find playground -name 'file-A' | tar cf - --files-from=- | gzip > playground.tgz
find playground -name 'file-A' | tar czf playground.tgz -T -
ssh remote-sys 'tar cf - Documents' | tar xf -
```

```bash
zip -r playground.zip playground
cd foo
unzip ../playground.zip
unzip -l playground.zip playground/dir-087/file-Z
cd foo
unzip ../playground.zip playground/dir-087/file-Z
find playground -name "file-A" | zip -@ file-A.zip
ls -l /etc/ | zip ls-etc.zip -
unzip -p ls-etc.zip | less
```

```bash
rm -rf foo/*
rsync -av playground foo
rsync source destination
ls destination
rsync source/ destination
ls destination
mkdir /media/BigDisk/backup
sudo rsync -av --delete /etc /home /usr/local /media/BigDisk/backup
```

`alias backup='sudo rsync -av --delete /etc /home /usr/local/media/BigDisk/backup'`

```bash
sudo rsync -av --delete --rsh=ssh /etc /home/usr/local remote-sys:/backup mkdir fedora-devel
rsync -av –delete rsync://archive.linux.duke.edu/fedora/linux/development/rawhide/Everything/x86_64/os/ fedora-devel
```

## 19 – Regular Expressions

`ls /usr/bin | grep zip`

**Option**.
`-i, -v, -c, -l, -L, -n, -h`

```bash
/bin > dirlist-bin.txt
/usr/bin > dirlist-usr-bin.txt
/sbin > dirlist-sbin.txt
/usr/sbin > dirlist-usr-sbin.txt
dirlist*.txt
grep -l bzip dirlist*.txt
grep -L bzip dirlist*.txt
grep -h '.zip' dirlist*.txt
grep -h '^zip' dirlist*.txt
grep -h 'zip$' dirlist*.txt
grep -h '^zip$' dirlist*.txt
grep -i '^..j.r$' /usr/share/dict/words
grep -h '[bg]zip' dirlist*.txt
grep -h '[^bg]zip' dirlist*.txt
grep -h '^[ABCDEFGHIJKLMNOPQRSTUVWXZY]' dirlist*.txt
grep -h '^[A-Z]' dirlist*.txt
grep -h '[A-Z]' dirlist*.txt
grep -h '[-AZ]' dirlist*.txt
```

```bash
ls /usr/sbin/[ABCDEFGHIJKLMNOPQRSTUVWXYZ]*
ls /usr/sbin/[A-Z]*
echo $LANG
```

**Character Class**.
`[:alnum:], [:alnum:], [:word:], [:alpha:], [:blank:], [:cntrl:], [:digit:], [:graph:], [:lower:], [:punct:], [:print:], [:space:], [:upper:], [:xdigit:]`

```bash
echo "AAA" | grep AAA
echo "BBB" | grep AAA
echo "AAA" | grep -E 'AAA|BBB'
echo "BBB" | grep -E 'AAA|BBB'
echo "CCC" | grep -E 'AAA|BBB'
grep -Eh '^(bz|gz|zip)' dirlist*.txt
grep -Eh '^bz|gz|zip' dirlist*.txt
```

```bash
echo "(555) 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
echo "555 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
echo "AAA 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
echo "This works." | grep -E '[[:upper:]][[:upper:][:lower:] ]*\.'
echo "This Works." | grep -E '[[:upper:]][[:upper:][:lower:] ]*\.'
echo "this does not" | grep -E '[[:upper:]][[:upper:][:lower:] ]*\.'
echo "This that" | grep -E '^([[:alpha:]]+ ?)+$'
echo "a b c" | grep -E '^([[:alpha:]]+ ?)+$'
echo "a b 9" | grep -E '^([[:alpha:]]+ ?)+$'
echo "abc d" | grep -E '^([[:alpha:]]+ ?)+$'
```

**Specifier**.
`{n}, {n,m}, {n,} {,m}`

```bash
echo "(555) 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'
echo "555 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'
echo "5555 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'
for i in {1..10}; do echo "(${RANDOM:0:3}) ${RANDOM:0:3}-${RANDOM:0:4}" >> phonelist.txt; done
grep -Ev '^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$' phonelist.txt
```

```bash
find . -regex '.*[^-_./0-9a-zA-Z].*'
locate --regex 'bin/(bz|gz|zip)'
```

**inside less or vim**
`/^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$`
