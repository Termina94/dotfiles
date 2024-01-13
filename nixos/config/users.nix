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
      gitui

      # verpay
      sass
      pkg-config
      trunk
      rustup
      clang
      sea-orm-cli
      sqlite

      # # AstroVim Requirements

      # rustup component add rust-analyzer --toolchain nightly-x86_64-unknown-linux-gnu
      rust-analyzer
      neovim
      cargo
      rustc
      rustfmt
      gcc
      ripgrep
      xclip
    ];
  };
}
