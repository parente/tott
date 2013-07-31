#!/bin/bash

# not the best solution in the world, but side-steps having
# to setup agent forwarding on unknown windows boxes
( cat <<'EOP'
Host bitbucket.org
    IdentityFile /vagrant/.ssh/bitbucket
Host github.com
    IdentityFile /vagrant/.ssh/github
EOP
) > ~vagrant/.ssh/config

# from https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git
( cat <<'EOP'
# enable ssh-agent on first login with common keys
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add /vagrant/.ssh/bitbucket /vagrant/.ssh/github > /dev/null 2>&1
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
EOP
) >> ~vagrant/.bashrc
