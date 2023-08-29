{ config, pkgs, ... }:

{
	environment.interactiveShellInit = ''
	  alias gc='git checkout'
	  alias gC='git commit -m '
	  alias gp='git pull'
	  alias gP='git push'
		alias gs='git status'
		alias nc='cd ~/.config/nixos; hx .'
		alias nr='cd ~/.config/nixos; ./rebuild.sh'
	'';
}
