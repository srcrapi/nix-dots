{ pkgs, user, ...}: {
	programs.fish.enable = true;

	users = {
		defaultUserShell = pkgs.fish;

		users.${user} = {
			isNormalUser = true;
			extraGroups = ["networkmanager" "wheel" "input" ];
			packages = with pkgs; [];
		};
	};
}
