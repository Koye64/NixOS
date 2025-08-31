{ config, lib, pkgs, ... }:
{
  home.shellAliases = {
    ssh = "${lib.getExe' config.programs.kitty.package "kitten"} ssh";
  };
  programs = {
    firefox = {
      enable = true;
    };
    fuzzel = {
      enable = true;
      settings = {
        main = {
          use-bold = true;
          dpi-aware = "no";
          launch-prefix = "uwsm app --";
          placeholder = "Launch...";
          prompt = ''"❯ "'';
          terminal = "${lib.getExe config.programs.kitty.package}";
        };
        border.width = 2;
        border.radius = 0;
      };
    };
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
    kitty = {
      enable = true;
      enableGitIntegration = true;
      settings = {
        cursor_shape = "block";
        cursor_shape_unfocused = "hollow";
        cursor_blink_interval = 0;
        cursor_trail = 16;
        scrollback_lines = 5000;
        repaint_delay = 5;
        sync_to_monitor = "no";
      };
    };
    ncmpcpp = {
      enable = true;
    };
    neovide = {
      enable = true;
      settings = {
        fork = false;
        font = {
          normal = "JetBrainsMono Nerd Font";
          size = 11;
        };
      };
    };
    zathura = { enable = true; };
  };
  services = {
    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
    easyeffects = {
      enable = true;
    };
    gnome-keyring = { enable = true; };
    mako = {
      enable = true;
      settings = let
        explode = "exec ${lib.getExe pkgs.mpv} " + builtins.toString ../../assets/collide.wav;
      in {
        border-radius = 0;
        border-size = 2;
        default-timeout = 5000;
        group-by = "app-name";
        ignore-timeout = 1;
        "urgency=normal" = {
          on-notify = explode;
        };
        "urgency=high" = {
          default-timeout = 0;
          on-notify = explode;
        };
      };
    };
    mpd-discord-rpc = {
      enable = true;
    };
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "Pipewire Output"
        }
      '';
    };
  };
  xdg = {
    enable = true;
    userDirs = { enable = true; };
  };
}
