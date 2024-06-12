#!/usr/bin/env sh

saveDir="$HOME/nix"
scrDir=$(dirname "$(realpath "$0")")

cp -r "${srcDirs}/swaylock/" "$HOME/.config"

mkdir -p "$saveDir"

cp -r "${srcDir}/*" "$saveDir"

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko "${saveDir}/disko.nix"

sudo nixos-rebuild switch --flake "$saveDir"
home-manager switch --flake "$saveDir"
