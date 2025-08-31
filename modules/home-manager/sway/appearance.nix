{ config, ... }:
{
  wayland.windowManager.sway.config = {
    bars = [];
    colors = {
      background = "$crust";
      focused = {
        background = "$base";
        border = "$blue";
        childBorder = "$blue";
        indicator = "$green";
        text = "$text";
      };
      focusedInactive = {
        background = "$crust";
        border = "$surface1";
        childBorder = "$surface1";
        indicator = "$surface2";
        text = "$text";
      };
      placeholder = config.wayland.windowManager.sway.config.colors.unfocused;
      unfocused = {
        background = "$crust";
        border = "$surface0";
        childBorder = "$surface0";
        indicator = "$surface1";
        text = "$text";
      };
      urgent = {
        background = "$crust";
        border = "$red";
        childBorder = "$red";
        indicator = "$red";
        text = "$red";
      };
    };
    floating = {
      border = 2;
      titlebar = false;
    };
    fonts = {
      names = [ "JetBrainsMono Nerd Font" ];
      style = "Regular";
      size = 10.0;
    };
    gaps = {
      inner = 8;
      smartBorders = "no_gaps";
      smartGaps = true;
    };
    window = {
      border = 2;
      titlebar = false;
    };
    output = {
      "*" = {
        bg = builtins.toString ../../../assets/nix-wallpaper.png + " fill $crust";
      };
    };
  };
}
