{ ... }:
{
  wayland.windowManager.sway.config = {
    floating.criteria = [
      { app_id = "org.pulseaudio.pavucontrol";
      }
      { title = "Picture-in-Picture";
      }
    ];
  };
}
