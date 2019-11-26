# Fish config file
# Author: linuxer

# General settings
set theme_color_scheme gruvbox
set dotfiles ~/dotfiles/.config
set config ~/.config
fish_vi_key_bindings
# thefuck --alias fuck|source
set -U date (date|awk '{print $2,$3}')


# short abbreviations that I replaced cause I'm lazy
# abbr vim "nvim"

# configurations abbreviations
abbr fishconfig "nvim ~/.config/fish/config.fish"
abbr fc "nvim ~/.config/fish/config.fish"
abbr i3config "nvim ~/.config/i3/config"
abbr ic "nvim ~/.config/i3/config"
abbr polybarconfig "nvim ~/.config/polybar/config"
abbr pc "nvim ~/.config/polybar/config"
abbr nvimConfig "nvim ~/.config/nvim/init.vim"
abbr nc "nvim ~/.config/nvim/init.vim"
# abbr vifm "vifmrun"
abbr neomutt "mbsync cedric;neomutt"

# utilities abbreviations
abbr shutdown "shutdown -h now"
abbr background "feh --bg-fill --randomize ~/Downloads/wallpapers/Landscapes"
abbr f "fuck"
