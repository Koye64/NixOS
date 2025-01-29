{ ... }:

{
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userEmail = "mail@koye64.com";
    userName = "Koye64";
  };

  programs.lazygit = {
    enable = true;
  };
}
