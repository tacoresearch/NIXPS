{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    pulseaudio # pactl
    swww
    wf-recorder
    slurp
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      exec-once = [
        # "hyprctl setcursor Qogir 24"
      ];

##scale is 1  is 100 2 is 200 percent
      monitor = [",preferred,auto,2"];

      general = {
        layout = "dwindle";
        resize_on_border = true;
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
        focus_on_activate = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
        #   natural_scroll = "yes";
        #   disable_while_typing = true;
        #   drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      bind = [
          "SUPER, Space, exec,              rofi -show drun" # application launcher
          "SUPER, RETURN, exec, foot" # terminal
          "SUPER RETURN, Alt_L, exec, kitty" # terminal
          
          "SUPER, Q,              killactive"

        #   "ALT, Tab, exec,      hyprctl dispatch focuscurrentorlast; hyprctl dispatch alterzorder top"
        #   "CTRL ALT, Delete,    exit"

        #   "SUPER, F,            togglefloating"
        #   "SUPER, G,            fullscreen"
        #   "SUPER, P,            togglesplit"

        ];

      bindle = [
        ",XF86MonBrightnessUp,   exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl set  5%-"
        ",XF86KbdBrightnessUp,   exec, brightnessctl -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, brightnessctl -d asus::kbd_backlight set  1-"
        ",XF86AudioRaiseVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];


      decoration = {
        shadow = {
          range = 11;
          render_power = 0;
          color = "rgba(0,0,0,0.3)";
        };

        dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
    };
  };
}