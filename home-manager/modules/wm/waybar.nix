{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 31;
        spacing = 4;

        modules-left = ["custom/padd" "custom/icon" "hyprland/workspaces" "custom/padd"];
        modules-center = ["custom/padd" "idle_inhibitor" "clock" "custom/padd"];
        modules-right = ["custom/padd"  "backlight" "custom/sep"  "hyprland/language" "battery" "custom/sep" "network" "pulseaudio" "custom/notification" "tray" "custom/padd"];

        "hyprland/workspaces" = {
          format = "{icon}";
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
          format = "  {}";
          format-en = "us";
          format-pt = "pt";
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
            format = "{:%I:%M %p}";
            format-alt = " {:%a, %d/%m/%y}";

            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "pulseaudio" = {
            reverse-scrolling = 1;
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
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
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          min-length = 7;
        };

        "battery" = {
            states = {
                warning = 30;
                critical = 15;
            };

            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
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
          format-alt = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
          interval = 2;
        };

        "tray" = {
          icon-size = 18;
          rotate = 0;
          spacing = 5;
        };

        "custom/icon" = {
          format = " ";
          tooltip = false;
          on-click = "pkill -x rofi || rofi -show drun";
        };

        "custom/notification" = {
          format = " ";
          tooltip = false;
          on-click = "swaync-client -t";
        };

        "custom/padd" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        
        "custom/sep" = {
          format = "";
          tooltip = false;
        };
      };
    };

    style = ./style.css;
  };
}
