{...}: {
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

  programs = {
    discord.enable = true;

    home-manager.enable = true;

    alacritty = {
      enable = true;
    };
  };
}
