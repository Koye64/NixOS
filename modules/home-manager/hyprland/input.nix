{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = 2;
      no_break_fs_vrr = 2;
      min_refresh_rate = 60;
      hotspot_padding = 1;
      inactive_timeout = 0;
      no_warps = false;
      persistent_warps = false;
      warp_on_change_workspace = 0;
      warp_on_toggle_special = 0;
      default_monitor = "HDMI-A-2";
      zoom_factor = 1;
      zoom_rigid = false;
      enable_hyprcursor = true;
      hide_on_key_press = false;
      hide_on_touch = true;
      use_cpu_buffer = 2;
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
      tablet = {
        output = "HDMI-A-2";
      };
    };
  };
}
