
.PHONY: setup apply brew_cask_option/set

setup:
	sudo xcodebuild -license
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install ansible

apply:
	ansible-playbook -i "localhost," mac.yml
