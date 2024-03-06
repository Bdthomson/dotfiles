#!/bin/bash
# Check if .vimrc exists
cd ~/
if [ ! -f ~/".vimrc" ]; then
    echo "Downloading .vimrc"
    cd ~/ && curl -O https://raw.githubusercontent.com/Bdthomson/dotfiles/main/.vimrc
else
    echo ".vimrc already exists."
fi

# Check if Nord.itermcolors exists
if [ ! -f ~/Documents/"Nord.itermcolors" ]; then
    echo "Downloading Nord.itermcolors"
    cd ~/Documents/ && curl -O https://raw.githubusercontent.com/nordtheme/iterm2/develop/src/xml/Nord.itermcolors
else
    echo "Nord.itermcolors already exists."
fi

if test -e "/Applications/iTerm.app"; then
	echo "iTerm already installed"
else
	echo "iTerm not detected. Do you want to install it?"
	read -p "> " answer
	if [[ $answer = y ]]; then
		cd ~/Downloads/
		if [ ! -f ~/Downloads/"iterm.zip" ]; then
			echo "Downloading iterm2"
			curl -L https://iterm2.com/downloads/stable/latest -o iterm.zip
			unzip iterm.zip
			mv iTerm.app /Applications/
		else
			echo "iterm2 already exists."
		fi
	elif [[ $answer = n ]]; then
		echo "Skipping installation of iterm"
	else
		echo "Invalid response."
	fi
fi

# Check if Homebrew is installed
if [ -d "/usr/local/Homebrew" ] || [ -d "/opt/homebrew" ]; then
    echo "Homebrew is already installed."
else
	echo "Homebrew not installed. Installing now..."
    # Running the Homebrew installation script
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

fi

# Check if Git is installed
if ! command -v git &> /dev/null
then
    echo "Git not installed. Installing now..."
	brew install git
else
    echo "git is already installed."
fi

# Check if awscli is installed
if ! command -v awscli &> /dev/null
then
    echo "AWS CLI not installed. Installing now..."
    brew install awscli
else
    echo "awscli is already installed."
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is installed."
else
	echo "Do you want to use oh-my-zsh? (y/n)"
	read -p "> " answer
		if [[ $answer = y ]]; then
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		elif [[ $answer = n ]]; then
			echo "Skipping installation of oh-my-zsh"
		else
			echo "Invalid response."
		fi
fi


if [ -d "$HOME/aliases.sh" ]; then
    echo "Aliases already installed"
else
	echo "Do you want to add Blake's suggested aliases to your shell? (y/n)"
	read -p "> " answer
	if [[ $answer = y ]]; then
		cd ~/ && curl -O https://raw.githubusercontent.com/Bdthomson/dotfiles/main/aliases.sh
		echo "source ~/aliases.sh" >> ~/.zshrc
		source ~/.zshrc
	elif [[ $answer = n ]]; then
		echo "Skipping installation of aliases"
	else
		echo "Invalid response."
	fi
fi




echo "Do you want to open websites for applications to install? (y/n)"
read -p "> " answer
	if [[ $answer = y ]]; then
		open http://code.visualstudio.com
		echo "Opened Raycast.com. If using, don't forget to disable spotlight hotkey before setting Raycast shortcut as Command+Space"
		open http://raycast.com
		open https://www.s-ndr.be/wiki/replace-spotlight-with-raycast/
	elif [[ $answer = n ]]; then
		echo "Skipping installation of iterm"
	else
		echo "Invalid response."
	fi


# Install Node Version Manager and NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install v18.18.2

# Obisidian Notes
open https://obsidian.md/
open https://github.com/Aidurber/obsidian-plugin-dynamic-toc/releases
cd ~/Documents/ && curl -O https://raw.githubusercontent.com/nordtheme/iterm2/develop/src/xml/Nord.itermcolors


echo 'Recommended Chrome Extensions: ublock origin, JSON Formatter'
echo 'acknowledge extensions?'

echo 'Downloading iterm theme'


# Github SSH Keys
open https://github.com/settings/keys
open https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# Fig
open https://fig.io/download

# Intellij
# open https://www.jetbrains.com/idea/download/?section=mac

# Spotify
open https://www.spotify.com/us/download/mac/

# Gitkraken
open https://www.gitkraken.com/

# VSCode
open https://code.visualstudio.com/

# Postman
# open https://www.postman.com/downloads/


echo 'Mac OS Settings'
echo 'Update Scrolling Direction: Uncheck Natural Scrolling'

echo 'Open Keyboard Settings'
echo 'Set "Key repeat rate" to Fast'
echo 'Set "Delay until repeat" to Short'
