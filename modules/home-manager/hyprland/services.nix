{ lib, pkgs, config, ... }:
{
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
    };
  };
  programs = {
    hyprlock = {
      enable = true;
      settings = {
        background = [
          { path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
          }
        ];
      };
    };
  };
  services = {
    cliphist = { enable = true; };
    hyprpolkitagent.enable = true;
    hypridle = {
      enable = true;
      settings = let
        hyprlock = "uwsm app -- ${lib.getExe config.programs.hyprlock.package}";
      in {
        general = {
          lock_cmd = hyprlock;
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          { timeout = 300;
            on-timeout = hyprlock;
          }
          { timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
