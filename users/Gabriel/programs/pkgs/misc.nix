{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    pavucontrol
    pfetch
    cutefetch
    nexusfetch
    xclip
    playerctl
    psmisc
    htop
    maim
    webx
  ];
}
