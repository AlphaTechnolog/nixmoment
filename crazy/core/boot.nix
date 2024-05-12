{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod;

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
      };
    };
  };
}
