{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    systemd.variables = ["--all"];
  };

  imports = [
    ./settings/env.nix
    ./settings/autostart.nix
    ./settings/base.nix
    ./settings/bindings.nix
  ];

  home.packages = with pkgs; [
    slurp
    grim
  ];
}
