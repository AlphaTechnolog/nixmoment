{pkgs, ...}: {
  nix = {
    package = pkgs.nixVersions.git;

    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
