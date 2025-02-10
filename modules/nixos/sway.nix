{...}: {
  services.udisks2 = {
    enable = true;
  };

  programs.sway = {
    enable = true;
    extraPackages = [];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    wrapperFeatures = {
      gtk = true;
      base = true;
    };
  };

  services.power-profiles-daemon.enable = true;

  programs.waybar = {
    enable = true;
  };

  services.greetd = {
    enable = true;
  };

  programs.regreet = {
    enable = true;
  };
}
