#!/bin/bash
set -eu

echo "git clone"
cd
git clone $TARGET_REPO
rsync -av -C --delete ~/repo/docs/.vuepress/dist/ ~/oauth2/
cd ~/oauth2/

echo "git commit"
git config --global user.email "circleci@circleci.com"
git config --global user.name "circleci"
git add --all :/;
git commit -m "deploy from circleci"

echo "git push"
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
ssh-add -d
git push
