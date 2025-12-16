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

  programs = {
    home-manager.enable = true;

    alacritty = {
      enable = true;
    };

    bash = {
      enable = true;
    };

    git = {
      enable = true;
    };

    zsh = {
      enable = true;
    };
  };
}
