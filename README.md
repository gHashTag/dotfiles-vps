Установка языка
```dpkg-reconfigure locales```

Добавляем пользователя
```adduser playra```

Наделяем правами суперадминистратора
```adduser playra sudo```

На локальной машине
```ssh-copy-id playra@ЗДЕСЬ ВСТАВЛЯЕМ IP VPS```

Копируем этот поект
```git clone https://github.com/gHashTag/dotfiles-vps.git dotfiles```

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
```
sudo apt-get install zsh
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

Ставим Docker
https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

Ставим Docker-compose
https://docs.docker.com/compose/install/#install-compose

Устанавливаем node-js
После того, как все обновится, устанавливаем node-js (с чем и npm установится).
```
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Yarn - совместный фейсбука с гуглом менеджер пакетов типа npm. Он здесь тоже понадобится.
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```
Устанавливаем призму глобально.
```sudo npm install -g prisma```
