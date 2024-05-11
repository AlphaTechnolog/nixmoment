{ pkgs, ... }:

with pkgs; {
  environment.systemPackages = [
    vim
    wget
    git
  ];
}
