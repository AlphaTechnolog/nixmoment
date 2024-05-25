{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    dotnet-sdk
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
  };
}
