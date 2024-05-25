{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    git
    dotnet-sdk
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk22;
  };

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
  };
}
