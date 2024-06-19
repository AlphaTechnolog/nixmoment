{
  flakeConfig,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master.no_gaps_when_only = 1;

    dwindle = {
      no_gaps_when_only = 1;
    };

    general = let
      gaps = 4;
      removeHash = colour: lib.replaceStrings ["#"] [""] colour;
    in {
      gaps_in = gaps;
      gaps_out = gaps * 2;
      border_size = 1;
      allow_tearing = true;
      resize_on_border = false;

      "col.active_border" = "rgb(${removeHash flakeConfig.colorscheme.bright.black})";
      "col.inactive_border" = "rgb(${removeHash flakeConfig.colorscheme.normal.black})";
    };

    decoration = {
      rounding = 7;
      drop_shadow = false;

      blur = {
        enabled = false;
        brightness = 1.0;
        contrast = 1.0;
        new_optimizations = true;
        noise = 0.02;
        passes = 4;
        size = 10;
        xray = true;
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "md3_decel, 0.05, 0.7, 0.1, 1"
      ];

      animation = [
        "border, 1, 2, default"
        "fade, 1, 2, md3_decel"
        "windows, 1, 4, md3_decel, popin 60%"
        "workspaces, 1, 4, md3_decel, slidevert"
      ];
    };

    input = {
      kb_layout = "us";

      accel_profile = "flat";
      follow_mouse = 1;

      # increasing repeat keys rate
      repeat_rate = 45;
      repeat_delay = 250;

      # laptop only
      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        scroll_factor = 0.5;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    misc = {
      animate_mouse_windowdragging = true;
      disable_autoreload = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      focus_on_activate = true;
      force_default_wallpaper = 1;
      key_press_enables_dpms = true;
      mouse_move_enables_dpms = true;
      vfr = true;
      vrr = 1;
    };

    # my own monitor fix...
    monitor = [
      "HDMI-A-1,1360x768,0x0,1"
    ];

    xwayland = {
      force_zero_scaling = true;
    };
  };
}
