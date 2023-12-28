FROM docker.io/library/rockylinux:9-minimal
#LABEL \
#  description="Rocky Linux 9 interactive base" \
#   maintainer="Ellam ByDefault <ellam.bydefault@gmail.com>"
RUN \
  \
  `####################` \
  `# Install packages #` \
  `####################` \
  \
  &&  microdnf install -y \
        bash-completion \
        less \
        vim  \
  \
  &&  microdnf clean all \
  &&  rm -rf /var/cache/yum \
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
  &&  echo "PS1='\e[1;31m[\u@\H:\w]\$\e[m '"  >> /root/.bashrc \
  &&  echo                                    >> /root/.bashrc \
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

