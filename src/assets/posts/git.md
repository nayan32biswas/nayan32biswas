# Git

## Installation

```bash
sudo apt update
sudo apt install git
git --version
```

## generate and copy ssh-key

**For Linux**

```bash
ssh-keygen -t rsa -b 4096 -C "nayan32biswas@gmail.com"
cat ~/.ssh/id_rsa.pub
```

**For Windows**

1. Git bash -> Run as Administrator
2. `ssh-keygen`
3. Open file **id_rsa.pub** from `C:\Users\<<PC User Name>>\.ssh` and copy all data.

**global setup**.

```bash
git config --global user.name "Nayan Biswas"
git config --global user.email "nayan32biswas@gmail.com"
```

## Set repository

**Create a new repository**.

```bash
git clone git@gitlab.com:nayan32biswas/Demo.git
cd Demo
touch README.md
git add README.md
git commit -m "add README"
git push -u origin <master>
```

**Push an existing folder**.

```bash
cd existing_folder
git init
git remote add origin git@gitlab.com:nayan32biswas/Demo.git
git add .
git commit -m "Initial commit"
git push -u origin <master>
```

**Push an existing Git repository**.

```bash
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.com:nayan32biswas/Demo.git
git push -u origin --all
git push -u origin --tags
```

## Multiple Git Account
- If service provider are different(github, gitlab, etc) then just add ssk to the ssh setting.
- If service provider are same like double account on gitlab the follow those rules.

1. `ssh-keygen -t rsa -b 4096 -C "temp@gmail.com" -f ~/.ssh/<your-filename>`
2. `vi ~/.ssh/config`
   ```
   Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_rsa

   Host <gitlab.com-anyname>
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/<your-filename>
   ```
- `git clone git@<<<gitlab.com-anyname>>>:yourrepo-username/project.git`


## Branch

**Create Branch**.

```bash
git checkout -b <branch_name>
```

**Delete branch**.

```bash
git branch -d <branch_name>
```

## merge

**Git merge two branch**.

- `git checkout <master>` you will switch to branch `<master>`.
- `git merge <common>` this will merge all changes from branch `<common>` into branch `<master>`.
- `git commit -a` this will commit your changes.

**merge and replace branch master with branch common. common-->master**.

```bash
git checkout <common>
git merge -s ours <master>
git checkout <master>
git merge <common>
```

## Rebase

let say Here are two brance `<master>` and `<common>`. Now rebase or combain `<common>` into `<master>` though `<master>` is already changed.

- `git checkout master`
- `git pull origin master`
- `git checkout common`
- `git rebase master`
resolve conflict then
- `git add .`
- `git rebase --continue`
Continue this process until complete it.

**Reset to specific commit**.

```bash
git reset --hard <cedc856>
git push --force origin <master>
```

**You can undo git add before commit with**.

```bash
git reset or git reset <file>
```

## Git LFS

- `git lfs install` Install
- `git lfs track "*.psd"` it will create **.gitattributes** file
- Then continue with regular command.
- `git-lfs --help` Read doc for extra feature.


## Tools

- `git ls-files | xargs wc -l` count number of line **(loc)** in a project.
- `git log` To see comited.

## Commands

- `git rm --cached <expression>` Remove local cache. It's help gitignore to ignore some thing.
- `git submodule add <url> <sub_module_folder>` Add submobule
- `git add -p <file>` Pertial commit of a file. Select topic by n/y in a file.
- 