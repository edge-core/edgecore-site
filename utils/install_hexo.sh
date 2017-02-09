#!/bin/bash
# Ref: https://hexo.io/docs/index.html

# Warning: DON'T EVER RUN NPM as root. Just DON'T.

wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
nvm install stable
npm install -g hexo-cli

cat <<'EOF' >> ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
EOF

source ~/.bashrc

