{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    vlc
    eclipses.eclipse-sdk
    parsec-bin
  ];

  services.easyeffects.enable = true;

  programs.zathura = {
    enable = true;
  };
}
