# dotfiles bare git repo

Idea from: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/

to be used together with my Windows dotfiles Repo (used in a WSL)

# Initial Setup

```bash
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:papierkorp/dotfiles.git
dotfiles add ~/.bash_aliases
dotfiles push
```

# Usage

!!to be tested!!

```bash
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:papierkorp/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

git clone --separate-git-dir=$HOME/.dotfiles git@github.com:papierkorp/dotfiles.git ~
```
