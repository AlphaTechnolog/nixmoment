{ flakeConfig, ... }:

{
  time = { inherit (flakeConfig) timeZone; };

  networking = {
    hostName = flakeConfig.hostname;

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
