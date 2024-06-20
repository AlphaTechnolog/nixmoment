{
  flakeConfig,
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
      hyprland.homeManagerModules.default
      ags.homeManagerModules.default
    ];

    modules = [
      ./programs
      ./desktop
      ./shell.nix
    ];

    inherit
      (flakeConfig.modules.homeManager)
      gtk
      aetherShell
      ;

    aetherShellModule = (
      if !aetherShell.enable
      then []
      else [./desktop/aether-shell]
    );

    gtkModule = (
      if !gtk.enable
      then []
      else [./gtk.nix]
    );
  in
    []
    ++ aetherShellModule
    ++ gtkModule
    ++ inputsModules
    ++ modules;
}
