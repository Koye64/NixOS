{ ... }:

{
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
}
