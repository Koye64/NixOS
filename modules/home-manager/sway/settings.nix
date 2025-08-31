{ lib, pkgs, ... }:
{
  wayland.windowManager.sway.config = {
    terminal = "${lib.getExe pkgs.kitty}";
    focus = {
      mouseWarping = true;
      newWindow = "focus";
      wrapping = "yes";
    };
    menu = "${lib.getExe pkgs.fuzzel}";
    modes = {};
    output = {
      "*" = {
        scale = "1";
        allow_tearing = "yes";
        adaptive_sync = "on";
      };
      HDMI-A-2 = {
        mode = "1920x1080@143.999Hz";
        pos = "0 0";
      };
      HDMI-A-1 = {
        mode = "1440x900@74.984Hz";
        pos = "1920 180";
      };
    };
    window.commands = [
      {
        command = "allow_tearing";
        criteria = {
          class = ".*";
        };
      }
    ];
    workspaceOutputAssign = [
      { workspace = "1";
        output = "HDMI-A-2";
      }
      { workspace = "2";
        output = "HDMI-A-2";
      }
      { workspace = "3";
        output = "HDMI-A-2";
      }
      { workspace = "4";
        output = "HDMI-A-2";
      }
      { workspace = "10";
        output = "HDMI-A-1";
      }
      { workspace = "9";
        output = "HDMI-A-1";
      }
      { workspace = "8";
        output = "HDMI-A-1";
      }
      { workspace = "7";
        output = "HDMI-A-1";
      }
      { workspace = "6";
        output = "HDMI-A-1";
      }
    ];
  };
}
