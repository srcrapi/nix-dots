{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in 
{
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledCustomApps = with spicePkgs.apps; [ lyrics-plus ];

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      history
      adblock
      hidePodcasts
    ];
  };
}
