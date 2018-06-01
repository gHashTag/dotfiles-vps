Установка языка
```dpkg-reconfigure locales```

Добавляем пользователя
```adduser playra```

Наделяем правами суперадминистратора
```adduser playra sudo```

На локальной машине
```ssh-copy-id playra@ЗДЕСЬ ВСТАВЛЯЕМ IP VPS```

Копируем этот поект
```git clone https://github.com/gHashTag/dotfiles-vps.gi```

Линкуем файлы ~/
```
ln -s ./dotfiles/.vimrc .vimrc
ln -s ./dotfiles/.nvimrc .nvimrc
ln -s ./dotfiles/.zshrc .zshrc
ln -s ./dotfiles/.gitignore .gitignore
ln -s ./dotfiles/.gitconfig .gitconfig
ln -s ./dotfiles/.gitignore_global .gitignore_global
ln -s ./dotfiles/.editorconfig .editorconfig
ln -s ./dotfiles/.ctags .ctags
ln -s ./dotfiles/.eslintrc .eslintrc
ln -s ./dotfiles/.flowconfig .flowconfig
ln -s ./dotfiles/libdefs.js libdefs.js
```
Ставим Oh My ZSH!
```sudo apt-get install zsh
curl -L http://install.ohmyz.sh | sh
```

Ставим vim plug https://github.com/junegunn/vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Заходим в .vimrc и вызываем команду PlugInstall

Ставим NeoVim
https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

Создаем файл touch .config/nvim/init.vim
с содержимым для neovim
```javascript
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.nvimrc
```

