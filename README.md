Using this technique:

https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

which came from here:

https://news.ycombinator.com/item?id=11071754


## Setup
```
git clone --bare https://github.com/gillens/dotfiles.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```
restart terminal, or `source ~/.bashrc`
