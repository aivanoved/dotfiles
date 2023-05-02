STARSHIP_COFIG_FILE=$HOME/.config/starship.toml

rm -rf $STARSHIP_COFIG_FILE

ln -s $HOME/dotfiles/starship/starship.toml $STARSHIP_COFIG_FILE
