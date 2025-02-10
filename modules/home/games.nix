{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    dolphin-emu
  ];
}
