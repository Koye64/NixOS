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
  systemd.user.services = {
    hypripc = {
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${lib.getExe (pkgs.writeShellScriptBin "hypripc.sh" /*bash*/ ''
          set_primary_monitor() {
            ${lib.getExe pkgs.xorg.xrandr} --output HDMI-A-2 --primary
            echo "xrandr: $?; set primary monitor";
          }

          handle() {
            case $1 in
              monitoradded*) set_primary_monitor ;;
            esac
          }

          set_primary_monitor

          ${lib.getExe pkgs.socat} -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
        '')}";
      };
      Unit = {
        After = [ "graphical-session.target" ];
        Description = "My script handling Hyprland IPC";
        PartOf = [ "graphical-session.target" ];
      };
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
