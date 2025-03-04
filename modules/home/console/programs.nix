{pkgs, ...}: {
  home.packages = with pkgs; [sshfs];

  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    lfs.enable = true;
    userEmail = "mail@koye64.com";
    userName = "Koye64";
  };

  programs.lazygit = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "server" = {
        hostname = "5.78.126.172";
      };
      "pwn" = {
        hostname = "pwn.college";
        user = "hacker";
      };
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.btop.enable = true;

  programs.cava = {
    enable = true;
    settings.smoothing.noise_reduction = 14;
    settings.general.framerate = 144;
  };
}
