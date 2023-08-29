{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  imports =
    [
      ./hardware-configuration.nix
      ./config/system.nix
      ./config/nginx.nix
      ./config/users.nix
    ];
  
  environment.systemPackages = with pkgs; [
    helix
    rnix-lsp
    gcc
    nginx
  ];  

  system.stateVersion = "23.05";
}
