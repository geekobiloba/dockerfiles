FROM docker.io/library/debian:stable-slim
#LABEL \
#  description="Debian stable interactive base" \
#   maintainer="Ellam ByDefault <ellam.bydefault@gmail.com>"
RUN \
  \
  `####################` \
  `# Install packages #` \
  `####################` \
  \
  export DEBIAN_FRONTEND=noninteractive \
  \
  &&  apt update \
  &&  apt upgrade -y \
  &&  apt install -y \
        bash-completion \
        less \
        vim  \
  \
  &&  apt autopurge -y \
  &&  apt clean \
  &&  rm -rf /var/lib/apt/lists/* \
  \
  `########################` \
  `# Set main environment #` \
  `########################` \
  \
  `###############################` \
  `# Set interactive environment #` \
  `###############################` \
  \
  &&  mkdir -p ~/bin \
  \
  &&  echo 'set completion-ignore-case on' >> /etc/inputrc \
  \
  &&  echo                                    >> /root/.bashrc \
  &&  echo '. /etc/bash_completion'           >> /root/.bashrc \
  &&  echo                                    >> /root/.bashrc \
  &&  echo 'export PATH=$HOME/bin:$PATH'      >> /root/.bashrc \
  &&  echo                                    >> /root/.bashrc \
  &&  echo "PS1='\e[1;31m[\u@\H:\w]\$\e[m '"  >> /root/.bashrc \
  &&  echo                                    >> /root/.bashrc \
  &&  echo "alias   rm='rm   -i'"             >> /root/.bashrc \
  &&  echo "alias   mv='mv   -i'"             >> /root/.bashrc \
  &&  echo "alias   cp='cp   -i'"             >> /root/.bashrc \
  &&  echo "alias   ls='ls   --color'"        >> /root/.bashrc \
  &&  echo "alias    l='ls   -lA'"            >> /root/.bashrc \
  &&  echo "alias   l1='ls   -1'"             >> /root/.bashrc \
  &&  echo "alias   la='ls   -a'"             >> /root/.bashrc \
  &&  echo "alias   ll='ls   -l'"             >> /root/.bashrc \
  &&  echo "alias  lla='ls   -la'"            >> /root/.bashrc \
  &&  echo "alias llah='ls   -lah'"           >> /root/.bashrc \
  &&  echo "alias less='less -Ri'"            >> /root/.bashrc \
  &&  echo "alias grep='grep -E --color'"     >> /root/.bashrc \
  &&  echo "alias  sed='sed  -r'"             >> /root/.bashrc \
  &&  echo "alias  cls='clear'"               >> /root/.bashrc \
  &&  echo                                    >> /root/.bashrc \
  \
  `#############` \
  `# Set vimrc #` \
  `#############` \
  \
  &&  echo 'set nocompatible'       >> /root/.vimrc \
  &&  echo 'set number'             >> /root/.vimrc \
  &&  echo 'set backspace=2'        >> /root/.vimrc \
  &&  echo 'set tabstop=2'          >> /root/.vimrc \
  &&  echo 'set shiftwidth=2'       >> /root/.vimrc \
  &&  echo 'set expandtab'          >> /root/.vimrc \
  &&  echo 'set ignorecase'         >> /root/.vimrc \
  &&  echo 'set smartcase'          >> /root/.vimrc \
  &&  echo 'set encoding=utf-8'     >> /root/.vimrc \
  &&  echo 'set fileencoding=utf-8' >> /root/.vimrc \
  &&  echo 'set backupcopy=yes'     >> /root/.vimrc \
  &&  echo 'set background=dark'    >> /root/.vimrc \
  &&  echo 'set laststatus=2'       >> /root/.vimrc \
  &&  echo 'set mouse=a'            >> /root/.vimrc \
  &&  echo                          >> /root/.vimrc \
  &&  echo 'syntax      on'         >> /root/.vimrc \
  &&  echo 'colorscheme desert'     >> /root/.vimrc \
  &&  echo                          >> /root/.vimrc \

