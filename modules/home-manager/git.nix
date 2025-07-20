{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    delta.enable = true;
    userEmail = "mail@koye64.com";
    userName = "Koye64";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
