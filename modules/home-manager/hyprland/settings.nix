{ inputs, pkgs, lib, config, ... }:
{
  # source session variables through UWSM
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "dwindle";
      no_focus_fallback = false;
      resize_on_border = true;
      extend_border_grab_area = 8;
      allow_tearing = true;
      resize_corner = 0;
      snap = {
        enabled = true;
        window_gap = 8;
        monitor_gap = 8;
        border_overlap = true;
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
      workspace_swipe_forever = false;
    };
    misc = {
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
      allow_session_lock_restore = true;
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
      direct_scanout = 1;
      expand_undersized_textures = true;
      xp_mode = false;
      ctm_animation = 2;
      cm_fs_passthrough = 2;
      cm_enabled = true;
      send_content_type = true;
      new_render_scheduling = true;
    };
    ecosystem = {
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
  };
}
