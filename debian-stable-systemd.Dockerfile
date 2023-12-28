FROM docker.io/library/debian:latest
RUN <<RUNDOC

# Install packages
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt-get install -y \
  bash-completion \
  bat \
  curl \
  init \
  jq \
  less \
  python3

# Clean APT cache
apt-get autopurge -y
apt-get clean
rm -rf /var/lib/apt/lists/*

# inputrc
cat <<"EOF" > /root/.inputrc
$include /etc/inputrc
set completion-ignore-case on
EOF

# bashrc
cat <<EOF >> /root/.bashrc

. /etc/bash_completion

export LESS="-Ri"

PS1='\e[1;31m\u@\h:\w\$\e[m '

alias   rm="rm -i"
alias   mv="mv -i"
alias   cp="cp -i"

alias   ls="ls --color"
alias   la="ls -A"
alias   ll="ls -alF"
alias   l1="ls -1"
alias    l="ls -CF"

alias  cls="clear"
alias  sed="sed  -E"
alias grep="grep -E --color"
EOF

RUNDOC

CMD [ "/sbin/init" ]

# vim: ft=dockerfile:

