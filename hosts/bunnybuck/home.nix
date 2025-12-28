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
    blender-hip
    krita
    luanti
    prismlauncher
    rustup
  ];

  programs = {
    discord.enable = true;
    distrobox = {
      enable = true;
      containers = {
        arch.image = "archlinux:latest";
      };
    };
    home-manager.enable = true;
    mpv.enable = true;
    obs-studio.enable = true;
  };

  services.syncthing.enable = true;
}
