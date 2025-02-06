{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    vlc
    eclipses.eclipse-sdk
  ];
}
