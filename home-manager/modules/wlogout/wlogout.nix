{ user, ... }: {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "suspend";
        action = "swaylock -f && systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
* {
    background-image: none;
    font-size: 14px;
}

@import "../waybar/theme.css";

window {
  background: @main-bg-tpt;
}

button {
  font-family: "JetBrainsMono Nerd Font";
  background-color: @main-bg;  
  background-repeat: no-repeat;
  background-position: center;
  background-size: 20%;
  color: @main-fg;
  margin: 8px;
  padding: 4px;
  border-radius: 10px;
  border: 1px solid @wb-hvr-fg;
  animation: scale_f 0.3s ease-in;
}

button:hover,
button:active,
button:focus {
  background-color: @wb-act-bg;
  color: @wb-act-fg;
  border-radius: 20px;
  animation: scale_f 0.3s ease-in;
  transition: all 0.5s cubic-bezier(.55,0.0,.28,1.682);
}

button:hover#lock,
button:active#lock,
button:focus#lock {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/lock_black.png");
}

button:hover#logout,
button:active#logout, 
button:focus#logout {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/logout_black.png");
}

button:hover#hibernate,
button:active#hibernate, 
button:focus#hibernate {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/hibernate_black.png");
}

button:hover#suspend,
button:active#suspend, 
button:focus#suspend {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/suspend_black.png");
}

button:hover#shutdown,
button:active#shutdown, 
button:focus#shutdown {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/shutdown_black.png");
}

button:hover#reboot,
button:active#reboot, 
button:focus#reboot {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/reboot_black.png");
}

#lock {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/lock_white.png");
}


#logout {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/logout_white.png");
}

#hibernate {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/hibernate_white.png");
}

#suspend {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/suspend_white.png");
}

#shutdown {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/shutdown_white.png");
}

#reboot {
  background-image: url("/home/${user}/nix/home-manager/modules/wlogout/icons/reboot_white.png");
}
    '';
  };
}
