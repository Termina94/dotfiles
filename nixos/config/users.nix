
{ config, pkgs, unstable, ... }:

let
  # DotFiles = {
  #   enable = true;
  #   recursive = true;
  #   source = (pkgs.fetchFromGitHub {
  #     owner = "Termina94";
  #     repo = "dotfiles";
  #     rev = "b76b86ba1167693f53642ab7bcbc0c9d59c15170";
  #     sha256 = "sha256-VwKXVPv/iAu6f3OWW7aY4xiH7p6ayNzYbfYSKQqQKzw=";
  #   });
  # };

in {
  users.users.dean = {
    isNormalUser = true;
    description = "Dean";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = with pkgs; [
	    gnomeExtensions.gesture-improvements
      firefox
      git
	    cargo
	    cargo-make
	    cargo-leptos
	    trunk
	    rustup
    ];
  };
  
  # home-manager.users.dean = { pkgs, ...}: {
  #   home.stateVersion = "23.05";
  #   home.file.".config/" = DotFiles;
  # };
 
  # home-manager.users.root = { pkgs, ...}: {
  #   home.stateVersion = "23.05";
  #   home.file.".config/" = DotFiles;
  # };
}
