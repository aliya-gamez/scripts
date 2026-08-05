#!/usr/bin/env bash

sudo apt update

### packages
INITIAL=(
	zsh
)

### install function
install_packages() {
	local GROUP="$1"
	local -n PACKAGES="$2"

	echo ""
	echo "### Installing $GROUP"

	sudo apt install -y "${PACKAGES[@]}"
}

### check if command/alias exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

### install via curl if not exists
install_via_curl() {
	local NAME="$1"
	local URL="$2"

	if command_exists "$NAME"; then
		echo "$NAME already installed, skipping..."
	else
		echo "Installing $NAME..."
		curl -LsSf "$URL" | bash
	fi
}

### install function calls
install_packages "INITIAL" INITIAL

# curl installs
echo ""
echo "### Installing via curl sh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"