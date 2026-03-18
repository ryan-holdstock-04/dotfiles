#!/usr/bin/env bash
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

limactl start itsc-3146
limactl shell itsc-3146 -- true
sshfs -v -F ~/.lima/itsc-3146/ssh.config lima-itsc-3146:/home/itsc ~/mnt/schoolvm/
echo "sshfs exit code: $?"

kitty -e limactl shell itsc-3146
