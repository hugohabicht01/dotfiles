#!/usr/bin/fish
#
#TODO: change this if and else to set destination and change format of file
#
#
set configs ~
set dotfiles ~/dotfiles

# for filename in $files
# 	echo Copying $files \n
# 	# echo $configs/$files \n
# 	# echo $dotfiles/$files \n
# end

while read filename
	cp -f $configs/$filename $dotfiles/$filename
	echo $configs/$filename
	echo $dotfiles/$filename
end < configFiles
