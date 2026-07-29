#!/usr/bin/env bash

### packages
INITIAL=(
	curl
)

### iinstall function
install_packages() {
	local GROUP="$1"
	local -n PACKAGES="$2"

	echo ""
	echo "### Installing $GROUP"

	sudo apt install -y "${PACKAGES[@]}"
}


### install function calls
install_packages "INITIAL" INITIAL

# curl installs
curl -LsSf https://astral.sh/uv/install.sh | sh #uv
curl -fsSL https://opencode.ai/install | bash #opencode