This dotfiles repo is based on \
https://www.atlassian.com/git/tutorials/dotfiles

To run this setup in a new env.

ensure alias exists \
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

clone the repo \
`git clone --bare git@github.com:seb-emmot/dotfiles.git $HOME/.cfg`

checkout latest \
(in case of conflicts, backup/del files conflicting) \
`config checkout`

restart your shell