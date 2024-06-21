{
	description = "System Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, catppuccin, home-manager, ... }@inputs:
		let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      user = "rap1";
		in {
			nixosConfigurations.ryo = nixpkgs.lib.nixosSystem {
				inherit system;
        
        specialArgs = { inherit inputs user; };

				modules = [
					./nixos/configuration.nix
          inputs.aagl.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
				];
			};


			homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit user;
          inherit inputs;
        };

				modules = [ 
					./home-manager/home.nix
					catppuccin.homeManagerModules.catppuccin
				];
      };
	};

}
