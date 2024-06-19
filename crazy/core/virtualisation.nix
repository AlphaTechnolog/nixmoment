{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = [
    pkgs.qemu
  ];

  security = {
    polkit.enable = true;
  };

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

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 8048;
      cores = 2;
      graphics = false;
    };
  };

  users = {
    groups.virt = {};

    users.virt = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      password = "virt";
      group = "virt";
    };
  };
}
