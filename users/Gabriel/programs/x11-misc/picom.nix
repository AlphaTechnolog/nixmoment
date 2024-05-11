{pkgs, ...}: {
  services.picom = {
    enable = true;
    package = pkgs.picom-git; # comes from nixpkgs-f2k.
    settings = {
      corner-radius = 10;
      fading = true;
      fade-in-step = 0.095;
      fade-out-step = 0.085;

      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };
  };
}
