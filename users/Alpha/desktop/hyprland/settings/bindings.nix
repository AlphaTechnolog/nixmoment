{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = let
      utils = import ./utils.nix {
        inherit pkgs lib;
      };

      numWorkspaces = 10;

      workspaces = builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / numWorkspaces;
            in
              builtins.toString (x + 1 - (c * numWorkspaces));
          in [
            "SUPER, ${ws}, workspace, ${toString (x + 1)}"
            "SUPERSHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        numWorkspaces);

      reloadAgs = utils.silentScript "reload-ags" ''
        pgrep -x .ags-wrapped > /dev/null 2>&1 && kill -9 $(pgrep -x .ags-wrapped)
        ags & disown
      '';
    in
      workspaces
      ++ [
        "SUPERSHIFT, Q, exit"
        "SUPER, W, killactive"
        "SUPER, S, togglesplit"
        "SUPER, F, fullscreen"
        "SUPER, P, pseudo"
        "SUPERSHIFT, P, pin"
        "SUPER, Space, togglefloating"

        # utils scripts
        "SUPER SHIFT, R, exec, ${reloadAgs}"

        # move focus
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Move windows
        "SUPERSHIFT, left, movewindow, l"
        "SUPERSHIFT, right, movewindow, r"
        "SUPERSHIFT, up, movewindow, u"
        "SUPERSHIFT, down, movewindow, d"

        # Utilities
        "SUPER, Return, exec, ${pkgs.alacritty}/bin/alacritty"
        "SUPERSHIFT, Return, exec, ${pkgs.wofi}/bin/wofi --show drun"
      ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
