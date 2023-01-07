# Install
Install NeoVim. I used [this guide][neovim].
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
```
Add the following line to .bashrc.
```
alias nvim='~/.nvim.appimage'
```

Install Plug. I used [this guide][plug].
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install Node Version Manager (nvm). I used [this guide][nvm].
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

You might have to close and reopen the terminal. Make sure you close the *entire* terminal, not just
the one inside NeoVim.

Use nvm to install Node.js.
```bash
nvm install --lts
```

To check on optional Telescope dependencies, use
```bash
:checkhealth telescope
```
You should have to install RipGrep.
```bash
sudo apt-get install ripgrep
```

Run the NeoVim checkhealth, and optionally fix any problems you find.
```bash
:checkhealth
```

I install the npm neovim package.
```bash
npm install -g neovim
```

Install language servers for CoC using [this guide][CoC-lsp].

Install the correct font-patch for your terminals font using [NerdFonts][nerdfonts].

Install [Watchmen][watchmen] so that file renaming will update paths.

[neovim]: https://github.com/neovim/neovim/wiki/Installing-Neovim
[plug]: https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/
[nvm]: https://github.com/nvm-sh/nvm/blob/master/README.md
[CoC-lsp]: https://github.com/neoclide/coc.nvim/wiki/Language-servers
[nerdfonts]: https://www.nerdfonts.com/font-downloads
[watchmen]: https://facebook.github.io/watchman/
