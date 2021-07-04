# Setup guide for vim configs

### Purpose

This guide is to setup my personal vim/neovim configurations.

I would need to make my configs to be more structured and robust in the future.

[UPDATE] This vim/neovim configurations are to make sure vim/neovim is more pleasant to use as a text editor (in terms of certain key bindings and aesthestics).
The goal is not to have a full blown IDE/text editor with all the bells and whistles in vim. I would recommend installing VSCode if you want that.

**Note: These configs only work if you use linux OS with Vim 8.2+ and Neovim v0.4.4+**

### Folder Structure

```markdown
├── .vimrc
├── README.md
└── init.vim
```

- The file **.vimrc** contains configurations for all the vim settings & plugins used

- The file **init.vim** contains the neovim configs needed to easily switch over from using vim to neovim

### Setup Process

Note: Currently now, neovim is the default vim-based editor used

Below are the steps to make the configurations work in vim/neovim

1. Copy and paste **.vimrc** in the home directory.

2. Copy and paste **init.vim** to this directory `~/.config/nvim/init.vim`. You may need to create the nvim directory first.

3. Everything should be working when using neovim for any text editing purposes.

### Future plans

- [ ] Make the instructions more clear and detailed
- [ ] Reorganise the setup files with a clearer and more robust structure
- [ ] Make the setup into an automated process of just running a script
