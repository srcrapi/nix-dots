{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,1";

      exec-once = [
        "waybar"
        "swaync"
        "swww-daemon"
        "hyprctl setcursor all-scroll 24"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wal -i ~/Pictures/wallpapers/ryo_noMoney.png"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPERCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
      ];

      general = {
        gaps_in = 3;
        gaps_out = 15;
      
        border_size = 5;

        "col.active_border" = "rgba(9198ffee)";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;
        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        drop_shadow = false;

        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = "on";
          ignore_opacity = "on";
          xray = false;
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us,pt";
        kb_variant = "lang";

        follow_mouse = 1;

        sensitivity = 0; 

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      device = {
        name = "epic mouse V1";
        sensitivity = -0.5;
      };

      source = [
        "~/nix/home-manager/modules/wm/hypr/keybindings.conf"
        "~/nix/home-manager/modules/wm/hypr/window_rules.conf"
      ];
    };
  };
}
