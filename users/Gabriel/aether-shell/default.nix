{
  flakeConfig,
  lib,
  pkgs,
  ...
}: let
  aetherShellCfg = flakeConfig.modules.homeManager.aetherShell;

  convertConfigThemeToAetherTheme = theme: (with theme; {
    inherit (primary)
      background
      foreground
    ;

    hovered_black = bright.black;

    inherit (normal)
      black
      red
      green
      yellow
      blue
      cyan
      magenta
      white
    ;
  });
in {
  imports = [
    ./gtk.nix
  ];

  programs.aetherShell = {
    enable = true;

    user-likes = {
      wallpaper.filename = flakeConfig.metacolorscheme.wallpaper;

      theme = let
        colors = flakeConfig.colorscheme;
        computedColors = aetherShellCfg.colors colors;
      in {
        colors = convertConfigThemeToAetherTheme computedColors;

        inherit (computedColors)
          scheme
          accents
        ;
      };
    };
  };
}
