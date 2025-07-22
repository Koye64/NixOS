{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      gamescopeSession = { enable = true; };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      extest.enable = true;
    };
  };
  services = {
    greetd = {
      enable = true;
    };
  };
}
