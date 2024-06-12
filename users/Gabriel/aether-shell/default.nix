{
  flakeConfig,
  lib,
  ...
}: let
  aetherShellCfg = flakeConfig.modules.homeManager.aetherShell;

  convertConfigThemeToAetherTheme = theme: (with theme; {
    inherit
      (primary)
      background
      foreground
      ;

    hovered_black = bright.black;

    inherit
      (normal)
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
  programs.aetherShell = {
    enable = true;

    user-likes = {
      wallpaper = {
        filename = flakeConfig.metacolorscheme.wallpaper;

        # disable top rounded corners if in light mode
        rounded_corners = lib.mkIf (flakeConfig.colorscheme.scheme == "light") {
          top_left = false;
          top_right = false;
        };
      };

      theme = let
        colors = flakeConfig.colorscheme;
        computedColors = aetherShellCfg.colors colors;
      in {
        colors = convertConfigThemeToAetherTheme computedColors;

        inherit
          (computedColors)
          scheme
          accents
          ;
      };
    };
  };
}
