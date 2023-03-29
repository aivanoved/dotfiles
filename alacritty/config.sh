rm -rf ~/.alacritty.sh

rm -rf ~/.config/alacritty/themes
rm -rf ~/.config/alacritty/sonokai.yml

ln -s ~/dotfiles/alacritty/.alacritty.yml ~/.alacritty.yml

ln -s ~/dotfiles/alacritty/sonokai.yml ~/.config/alacritty/sonokai.yml

git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
