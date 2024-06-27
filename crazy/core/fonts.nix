{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      antialias = true;

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["Hack Nerd Font" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Inter" "Noto Color Emoji"];
      };

      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };

      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
    };

    fontDir = {
      enable = true;
      decompressFonts = true;
    };

    packages = with pkgs; [
      inter
      maple-mono-NF
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
    ];
  };
}
