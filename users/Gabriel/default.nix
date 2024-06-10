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
      aether-shell.homeManagerModules.aetherShell
    ];

    modules = [
      ./programs
      ./shell.nix
    ];

    inherit (flakeConfig.modules.homeManager)
      gtk
      aetherShell
    ;

    aetherShellModule = (
      if !aetherShell.enable
      then []
      else [./aether-shell]
    );

    gtkModule = (
      if !gtk.enable
      then []
      else [./gtk.nix]
    );
  in []
    ++ aetherShellModule
    ++ gtkModule
    ++ inputsModules
    ++ modules;
}
