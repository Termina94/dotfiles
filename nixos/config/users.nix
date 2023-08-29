
{ config, pkgs, unstable, ... }:

{
  users.users.dean = {
    isNormalUser = true;
    description = "Dean";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = with pkgs; [
	    gnomeExtensions.gesture-improvements
      firefox
      git
	    cargo
	    trunk
	    rustup
	    cargo-make
	    cargo-leptos
      riff
    ];
  };
}
