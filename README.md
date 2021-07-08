# my-vim-config

Vim configuration with all recommended plugins and gruvbox theme

### Configuring and compiling vim to support python and other language


Copy the .vimrc file, vim and .vim directories to your root directory and run the following:
1.```cd vim-files
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --enable-python3interp \
                --with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
                --enable-perlinterp \
                --enable-luainterp \
                --enable-gui=auto \
                --enable-gtk2-check \
                --enable-gnome-check \
                --enable-cscope \
                --enable-multibyte \
                --with-x \
                --prefix=/usr
```
_Note that the python3-config-dir given there is your python3 version directory. You can check it out by running ```ls /usr/lib/python3.9```_

After compilation is done, move to this step

2. ```make VIMRUNTIMEDIR=/usr/share/vim/vim82```

3. ```sudo make install``` 

4. ```cd ..```

5. ```vim .vimrc```

6. Vim launches and tries to install the necessary plugins. If you do not see the installation, use **:PlugInstall** to get it started.



You may have to run _apt-get install python-vim_


### Bonus content


1. Go to download [Oh-My-Zsh](https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95) and follow the steps to set it up

2. Run in your terminal ```pip install powerline-shell``` or ```pip3 install powerline-shelll``` if you have pip install doesn't work for you

3. Copy the content of the bonus folder to your root directory to replace your vim and bash configurations

4. Run ```source .bashrc``` and then run ```source .zshrc``` 

5. If your fonts do not work well, copy the _.local_ folder to your root directory and source again.


## CONGRATULATIONS! Your vim is now setup as a full-fledged ide
