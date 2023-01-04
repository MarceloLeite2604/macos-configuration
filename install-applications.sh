#!/bin/bash

set -e;

applications=(
  bitwarden
  google-chrome
  spotify
  visual-studio-code
  intellij-idea-ce
  colima
  docker
  iterm2
  zsh
  zoom
  git
  mvn
  nvm
  jumpcut
  rar
  shellcheck
  temurin
  docker-compose
  postman
)
readonly applications;

brew_bin=$(which brew);

# Install Homebrew
[[ -z "$brew_bin" ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew_bin=$(which brew);
[[ -z "$brew_bin" ]] && >&2 echo "Could not find Homebrew after installation." && exit 1;

for application in "${applications[@]}";
do
  if brew list "$application" > /dev/null 2>&1;
  then
    echo "Application $application is already installed.";
  else
    echo "Installing $application using Homebrew.";
    brew install "$application";
  fi;
done

# Install Zsh Oh-my-zsh plugin.
zsh_bin=$(which zsh)

if [[ -z "$zsh_bin" ]];
then
  echo "Installing zsh \"oh-my-zsh\" plugin.";
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi;