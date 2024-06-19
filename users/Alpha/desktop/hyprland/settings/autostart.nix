{
  pkgs,
  lib,
  flakeConfig,
  ...
}: let
  utils = import ./utils.nix {inherit pkgs lib;};
in {
  wayland.windowManager.hyprland.settings = with utils; {
    exec-once = let
      wallpaperPath = flakeConfig.metacolorscheme.wallpaper;

      mako = lib.getExe pkgs.mako;

      wallpaper = silentScript "wallpaper" ''
        ${lib.getExe pkgs.swaybg} -i ${wallpaperPath}
      '';
    in [
      "ags"
      mako
      wallpaper
    ];
  };
}
