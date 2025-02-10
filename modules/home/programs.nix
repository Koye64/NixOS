{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    vlc
    eclipses.eclipse-sdk
  ];

  services.easyeffects.enable = true;

  programs.zathura = {
    enable = true;
  };
}
