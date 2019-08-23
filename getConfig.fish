set configs ~/.config
set dotfiles ~/dotfiles/.config

set dirs (ls $dotfiles)
for dir in $dirs
	echo Copying $dir
	cp -rf $configs/$dir $dotfiles
	echo $configs/$dir
	echo $dotfiles/$dir
end

