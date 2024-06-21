{ user, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = { "$scriptPath" = "/home/${user}/nix/scripts"; };
  };
}
