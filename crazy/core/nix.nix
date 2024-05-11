{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
