{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [
      ./hardware-configuration.nix
      ./config/system.nix
      ./config/nginx.nix
      ./config/users.nix
      ./config/shell.nix
    ];

  environment.systemPackages = with pkgs; [
    rnix-lsp
    helix
    nginx
  ];

  system.stateVersion = "23.05";
}
