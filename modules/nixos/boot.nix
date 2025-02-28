{...}: {
  boot.loader.grub.default = "saved";
  boot.plymouth = {
    enable = true;
  };
}
