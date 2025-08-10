{ ... }:
{
  networking.firewall = {
    allowedTCPPorts = [ 80 ];
  };
  services = {
    static-web-server = {
      enable = true;
      listen = "[::]:80";
      root = "/srv/www/koye64.com/public";
    };
  };
}
