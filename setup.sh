#! /bin/sh

echo "Running setup..."
echo

VIM_CONFIG_BACKUP_DIR="$HOME/vim_configs_backup/"
echo "Checking if $VIM_CONFIG_BACKUP_DIR directory exists..."
if [ -d "$VIM_CONFIG_BACKUP_DIR" ]; then
    echo "Directory found!"
else
    echo "$VIM_CONFIG_BACKUP_DIR directory not found, creating directory..."
    mkdir $VIM_CONFIG_BACKUP_DIR
    echo "Directory created!"
fi
echo

# do a check to see if a .vimrc already exists before overwriting the existing .vimrc
VIM_CONFIG_FILE="$HOME/.vimrc"
echo "Checking if $VIM_CONFIG_FILE file exist..."
if [ -f "$VIM_CONFIG_FILE" ]; then
    echo ".vimrc file found!"
    echo "Backing up existing .vimrc to $VIM_CONFIG_BACKUP_DIR..."
    cp $VIM_CONFIG_FILE "${VIM_CONFIG_BACKUP_DIR}.vimrc"
    echo "Backup complete!"
else
    echo "Check complete!"
fi
echo

# do a check to see if the nvim directory already exists
# if does not exist, then create the directory
NVIM_CONFIG_DIR="$HOME/.config/nvim/"
echo "Checking if $NVIM_CONFIG_DIR directory exists..."
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
echo "Checking if $NVIM_CONFIG_FILE file exists..."
if [ -f "$NVIM_CONFIG_FILE" ]; then
    echo "init.vim file found!"
    echo "Backing up existing init.vim to $VIM_CONFIG_BACKUP_DIR..."
    cp $NVIM_CONFIG_FILE "${VIM_CONFIG_BACKUP_DIR}init.vim"
    echo "Backup complete!"
else
    echo "Check complete!"
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
echo
echo "All existing .vimrc and/or init.vim files have been backed up to $VIM_CONFIG_BACKUP_DIR."
