{pkgs, ...}: {
  imports = [../../modules/home-manager];

  # User-defined modules
  niri.enable = true;

  color-scheme.enable = true;

  font.enable = true;
  home = {
    username = "koye";
    homeDirectory = "/home/koye";

    stateVersion = "25.11";
  };

  shell.enable = true;

  home.file.".face".source = ../../assets/koye_buwayani_256.png;

  home.packages = with pkgs; [
    alcom
    appimage-run
    blender-hip
    blockbench
    krita
    luanti
    prismlauncher
    rustup
    texliveFull
  ];

  programs = {
    discord.enable = true;
    distrobox.enable = true;
    home-manager.enable = true;
    mpv.enable = true;
    obs-studio.enable = true;
  };

  services.podman.enable = true;
  services.syncthing.enable = true;
}
