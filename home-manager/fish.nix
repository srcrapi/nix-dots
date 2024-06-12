{ config, ... }: {
	programs.fish = {
		enable = true;

		shellAliases =
		let
			flakePath = "~/nix";
		in {
			rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
			upd = "nix flake update ${flakePath}";
			upg = "sudo nixos-rebuild switch --upgrade --flake ${flakePath}";
			hms = "home-manager switch --flake ${flakePath}";
      conf = "nvim ~/nix/nixos/configuration.nix";
      hypr = "nvim ~/nix/home-manager/modules/wm/hypr/hyprland.nix";

			vim = "nvim";
      cat = "bat";
			ff = "fastfetch";
      fzf = "fzf --border=rounded";

      l = "eza -lh --icons=auto";
      ls = "eza -1 --icons=auto";
      ll = "eza -lha --icons=auto --group-directories-first";
      ld = "eza -lhD --icons=auto";
		};

    shellInit = "fastfetch";
	};
}
