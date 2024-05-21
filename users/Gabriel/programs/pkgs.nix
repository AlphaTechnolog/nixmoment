{pkgs, ...}: {
  home.packages = with pkgs; [
    github-cli
    slack
    rofi
    pavucontrol
    pfetch
    cutefetch
    obs-studio
    playerctl
    psmisc
    htop
    chromium
    maim
    clang
    clang-tools
    file
  ];
}
