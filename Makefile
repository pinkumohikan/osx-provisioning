
.PHONY: setup provision

setup:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install ansible

keyrepeat:
	defaults write -g KeyRepeat -int 2
	defaults write -g InitialKeyRepeat -int 10

provision: keyrepeat
	ansible-playbook -i "localhost," -K mac.yml

