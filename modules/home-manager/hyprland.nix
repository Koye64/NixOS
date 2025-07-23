{ inputs, pkgs, lib, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        border_size = 2;
        no_border_on_floating = false;
        gaps_in = 2;
        gaps_out = 8;
        gaps_workspaces = 48;
        "col.inactive_border" = "$surface0";
        "col.active_border" = "$blue";
        "col.nogroup_border" = "$surface0";
        "col.nogroup_border_active" = "$red";
        layout = "dwindle";
        no_focus_fallback = false;
        resize_on_border = true;
        extend_border_grab_area = 8;
        hover_icon_on_border = false;
        allow_tearing = true;
        resize_corner = 0;
        snap = {
          enabled = true;
          window_gap = 8;
          monitor_gap = 8;
          border_overlap = true;
        };
      };
      decoration = {
        rounding = 8;
        rounding_power = 2;
        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;
        dim_inactive = false;
        dim_strength = 0;
        dim_special = 0.2;
        dim_around = 0.2;
        border_part_of_window = true;
        blur = {
          enabled = true;
          size = 8;
          passes = 4;
          ignore_opacity = true;
          new_optimizations = true;
          xray = false;
          noise = 0.012;
          contrast = 0.9;
          brightness = 0.8;
          vibrancy = 0.2;
          vibrancy_darkness = 0;
          special = false;
          popups = false;
          popups_ignorealpha = 0.2;
          input_methods = false;
          input_methods_ignorealpha = 0.2;
        };
        shadow = {
          enabled = true;
          range = 1;
          render_power = 4;
          sharp = true;
          ignore_window = true;
          color = "$crust";
          color_inactive = "$crust";
          offset = "0 0";
          scale = 1;
        };
      };
      animations = {
        enabled = true;
        first_launch_animation = false;
        bezier = [
          "sharp, 0, 0.75, 0.25, 1"
          "bump, 0.25, 0, 0, 1"
        ];
        animation = [
          "windows, 1, 2.5, sharp, popin"
          "layers, 1, 2.5, sharp, fade"
          "layersOut, 1, 2.5, bump, fade"
          "fade, 1, 2.5, bump"
          "fadeOut, 1, 2.5, sharp"
          "border, 1, 2, sharp"
          "workspaces, 1, 2.5, sharp, slide"
        ];
      };
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        resolve_binds_by_sym = false;
        repeat_rate = 25;
        repeat_delay = 600;
        sensitivity = 0;
        accel_profile = "flat";
        force_no_accel = false;
        left_handed = false;
        scroll_button = 0;
        scroll_button_lock = 0;
        scroll_factor = 1;
        natural_scroll = false;
        follow_mouse = 1;
        follow_mouse_threshold = 0;
        focus_on_close = 0;
        mouse_refocus = false;
        float_switch_override_focus = 1;
        special_fallthrough = false;
        off_window_axis_events = 1;
        emulate_discrete_scroll = 1;
        touchpad = {
          disable_while_typing = false;
          natural_scroll = true;
          scroll_factor = 1;
          middle_button_emulation = false;
          clickfinger_behavior = false;
          tap-to-click = true;
          drag_lock = true;
          tap-and-drag = true;
          flip_x = false;
          flip_y = false;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_min_fingers = true;
        workspace_swipe_distance = 300;
        workspace_swipe_touch = false;
        workspace_swipe_invert = true;
        workspace_swipe_touch_invert = false;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_create_new = true;
        workspace_swipe_direction_lock = false;
        workspace_swipe_forever = true;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        vfr = true;
        vrr = 2;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        disable_autoreload = false;
        enable_swallow = true;
        swallow_regex = "kitty";
        focus_on_activate = true;
        mouse_move_focuses_monitor = true;
        render_ahead_of_time = false;
        allow_session_lock_restore = true;
        background_color = "$crust";
        close_special_on_empty = true;
        new_window_takes_over_fullscreen = 0;
        exit_window_retains_fullscreen = false;
        initial_workspace_tracking = 2;
        middle_click_paste = false;
        render_unfocused_fps = 10;
        disable_xdg_env_checks = true;
        disable_hyprland_qtutils_check = true;
        lockdead_screen_delay = 1000;
        enable_anr_dialog = false;
        anr_missed_pings = 0;
      };
      binds = {
        pass_mouse_when_bound = false;
        scroll_event_delay = 0;
        workspace_back_and_forth = false;
        hide_special_on_workspace_change = true;
        allow_workspace_cycles = false;
        workspace_center_on = 1;
        focus_preferred_method = 0;
        ignore_group_lock = false;
        movefocus_cycles_fullscreen = false;
        movefocus_cycles_groupfirst = false;
        disable_keybind_grabbing = false;
        window_direction_monitor_fallback = true;
        allow_pin_fullscreen = false;
        drag_threshold = 0;
      };
      xwayland = {
        enabled = true;
        use_nearest_neighbor = true;
        force_zero_scaling = true;
        create_abstract_socket = false;
      };
      render = {
        explicit_sync = 2;
        explicit_sync_kms = 2;
        direct_scanout = 1;
        expand_undersized_textures = true;
        xp_mode = false;
        ctm_animation = 2;
        cm_fs_passthrough = 2;
        cm_enabled = true;
        send_content_type = true;
      };
      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2;
        no_break_fs_vrr = 2;
        min_refresh_rate = 60;
        hotspot_padding = 1;
        inactive_timeout = 0;
        no_warps = false;
        persistent_warps = true;
        warp_on_change_workspace = 0;
        warp_on_toggle_special = 0;
        default_monitor = "HDMI-A-2";
        zoom_factor = 1;
        zoom_rigid = false;
        enable_hyprcursor = false;
        hide_on_key_press = false;
        hide_on_touch = true;
        use_cpu_buffer = 2;
      };
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
        enforce_permissions = false;
      };
      dwindle = {
        pseudotile = false;
        force_split = 0;
        preserve_split = false;
        smart_split = false;
        smart_resizing = true;
        permanent_direction_override = false;
        special_scale_factor = 1;
        split_width_multiplier = 1;
        use_active_for_splits = true;
        default_split_ratio = 1;
        split_bias = 0;
      };
      bind = [
        "SUPER, C, killactive,"
        "SUPER, V, togglefloating,"
        "SUPER, F, fullscreen,"
        "SUPER, Q, exec, uwsm stop"
        "SUPER, R, exec, ${lib.getExe config.programs.fuzzel.package}"
        "SUPER, RETURN, exec, ${lib.getExe config.programs.kitty.package}"
        "SUPER, M, exec, ${lib.getExe config.programs.hyprlock.package}"
        "SUPER, H, movefocus, l"
        "SUPER, left, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, right, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, up, movefocus, u"
        "SUPER, J, movefocus, d"
        "SUPER, down, movefocus, d"
        "SUPER, mouse_down, workspace, m-1"
        "SUPER, mouse_up, workspace, m+1"
        "SUPER, 0, workspace, 10"
        "SUPER SHIFT, 0, movetoworkspace, 10"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let workspace = i + 1; in [
            "SUPER, code:1${toString i}, workspace, ${toString workspace}"
            "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString workspace}"
          ]
        )9)
      );
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
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
      windowrule = [
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "immediate, class:.*"
      ];
      workspace = [
        "10, monitor:HDMI-A-1"
        "1, monitor:HDMI-A-2"
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
      monitor = [
        "HDMI-A-1, 1440x900@74.98, 0x0, 1"
        "HDMI-A-2, 1920x1080@144, 1440x0, 1"
      ];
    };
  };
  programs = {
    hyprlock = { enable = true; };
    fuzzel = { enable = true; };
  };
  services = {
    hyprpolkitagent.enable = true;
    hyprpaper = {
      enable = true;
      settings = let
        wallpaper = builtins.toString ../../assets/img/nix-wallpaper.png;
      in {
        preload = [ wallpaper ];
        wallpaper = [ ("," + wallpaper) ];
      };
    };
    hypridle = {
      enable = true;
      settings = let
        hyprlock = "${lib.getExe config.programs.hyprlock.package}";
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
