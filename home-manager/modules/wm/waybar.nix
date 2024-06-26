{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        height = 31;
        margin-top = 8;
        margin-left= 15;
        margin-right = 15;
        spacing = 4;

        modules-left = ["custom/padd" "custom/launcher" "custom/padd" "hyprland/workspaces" "custom/sep" "tray" "custom/padd"];
        modules-center = ["custom/padd" "clock" "custom/sep" "mpris" "custom/padd"];
        modules-right = ["custom/padd"  "backlight" "custom/sep"  "hyprland/language" "battery" "custom/sep" "network" "pulseaudio" "custom/notification" "custom/padd"];

        "hyprland/workspaces" = {
          #format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };

          persistent-workspaces = {
            eDP-1 = [1 2 3 4 5];
            HDMI-A-1 = [1 2 3 4 5];
          };

          disable-scroll = true;
        };
        
        "hyprland/language" = {
          format = "  <span foreground='white'>{}</span>";
          format-en = "us";
          format-pt = "pt";
          on-click = "~/nix/scripts/keyboard-switch.sh";
          min-legth = 5;
          tooltip = false;
        };

        "keyboard-state" = {
            numlock = false;
            capslock = true;

            format = "{icon} ";
            format-icons = {
              locked = "";
              unlocked = "";
            };
        };

        "idle_inhibitor" = {
          format = "{icon} ";
          rotate = 0;
          format-icons = {
            activated = "󰥔";
            deactivated = "";
          };
        };

        "clock" = {
            format = "  <span foreground='white'>{:%I:%M %p}</span>";
            format-alt = "  <span foreground='white'>{:%H:%M</span> • <span foreground='white'>%A, %d/%m/%y}</span>";

            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "pulseaudio" = {
            reverse-scrolling = 1;
            format = "{icon} <span foreground='white'>{volume}</span> {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " <span foreground='white'>{volume}%</span>";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };

            on-click = "pavucontrol";
            min-length = 13;
        }; 
        
        "cpu" = {
            interval = 2;
            format = "  {usage}%";
            min-length = 6;
        };

        "memory" = {
            format = "  {}%";
        };

        "backlight" = {
          device = "amdgpu_bl1";
          format = "{icon} <span foreground='white'>{percent}%</span>";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          min-length = 7;
          tooltip = false;
        };

        "battery" = {
            states = {
                warning = 30;
                critical = 15;
            };

            format = "{icon} <span foreground='white'>{capacity}%</span>";
            format-charging = " <span foreground='white'>{capacity}%</span>";
            format-plugged = " <span foreground='white'>{capacity}%</span>";
            format-alt = "{time} {icon}";
            format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        "network" = {
          tooltip = true;
          format-wifi = "{icon}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          rotate = 0;
          format-ethernet = "󰈀 ";
          tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰤭 ";
          tooltip-format-disconnected = "Disconnected";
          format-alt = " <span foreground='white'>{bandwidthDownBytes}</span>  <span foreground='white'>{bandwidthUpBytes}</span>";
          interval = 2;
        };

        "mpris" = {
          format = "{player_icon} <span foreground='white'>{title}</span>";
          format-paused = "{status_icon} <span foreground='white'>{title}</span>";
          player-icons = {
            default = " ";
          };
          status-icons = {
            paused = "⏸";
          };

          ignored-players = ["firefox"];
        };

        "tray" = {
          icon-size = 18;
          rotate = 0;
          spacing = 5;
        };

        "custom/launcher" = {
          format = " ";
          tooltip = false;
          on-click = "pkill -x rofi || rofi -show drun";
        };

        "custom/notification" = {
          format = "{icon} ";
          format-icons = {
            notification = "<span><sup></sup></span>";
            none = "";
            dnd-notification = "<span><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span><sup></sup></span>";
            dnd-inhibited-none = "";
          };

          tooltip = false;
          return-type = "json";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "custom/padd" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        
        "custom/sep" = {
          format = "•";
          tooltip = false;
        };
      };
    };

    style = ./style.css;
  };
}
