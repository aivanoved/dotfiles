mkdir -p ~/.vim/plugin
mkdir -p ~/.vim/after/plugin

rm -rf ~/.vimrc
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc

fd --hidden --extension vim . ~/.vim/plugin | xargs rm -rf

for f in `fd --hidden --extension vim .`; do
    mkdir -p $(dirname ~/.vim/plugin/$f)
    ln -s ~/dotfiles/vim/$f ~/.vim/plugin/$f
done