{
	description = "My Homely Flake";

  	inputs = {
	    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
		systems.url = "github:nix-systems/default-linux";
		hardware.url = "github:nixos/nixos-hardware";
		home-manager = {
				url = "github:nix-community/home-manager";
				inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix.url = "github:danth/stylix";
		zen-browser.url = "github:MarceColl/zen-browser-flake";
		ghostty = {
      			url = "github:ghostty-org/ghostty";
    	};
        zig.url = "github:mitchellh/zig-overlay";
  	};

  	outputs = { self, nixpkgs, nixpkgs-stable, systems, hardware, stylix, zen-browser, ghostty, zig, home-manager }@inputs :
		let
			variables = import ./variables.nix;
			system = variables.system;
			pkgs = import nixpkgs {
				inherit system;
				config.allowUnfree = true;
			};
			lib = nixpkgs.lib;

		in {
			inherit lib;
			
			nixConfigurations = {
				${variables.hostname} = lib.nixosSystem {
					moudles = [
						./hosts/atlas
						inputs.stylix.nixosModules.stylix
						home-manager.nixosModules.home-manager {
            						home-manager.useGlobalPkgs = true;
            						home-manager.useUserPackages = true;
            						home-manager.users.${variables.username} = import ./home.nix;
							home-manager.extraSpecialArgs = {
								inherit variables inputs;
							};
						}
					];
					specialArgs = {
						inherit variables inputs;
					};
				};
			};


		};
}
