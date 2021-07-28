# vim-bufclean

A vim-plugin to delete all buffers except those opened in the window.

This script is based on another simple official plugin script written by [Christian J. Robinson](https://www.vim.org/account/profile.php?user_id=59):

[https://github.com/vim-scripts/BufOnly.vim/blob/master/plugin/BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim/blob/master/plugin/BufOnly.vim)

This official script only keeps the buffer of the current window, and the buffers of other windows will be deleted together, which does not meet my requirements, so this version of BufOnly is provided, I named it `BufClean`, it will keep the current open window Buffer.

This command can work with `BufOnly`. When you want to keep the opened window, execute `BufClean`, and execute `BufOnly` when you don't want to keep the them.

## Install

bufclean can be installed in various ways like other vim plugins.

For examples, use the vim-plug:

```vim-script
Plug 'fioncat/vim-bufclean'
```

## Usage

After installation, you can use `:BufClean` to execute the command. More details please refer to `:help BufClean`.

