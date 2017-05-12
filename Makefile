
default: setup apply

setup:
	sudo xcodebuild -license
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install ansible
	$(MAKE) _set_brew_cask_option

apply:
	ansible-playbook -i "localhost," mac.yml

_set_brew_cask_option:
	grep 'HOMEBREW_CASK_OPTS' ~/.bash_profile || echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bash_profile
	source ~/.bash_profile
