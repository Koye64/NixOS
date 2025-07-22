{ ... }:
{
  programs = {
    firefox = {
      enable = true;
    };
  };
  services = {
    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
    mako = { enable = true; };
  };
}
