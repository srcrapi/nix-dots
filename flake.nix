{

	description = "System Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, catppuccin, home-manager, ... }@inputs:
		let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
		in {

			nixosConfigurations.ryo = nixpkgs.lib.nixosSystem {
				inherit system;

				modules = [
					./nixos/configuration.nix
				];
			};


			homeConfigurations.rap1 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = inputs;

				modules = [ 
					./home-manager/home.nix
					catppuccin.homeManagerModules.catppuccin
				];
			};
	};

}
