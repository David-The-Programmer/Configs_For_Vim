# Setup guide for vim configs

### Purpose
This guide is mainly for me to remember how to setup my vim/neovim configurations.

I would need to make my configs to be more structured and robust in the future.

For now, this config only intended for general web development using JS. More changes would be needed to make this work for development with different frameworks/programming languages.

**Note: This configs only work for linux OS**

### Folder Structure
```markdown
├── .eslintrc.json
├── .vimrc
├── README.md
├── coc-settings.json
└── init.vim
```
- The file **.eslintrc.json** contains configurations for eslint plugin (I use this file as a global config file for eslint).

- The file **.vimrc** contains configurations for all the vim plugins used

- The file **coc-settings.json** contains the settings for the Conquer of Completion vim plugin for intellisense

- The file **init.vim** contains the neovim configs needed to easily switch over from using vim to neovim

### Setup Process
Note: Currently now, neovim is the default vim-based editor used

Below are the steps to make the configurations work in vim/neovim

1. Copy and paste both the **.vimrc** and **.eslintrc.json** in the home directory

2. Copy and paste **init.vim** to this directory `~/.config/nvim/init.vim`. You may need to create the nvim directory first.

3. Copy and paste **coc-settings.json** to this directory `~/.config/nvim/coc-settings.json`

4. Everything should be working when using neovim for any general JS development

### How to configure
Configuration of the different files require different documentation online (I can't remember exactly how to config each file :))

Link to configure coc:
https://github.com/neoclide/coc.nvim/wiki

Link to configure eslintrc:
https://eslint.org/docs/user-guide/configuring

### Future plans
- [ ] Give description of setup dependencies requirements, e.g Node.js, Python3, etc
- [ ] Make the instructions more clear and detailed
- [ ] Reorganise the setup files with a clearer and more robust structure
- [ ] Make the setup into an automated process of just installing a package
