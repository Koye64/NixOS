{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
  ];

  programs.sway = {
    enable = true;
    extraPackages = [ ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      # QT (needs qt5.qtwayland in systemPackages):
      export QT_QPA_PLATFORM=wayland-egl
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
  };

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
