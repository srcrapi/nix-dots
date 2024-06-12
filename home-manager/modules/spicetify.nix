{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in 
{
  imports = [
    spicetify-nix.homeManagerModule
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      history
      adblock
      hidePodcasts
    ];
  };
}
