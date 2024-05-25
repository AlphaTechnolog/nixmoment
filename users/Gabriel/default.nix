{
  flakeConfig,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home = with flakeConfig.user; {
    username = name;
    homeDirectory = "/home/${name}";
    stateVersion = "23.11";
  };

  # let home manager manage itself
  programs = {
    home-manager.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  imports = let
    inputsModules = with inputs; [
      nixvim.homeManagerModules.nixvim
    ];

    modules = [
      ./programs
      ./shell.nix
      ./gtk.nix
    ];
  in
    (
      if !flakeConfig.modules.homeManager.aetherShell.enable
      then []
      else [./aether-shell.nix]
    )
    ++ inputsModules
    ++ modules;
}
