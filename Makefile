
.PHONY: setup provision

setup:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install ansible

keyrepeat:
	defaults write -g KeyRepeat -int 2
	defaults write -g InitialKeyRepeat -int 10

provision: keyrepeat
	ansible-playbook -i "localhost," -K mac.yml

