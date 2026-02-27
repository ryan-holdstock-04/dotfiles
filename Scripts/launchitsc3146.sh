#!/usr/bin/env bash
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/limactl
kitty -e limactl shell itsc-3146
sshfs -F ~/.lima/itsc-3146/ssh.config lima-itsc-3146:/home/itsc ~/mnt/vm
