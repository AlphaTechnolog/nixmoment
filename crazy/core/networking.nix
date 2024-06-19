{ flakeConfig, ... }:

{
  time = { inherit (flakeConfig) timeZone; };

  networking = {
    hostName = flakeConfig.hostname;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        4444
        8000
        3000 
      ];
    };

    wireless.iwd = {
      enable = true;

      settings = {
        IPv6.Enabled = true;
        Settings.AutoConnect = true;
      };
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
