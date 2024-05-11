{pkgs, ...}: {
  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/macOS-BigSur";

  gtk = {
    enable = true;

    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS-BigSur";
      size = 12;
    };
  };
}
