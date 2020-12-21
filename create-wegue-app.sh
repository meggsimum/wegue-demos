#!/bin/bash

# This script creates a directory with a Wegue template application
# It includes a git submodule with the the Wegue source code 
# https://www.github.com/meggsimum/wegue
# This makes it possible upgrade the application 
# to the latest release with limited effort

# get directory name from user input
APP_DIR="$1"
if [ -z "$1" ]
  then
    APP_DIR="my-wegue-app"
fi

if [ -d "${APP_DIR}" ]; then
  echo
  echo "Directory \"${APP_DIR}\" already exists."
  echo "Exiting ... "
  echo

  exit
fi

echo
echo "Create directory \"${APP_DIR}\""
echo

mkdir "${APP_DIR}"

# check if git exists
if ! command -v git &> /dev/null
then
    echo
    echo "git is not installed"
    echo "Please install git"
    echo "Exiting ... "

    exit
fi

# TODO: alternatively offer download as zip

# TODO: let user choose Version or Commit

# init git repo
cd "${APP_DIR}" || exit
git init

# add wegue as git submodule
echo
echo "Download Wegue"
echo
git submodule add --depth 1 https://www.github.com/meggsimum/wegue

# TODO: currently we only clone the latest commit
#       in order to reduce download time
#       in future we could ask the user to clone the 
#       whole history using "git pull --unshallow"

# copy app folder to root
echo
echo "Create custom application setup"
echo
cp -r \
  wegue/app-starter \
  app

# make symlink
rm -rf wegue/app
ln -s ../app wegue/app
rm app/README.md

# TODO: ask user to install npm

# TODO: check if NPM is installed
# install app
echo
echo "Install application"
echo
if ! command -v npm &> /dev/null
  then
    echo
    echo "npm is not installed"
    echo "Please install npm"
    echo "Exiting ... "
    exit
fi
npm install --prefix wegue

echo
echo
echo "SUCCESS!"
echo

echo
echo "Dependencies have been installed."
echo "You can run your application with:"
echo "       npm run dev --prefix wegue"
