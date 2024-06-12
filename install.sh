#!/usr/bin/env sh

saveDir="$HOME/nix"
confPath="$HOME/.config"
scrDir=$(dirname "$(realpath "$0")")

cp -r "${srcDir}/swaylock/" "$confPath"
cp -r "${srcDir}/rofi/" "$confPath"

if [ ! -f "${confPath}/waybar" ]; then
  mkdir -p "${confPath}/waybar"
fi

cp -r "${srcDir}/theme.css" "$confPath/waybar"

mkdir -p "$saveDir"

cp -r "${srcDir}/*" "$saveDir"

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko "${saveDir}/disko.nix"

sudo nixos-rebuild switch --flake "$saveDir"
home-manager switch --flake "$saveDir"
