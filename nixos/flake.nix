{
  description = "Dean's OS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    uid.url = "github:Termina94/uid";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, uid }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;            
  
            home-manager.users.dean = {pkgs, ...}: {
              home.stateVersion = "23.11";
              home.packages = with pkgs; [
                unstable.vscode-fhs
                unstable.blender
                unstable.chromium
                unstable.godot_4
                unstable.ripgrep
                unstable.cargo-leptos
                unstable.wasm-bindgen-cli
                unstable.zig
                uid.packages.${system}.uid
              ];
            };
          }
        ];
      };
    };
}
