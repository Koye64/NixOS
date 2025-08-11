{ ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = false;
    extraFlags = [ "--no-default-folder" ];
  };
}
