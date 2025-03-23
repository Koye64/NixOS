{pkgs, ...}: {
  home.packages = with pkgs; [
    eclipses.eclipse-sdk
    jetbrains.idea-community
    obsidian
    parsec-bin
    spotify
    telegram-desktop
    vlc
  ];

  services.easyeffects.enable = true;

  programs.zathura = {
    enable = true;
  };
}
