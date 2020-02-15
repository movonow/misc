https://github.com/amix/vimrc

https://github.com/powerline/powerline

https://github.com/wting/autojump

```bash
git clone git://github.com/wting/autojump.git ~/github.com/autojump
cd  ~/github.com/autojump && ./install.py

pip3 install --user powerline-status

cat >> ~/.bashrc << EOF
export PATH=~/Bin:$PATH:~/.local/bin
~/.local/bin/powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/.local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
. ~/.autojump/etc/profile.d/autojump.sh
EOF
```
