
.PHONY: setup provision keyrepeat

setup:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	PATH=/opt/homebrew/bin:$$PATH
	brew install ansible

provision: keyrepeat
	chsh -s /bin/bash
	ansible-playbook -i "localhost," -K mac.yml

keyrepeat:
	defaults write -g KeyRepeat -int 2
	defaults write -g InitialKeyRepeat -int 10
	defaults write -g ApplePressAndHoldEnabled -bool false

