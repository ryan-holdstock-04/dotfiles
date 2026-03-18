#!/usr/bin/env bash
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/usr/bin:/usr/local/bin
limactl start itsc-3146
kitty -e limactl shell itsc-3146
