{ pkgs, ... }:

with pkgs; {
  environment.systemPackages = [
    wget
    git
  ];
}
