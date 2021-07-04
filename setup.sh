#! /bin/sh

echo "Running setup..."
echo

# do a check to see if a .vimrc already exists before overwriting the existing .vimrc
VIM_CONFIG_FILE="$HOME/.vimrc"
echo "Checking if .vimrc file exists in home directory..."
if [ -f "$VIM_CONFIG_FILE" ]; then
    echo ".vimrc file found"
    while true; do
        # need to prompt user if he/she wants to proceed with overwriting existing .vimrc
        read -p "Do you still want to proceed and overwrite your existing .vimrc?(y/n) "  overwrite
        case $overwrite in
            [Yy]* ) break;;
            [Nn]* ) echo "Exiting setup... "; exit;;
            * ) echo "Please answer y for (yes) or n for (no).";;
        esac
    done
else
    echo "Check complete"
fi
echo

# do a check to see if the nvim directory already exists
# if does not exist, then create the directory
NVIM_CONFIG_DIR="$HOME/.config/nvim/"
echo "Checking if nvim/ directory exists in ~/.config directory..."
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Directory found!"
else
    echo "Directory not found, creating directory..."
    mkdir $NVIM_CONFIG_DIR
    echo "Directory created!"
fi
echo

# do a check if init.vim already exists
NVIM_CONFIG_FILE="${NVIM_CONFIG_DIR}init.vim"
echo "Checking if init.vim file exists in ~/.config/nvim/ directory..."
if [ -f "$NVIM_CONFIG_FILE" ]; then
    echo "init.vim file found"

    while true; do
        # need to prompt user if he/she wants to proceed with overwriting existing init.vim
        read -p "Do you still want to proceed and overwrite your existing init.vim?(y/n) "  overwrite
        case $overwrite in
            [Yy]* ) break;;
            [Nn]* ) echo "Exiting setup... "; exit;;
            * ) echo "Please answer y for (yes) or n for (no).";;
        esac
    done
else
    echo "Check complete"
fi
echo

echo "Copying .vimrc to $VIM_CONFIG_FILE..."
cp .vimrc $VIM_CONFIG_FILE
echo "Copied!"
echo

echo "Copying init.vim into $NVIM_CONFIG_FILE..."
cp init.vim $NVIM_CONFIG_FILE
echo "Copied!"
echo

echo "Setup complete!"
