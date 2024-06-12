{ pkgs, ... }: 
let
  tela-cirlcle-dracula = (pkgs.tela-circle-icon-theme.override { colorVariants = [ "dracula" ]; }); 
in 
{
  gtk = {
    enable = true;

    catppuccin.enable = true;
    theme.name = "Catppuccin-Mocha-Standard-Mauve-Dark";

    iconTheme = {
      package =  tela-cirlcle-dracula;

      name = "Tela-Circle-Dracula";
    };
  };
}
