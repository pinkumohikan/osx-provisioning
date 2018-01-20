
.PHONY: setup apply brew_cask_option/set

setup:
	sudo xcodebuild -license
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install ansible
	$(MAKE) brew_cask_option/set

apply:
	ansible-playbook -i "localhost," mac.yml

brew_cask_option/set:
	grep 'HOMEBREW_CASK_OPTS' ~/.bash_profile || echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bash_profile
	source ~/.bash_profile
