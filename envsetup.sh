#!/bin/bash
sudo yum install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cat > file.tmp <<'endmsg'
export ZSH="/home/ec2-user/.oh-my-zsh"                                                                                                                        
                                                                                                                                                              
# Lazy Load nvm, node npm and npx                                                                                                                             
lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  if [ -f "$NVM_DIR/bash_completion" ]; then
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  fi
}

nvm() {
  lazynvm 
  nvm $@
}
 
node() {
  lazynvm
  node $@
}
 
npm() {
  lazynvm
  npm $@
}

npx() {
  lazynvm
  npx $@
}                                                                                                                                                      
                                                                                                                                                              
# Autoload ZSH nvm plugin                                                                                                                                     
plugins=(git aws )      
endmsg

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

. ~/.nvm/nvm.sh

nvm install 15

nvm use 15

npm install -g @aws-amplify/cli
