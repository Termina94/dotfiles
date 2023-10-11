{ config, pkgs, unstable, ... }:

{
  users.users.dean = {
    isNormalUser = true;
    description = "Dean";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = with pkgs; [
      # gnomeExtensions.gesture-improvements
      pkgs.vscode-extensions.rust-lang.rust-analyzer
      godot_4
      firefox
      wezterm
      git

      # # AstroVim Requirements
      neovim
      cargo
      rust-analyzer
      rustc
      rustfmt
      gcc
      ripgrep
      xclip
    ];
  };
}
