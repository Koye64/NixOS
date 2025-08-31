{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    wtype
  ];
  wayland.windowManager.hyprland.settings = let
    mod = "SUPER";
  in {
    bind = let
      uwsm = "uwsm app --";
      fuzzel = "${lib.getExe config.programs.fuzzel.package}";
      kitty = "${lib.getExe config.programs.kitty.package}";
      hyprshot = "${lib.getExe pkgs.hyprshot} -m region -o ~/Pictures/Screenshots";
      cliphist = "${lib.getExe config.services.cliphist.package}";
      wl-copy = "${lib.getExe' pkgs.wl-clipboard "wl-copy"}";
      bemoji = "${lib.getExe pkgs.bemoji}";
    in [
      "${mod}, C, killactive,"
      "${mod}, V, togglefloating,"
      "${mod}, F, fullscreen,"
      "${mod}, Q, exec, uwsm stop"
      "${mod}, R, exec, ${uwsm} ${fuzzel}"
      "${mod}, RETURN, exec, ${uwsm} ${kitty}"
      "${mod}, M, exec, loginctl lock-session"
      "${mod} SHIFT, S, exec, ${uwsm} ${hyprshot}"
      "${mod}, PERIOD, exec, ${bemoji}"

      "${mod}, H, movefocus, l"
      "${mod}, left, movefocus, l"
      "${mod} SHIFT, H, movewindow, l"
      "${mod} SHIFT, left, movewindow, l"

      "${mod}, J, movefocus, d"
      "${mod}, down, movefocus, d"
      "${mod} SHIFT, J, movewindow, d"
      "${mod} SHIFT, down, movewindow, d"

      "${mod}, K, movefocus, u"
      "${mod}, up, movefocus, u"
      "${mod} SHIFT, K, movewindow, u"
      "${mod} SHIFT, up, movewindow, u"

      "${mod}, L, movefocus, r"
      "${mod}, right, movefocus, r"
      "${mod} SHIFT, L, movewindow, r"
      "${mod} SHIFT, right, movewindow, r"

      "${mod} SHIFT, V, exec, ${cliphist} list | ${fuzzel} --dmenu | ${cliphist} decode | ${wl-copy}"
      "${mod}, mouse_down, workspace, m-1"
      "${mod}, mouse_up, workspace, m+1"
      "${mod}, 0, workspace, 10"
      "${mod} SHIFT, 0, movetoworkspace, 10"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let workspace = i + 1; in [
            "${mod}, code:1${toString i}, workspace, ${toString workspace}"
            "${mod} SHIFT, code:1${toString i}, movetoworkspace, ${toString workspace}"
          ]
        )9)
      );
    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86AudioPlay, exec, ${lib.getExe pkgs.playerctl} play-pause"
      ", XF86AudioPrev, exec, ${lib.getExe pkgs.playerctl} previous"
      ", XF86AudioNext, exec, ${lib.getExe pkgs.playerctl} next"
      ", XF86MonBrightnessUp, exec, ${lib.getExe pkgs.brightnessctl} -q s +10%"
      ", XF86MonBrightnessDown, exec, ${lib.getExe pkgs.brightnessctl} -q s 10%-"
    ];
  };
}
