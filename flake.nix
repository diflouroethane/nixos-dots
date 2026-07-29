{
	description = "A test NixOS flake";
	inputs = {
 		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		nixpkgsnew.url = "github:NixOS/nixpkgs?rev=7525d999cd850b9a488817abc89c75dc733acf17";
		#noctalia = {
		#	url = "github:noctalia-dev/noctalia";
		#	inputs.nixpkgs.follows = "nixpkgs";
		#};
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = {self, nixpkgs,nixpkgsnew, home-manager,...}@inputs: {
		nixosConfigurations.inspiron = nixpkgs.lib.nixosSystem {
			modules = [
				./configuration.nix
				
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = {inherit inputs;};
					home-manager.users.ethan = import ./home.nix;
				}
			];
		};
		
	};
}
