#!/usr/bin/env bash
BRed='\033[1;31m'
BGreen="\033[1;32m"
Color_Off="\033[0m"

pwd
cd ./server
if [[ '{{ cookiecutter.add_account }}' != 'yes' ]];then
  rm -r account/
fi

cd ../
git init
git remote add origin git@gitlab.com:{{cookiecutter.namespace}}/{{cookiecutter.repo_name}}.git
git add * .gitignore .gitlab-ci.yml
git commit -m "Init"

echo -e "${BGreen}Initiated! Ready to push!${Color_Off}"
echo -e "Create the Repository (if you have the permission) by running:"
echo -e "${BGreen}git push --set-upstream git@gitlab.com:{{cookiecutter.namespace}}/{{cookiecutter.repo_name}}.git master${Color_Off}"
