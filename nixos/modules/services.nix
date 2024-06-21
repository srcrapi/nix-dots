{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;

      xkb.layout = "us";
      xkb.variant = "";

      videoDrivers = ["amdgpu"];
    };

    displayManager.sddm = {
      enable = true;
      theme = "${import ./sddm-themes/corners.nix { inherit pkgs; }}";
    };

    blueman = {
      enable = true;
    };

    openssh.enable = true;
    flatpak.enable = true;
  };
}
