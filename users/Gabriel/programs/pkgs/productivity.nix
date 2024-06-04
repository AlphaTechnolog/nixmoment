{ pkgs, ... }: {
  home.packages = with pkgs; [
    github-cli
    git-lfs
    slack
    obs-studio
    chromium
    firefox
    kdenlive
    clang
    clang-tools
    vlc
    file
    nix-index
  ];
}
