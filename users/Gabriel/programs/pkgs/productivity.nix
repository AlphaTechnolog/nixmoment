{ pkgs, ... }: {
  home.packages = with pkgs; [
    github-cli
    git-lfs
    slack
    obs-studio
    firefox
    clang
    clang-tools
    vlc
    file
    nix-index
  ];
}
