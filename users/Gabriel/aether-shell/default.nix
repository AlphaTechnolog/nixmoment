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
      wallpaper = default-configuration.user-likes.wallpaper // {
        rounded_corners = {
          top_left = true;
          top_right = true;
          bottom_left = false;
          bottom_right = false;
          roundness = 12;
        };
      };

      theme = default-configuration.user-likes.theme // {
        scheme = "dark";

        accents = {
          primary = "magenta";
          secondary = "red";
        };

        colors = let
          inherit (default-configuration.utils) convertConfigThemeToAetherTheme;
          colors = aetherShell.colors flakeConfig.colorscheme;
        in convertConfigThemeToAetherTheme colors;
      };
    };
  };
}
