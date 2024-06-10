{
  wallpaper = ./wallpapers/gruvbox-material.png;

  neovim = pkgs: {
    extraPlugins = with pkgs; [vimPlugins.gruvbox-material];
    colorscheme = "gruvbox-material";

    globals = {
      gruvbox_material_better_performance = 0;
      gruvbox_material_foreground = "material";
      gruvbox_material_background = "hard";
    };
  };

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "magenta";
    };

    primary = {
      background = "#1d2021";
      foreground = "#d4be98";
    };

    normal = {
      black = "#32302f";
      red = "#ea6962";
      green = "#a9b665";
      yellow = "#d8a657";
      blue = "#7daea3";
      magenta = "#d3869b";
      cyan = "#89b482";
      white = "#d4be98";
    };

    bright = normal // {
      black = "#32302f";
      white = "#d4be98";
    };
  };
}

