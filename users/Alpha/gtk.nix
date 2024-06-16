{ pkgs, flakeConfig, ... }: {
  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/macOS-BigSur";

  gtk = let
    inherit (flakeConfig) colorscheme;

    for_scheme = light: dark: (
      if colorscheme.scheme == "light" then
        light
      else
        dark
    );
  in {
    enable = true;

    theme = {
      name = for_scheme "Materia" "Materia-Dark";
      package = pkgs.materia-theme;
    };

    iconTheme = {
      name = for_scheme "Papirus" "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS-BigSur";
      size = 12;
    };
  };
}
