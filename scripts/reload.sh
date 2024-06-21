#!/usr/bin/env sh

sleep 1
pkill waybar
sleep 1


waybar &

home-manager switch --flake "$HOME/nix/"

