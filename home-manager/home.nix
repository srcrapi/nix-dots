{ config, pkgs, ... }: {
	imports = [
		./fish.nix
		./modules/bundles.nix
	];

	home = {
		username = "rap1";
		homeDirectory = "/home/rap1";
		stateVersion = "24.05";
	};
}
