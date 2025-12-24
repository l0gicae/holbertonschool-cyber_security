grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"' | cut -d' ' -f1
