FROM registry.opensuse.org/opensuse/tumbleweed
#LABEL \
#  description="openSUSE Tumbleweed interactive base image" \
#   maintainer="Ellam ByDefault <ellam.bydefault@gmail.com>"
RUN \
  \
  `####################` \
  `# Install packages #` \
  `####################` \
  \
      zypper mr --disable repo-openh264 \
  &&  zypper -n in \
        bash-completion \
        less            \
        vim             \
        vim-data        \
  \
  &&  zypper cc -a \
  &&  rm -rf \
        /var/log/zypp \
        /var/log/zypper.log \
  \
  &&  echo 'set completion-ignore-case on' >> /etc/inputrc \
  \
  &&  echo                                >> /root/.bashrc \
  &&  echo 'export PATH=$HOME/bin:$PATH'  >> /root/.bashrc \
  &&  echo                                >> /root/.bashrc \
  &&  echo "alias   rm='rm   -i'"         >> /root/.bashrc \
  &&  echo "alias   mv='mv   -i'"         >> /root/.bashrc \
  &&  echo "alias   cp='cp   -i'"         >> /root/.bashrc \
  &&  echo "alias   ls='ls   --color'"    >> /root/.bashrc \
  &&  echo "alias    l='ls   -lA'"        >> /root/.bashrc \
  &&  echo "alias   l1='ls   -1'"         >> /root/.bashrc \
  &&  echo "alias   la='ls   -a'"         >> /root/.bashrc \
  &&  echo "alias   ll='ls   -l'"         >> /root/.bashrc \
  &&  echo "alias  lla='ls   -la'"        >> /root/.bashrc \
  &&  echo "alias llah='ls   -lah'"       >> /root/.bashrc \
  &&  echo "alias less='less -Ri'"        >> /root/.bashrc \
  &&  echo "alias grep='grep -E --color'" >> /root/.bashrc \
  &&  echo "alias  sed='sed  -r'"         >> /root/.bashrc \
  &&  echo "alias  cls='clear'"           >> /root/.bashrc \
  &&  echo                                >> /root/.bashrc \
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

