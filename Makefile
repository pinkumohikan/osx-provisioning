
.PHONY: setup provision

setup:
	sudo xcodebuild -license
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install ansible

provision:
	ansible-playbook -i "localhost," -K mac.yml
