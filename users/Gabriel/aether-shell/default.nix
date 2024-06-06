{
  flakeConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (flakeConfig.modules.homeManager) aetherShell;

  # im using here default-configuration in order to be able to override
  # only certain parts of the configurations definitions rather than the
  # whole configuration object.
  default-configuration = import ./default-configuration.nix {
    inherit flakeConfig lib pkgs;
  };
in {
  imports = [
    ./gtk.nix
    ./module.nix
  ];

  # defines the configuration for the aether shell module
  programs.aether-shell = {
    inherit (aetherShell) enable;

    user-likes = default-configuration.user-likes // {
      theme = default-configuration.user-likes.theme // {
        inherit (flakeConfig.colorscheme)
          scheme
          accents
          ;

        colors = let
          inherit (default-configuration.utils) convertConfigThemeToAetherTheme;
          colors = aetherShell.colors flakeConfig.colorscheme;
        in convertConfigThemeToAetherTheme colors;
      };
    };
  };
}
