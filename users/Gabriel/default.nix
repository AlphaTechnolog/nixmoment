{
  flakeConfig,
  lib,
  pkgs,
  ...
}: {
  home = with flakeConfig.user; {
    username = name;
    homeDirectory = "/home/${name}";
    packages = [pkgs.firefox];
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
    modules = [
      ./programs
      ./shell.nix
      ./gtk.nix
    ];
  in
    (
      if !flakeConfig.modules.homeManager.enableAetherShell
      then []
      else [./aether-shell.nix]
    )
    ++ modules;
}
