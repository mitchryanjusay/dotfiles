if [[ "$OSTYPE" == "linux-gnu" ]]; then
    isLinux=true
else
    isLinux=false
fi;

echo "Installing Fish..."

if $isLinux; then
    sudo pacman -S fish
else
    brew install fish
fi;

echo "Installed Fish successfully..."

echo "Installing oh-my-fish..."

curl -sL https://get.oh-my.fish

echo "Installed oh-my-fish successfully..."

echo "Linking dotfiles..."

if [ ! -d $HOME/.config/fish ]; then
    mkdir -p $HOME/.config/fish
fi;

if $isLinux; then
    ln -s omf/config.fish $HOME/.config/fish/config.fish
    ln -s omf/init.fish $HOME/.config/omf/init.fish
    ln -s omf/before.init.fish $HOME/.config/omf/before.init.fish
    ln -s omf/bundle $HOME/.config/omf/bundle
    ln -s omf/theme $HOME/.config/omf/theme
    ln -s omf/channel $HOME/.config/omf/channel
    ln -s omf/key_bindings.fish $HOME/.config/omf/key_bindings.fish
else
    cp omf/config.fish $HOME/.config/fish/config.fish
    cp omf/init.fish $HOME/.config/omf/init.fish
    cp omf/before.init.fish $HOME/.config/omf/before.init.fish
    cp omf/bundle $HOME/.config/omf/bundle
    cp omf/theme $HOME/.config/omf/theme
    cp omf/channel $HOME/.config/omf/channel
    cp omf/key_bindings.fish $HOME/.config/omf/key_bindings.fish
else
fi;

echo "Setting Fish as default shell..."

chsh -s /usr/bin/fish

echo "Successfully set Fish as the default shell..."

echo "Fish installation and setup done."
