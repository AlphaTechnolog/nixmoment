{
  flakeConfig,
  pkgs,
  ...
}: {
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 1;
      };
    };
  };

  environment.systemPackages = [pkgs.qemu];
  security.polkit.enable = true;
  programs.virt-manager.enable = true;

  users.extraGroups = {
    docker.members = [
      flakeConfig.user.name
    ];
  };

  virtualisation = {
    libvirtd.enable = true;

    vmVariant.virtualisation = {
      memorySize = 8048;
      cores = 2;
      graphics = false;
    };

    docker = {
      enable = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
