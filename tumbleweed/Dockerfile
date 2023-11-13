FROM  registry.opensuse.org/opensuse/tumbleweed
LABEL description="iLab OpenVPN Client"
LABEL maintainer="Ellam ByDefault <ellam.bydefault@gmail.com>"
COPY  ct/*.sh conf/ /
CMD   /entrypoint.sh
RUN   \
  \
  `####################` \
  `# Install packages #` \
  `####################` \
  \
      zypper mr --disable repo-openh264 \
  &&  `# zypper -n dup --no-allow-downgrade` \
  &&  zypper -n in \
        openvpn         \
        openssh         \
        bash-completion \
        less            \
        vim             \
        vim-data        \
        jq              \
        iproute2        \
        iputils         \
        bind-utils      \
        iperf           \
        nmap            \
        mtr             \
        httpie          \
        netcat-openbsd  \
        `# git`         \
        `# ipmitool`    \
  \
  &&  zypper cc -a \
  &&  rm -rf \
        /var/log/zypp \
        /var/log/zypper.log \
  \
  `######################` \
  `# Set OpenVPN client #` \
  `######################` \
  \
  &&  chmod +x /*.sh \
  &&  mv \
        /up.sh        \
        /down.sh      \
        /*.ovpn       \
        /*.conf       \
        /etc/openvpn/ \
  \
  `##################` \
  `# Set SSH server #` \
  `##################` \
  \
  &&  ssh-keygen -A \
  &&  mkdir /root/.ssh \
  &&  curl -L -o /root/.ssh/authorized_keys \
        https://github.com/geekobiloba.keys \
  \
  `############` \
  `# Set govc #` \
  `############` \
  \
  &&  curl -L -o - \
        https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m | sed 's,aarch64,arm64,').tar.gz \
      | tar -C /root/bin -xvzf - govc \
  &&  curl -L -o /etc/bash_completion.d/govc.sh \
        https://raw.githubusercontent.com/vmware/govmomi/master/scripts/govc_bash_completion \
  &&  mv /.govc /root/ \
  &&  echo '. ~/.govc' >> /root/.bashrc \
  \
  `############` \
  `# Set Bash #` \
  `############` \
  \
  &&  echo 'set completion-ignore-case on' >> /etc/inputrc \
  \
  &&  echo                                    >> /root/.bashrc \
  &&  echo '[ -d ~/bin ] && PATH=~/bin:$PATH' >> /root/.bashrc \
  &&  echo                                    >> /root/.bashrc \
  &&  echo 'alias   rm="rm   -i"'             >> /root/.bashrc \
  &&  echo 'alias   mv="mv   -i"'             >> /root/.bashrc \
  &&  echo 'alias   cp="cp   -i"'             >> /root/.bashrc \
  &&  echo 'alias    l="ls   -lA"'            >> /root/.bashrc \
  &&  echo 'alias   l1="ls   -1"'             >> /root/.bashrc \
  &&  echo 'alias   la="ls   -a"'             >> /root/.bashrc \
  &&  echo 'alias   ll="ls   -l"'             >> /root/.bashrc \
  &&  echo 'alias  lla="ls   -la"'            >> /root/.bashrc \
  &&  echo 'alias llah="ls   -lah"'           >> /root/.bashrc \
  &&  echo 'alias less="less -Ri"'            >> /root/.bashrc \
  &&  echo 'alias grep="grep -E --color"'     >> /root/.bashrc \
  &&  echo 'alias  sed="sed  -r"'             >> /root/.bashrc \
  &&  echo 'alias   jq="jq   --color-output"' >> /root/.bashrc \
  &&  echo 'alias  cls="clear"'               >> /root/.bashrc \
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

# vim: syntax=dockerfile

