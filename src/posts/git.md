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

   Host <gitlab.com-any-name>
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/<your-filename>
   ```
- `git clone git@<<<gitlab.com-any-name>>>:your-repo-username/project.git`


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

let say Here are two branch `<master>` and `<common>`. Now rebase or combine `<common>` into `<master>` though `<master>` is already changed.

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
- `git log` To see committed.

## Remove cache file

- `git rm --cached <expression>` Remove local cache. It's help gitignore to ignore some thing.

## submodule
### Add Add submodule
- `git submodule add <url> <sub_module_folder>`
### Delete Submodule
1. Delete the relevant section from the `.gitmodules` file.
2. `git add .gitmodules` Stage the .gitmodules changes.
3. Delete the relevant section from .git/config.
4. `git rm --cached path_to_submodule` Remove the submodule files from the working tree and index(no trailing slash).
5. `rm -rf .git/modules/path_to_submodule` Remove the submodule's .git directory.
6. `git commit -m "Removed submodule <name>"` Commit the changes.
7. `rm -rf path_to_submodule` Delete the now untracked submodule files.


## Git Pre-commit

### [setup husky](https://typicode.github.io/husky/#/)
- `npm install husky --save-dev`
- `npx husky install`
- `npm set-script prepare "husky install"`
- `npx husky add .husky/pre-commit "npm test"`
- Write shell inside **.husky/pre-commit** file


## Git merge and rebase with example

#### Initialize new repository

First initiate project add build a base line where we will be start every time.

Here, **t[n]** will be the time when commit was added and it's incremental. **m[n]** was the commit in main branch and **f[n]** was the commit in feature branch.

Add change with commit **m1** at time **t1**

```bash
mkdir git-test; cd git-test
git init
echo "m1" >> main.md
git add . && git commit -m "m1"
```

You want to add new feature in this repository. Add change with commit **f1** at time **t2**

```bash
git checkout -b feature
echo "f1" >> feature.md
git add . && git commit -m "f1"
```

Let's imagine after adding feature f1 in feature branch some one add new functionality in main branch with commit **m2** at time **t3**.

```bash
git checkout main
echo "m2" >> main.md
git add . && git commit -m "m2"
```

And you added new feature **f2** in the feature branch at time **t4**

```bash
git checkout feature
echo "f2" >> feature.md
git add . && git commit -m "f2"
```

After all of this the log tree will look like this.

```
     f1[t2]--------f2[t4]  feature
     /
    /
---m1[t1]----m2[t3]        main
```

Now there has multiple way to add feature functionality with our main branch.

### Merge feature branch and main branch

#### git merge feature

**First initialize the project**

Directly merge feature branch into the main branch and add default commit **m3'** at time **t5**

```bash
git checkout main
git merge feature
```

Let's look into the log tree.

```
     f1[t2]----------------f2[t4]         feature
     /     \                    \
    /       \                    \
---m1[t1]----f1[t2]----m2[t3]----f2[t4]-----m3'[t5]  main
```

This merge command will add all commit from feature branch and will add them with main branch commits at chronological order.

#### git merge --squash feature

**First initialize the project**

Merge feature branch into the main branch and add default commit **m3'** at time **t5**

```bash
git checkout main
git merge --squash feature
git add . && git commit -m "m3'"
```

Let's look into the log tree.

```
     f1[t2]--------f2[t4]        feature
     /                 \
    /                   \
---m1[t1]----m2[t3]----m3'[t5]   main
```

This merge with --squash option will add all change in feature branch to main branch and change will added as new change. After the command you need to add commit message **m3'** for the change.

### Rebase feature branch and main branch

#### git rebase main

**First initialize the project**

Rebase **feature** branch with **main** branch.

```bash
git checkout feature
git rebase main
```

After running above command the log of feature branch will change from `m1[t1]----f1[t2]----f2[t4]` to `m1[t1]----m2[t3]----f1[t2]----f2[t4]`. The commit order won't flow the chronological order. And log tree will look like this.

```
      m2[t3]----f1[t2]----f2[t4]   feature
     /
    /
---m1[t1]----m2[t3]                 main
```

#### git rebase feature

**First initialize the project**

Rebase **feature** branch with **main** branch.

```bash
git checkout main
git rebase feature
```

After running above command the log of mail branch will change from `m1[t1]----m2[t3]` to `m1[t1]---f1[2]----f2[t4]----m2[t3]`. The commit order won't flow the chronological order. And log tree will look like this.

```
     f1[t2]-----f2[t4]                 feature
     /     \        \
    /       \        \
---m1[t1]----f1[2]----f2[t4]----m2[t3] main
```

Rebase does not follow chronological order to generate new log.

### Combine Merge and Rebase

#### Combine merge and rebase command to add feature branch to main branch

**First initialize the project**

```bash
git checkout feature
git rebase main

git checkout main
git merge feature
```

After running above command the log of feature branch will change from `m1[t1]----f1[t2]----f2[t4]` to `m1[t1]----m2[t3]----f1[t2]----f2[t4]` and log of main branch will also become `m1[t1]----m2[t3]` to `m1[t1]----m2[t3]----f1[t2]----f2[t4]`. After all of the command log tree will look like this.

```
      m2[t3]----f1[t2]----f2[t4]       feature
     /     \         \        \
    /       \         \        \
---m1[t1]----m2[t3]----f1[2]----f2[t4] main
```
