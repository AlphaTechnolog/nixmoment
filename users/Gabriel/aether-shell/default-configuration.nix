{ flakeConfig, pkgs, lib, ... }: with lib; let
  utils = {
    convertConfigThemeToAetherTheme = theme: (with theme; {
      inherit (primary) background foreground;

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
  };
in {
  inherit utils;

  autostart = [
    "bash -c 'pgrep -x pulseaudio || pulseaudio -b'"
    "bash -c 'pgrep -x picom || picom -b'"
  ];

  general-behavior = {
    sloppy_focus = true;
    tag_icons = [ "" "" "" "" "" "" ];
    num_tags = 6;
  };

  user-likes = {
    modkey = "Mod4";
    navigator = getExe pkgs.firefox;
    terminal = getExe pkgs.alacritty;
    launcher = "${getExe pkgs.rofi} -show drun";
    explorer = getExe pkgs.xfce.thunar;

    wallpaper = {
      filename = ./default-wallpaper.png;

      rounded_corners = {
        top_left = true;
        top_right = true;
        bottom_left = true;
        bottom_right = true;
        roundness = 12;
      };
    };

    theme = {
      scheme = "dark";

      colors = with utils; let
        inherit (flakeConfig) colorscheme;
      in convertConfigThemeToAetherTheme colorscheme;

      accents = {
        primary = "blue";
        secondary = "cyan";
      };
    };
  };
}
