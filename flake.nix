{
	description = "A NixOS flake";
	inputs = {
 		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		nixpkgsnew.url = "github:NixOS/nixpkgs?rev=7525d999cd850b9a488817abc89c75dc733acf17";
		agenix.url = "github:ryantm/agenix";
		agenix.inputs.nixpkgs.follows = "nixpkgs";
		nvf.url = "github:notashelf/nvf";
    	nvf.inputs.nixpkgs.follows = "nixpkgs";
		#noctalia = {

		#	url = "github:noctalia-dev/noctalia";
		#	inputs.nixpkgs.follows = "nixpkgs";
		#};
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = {self, nixpkgs,nixpkgsnew, home-manager, agenix, nvf, ...}@inputs: {
		
    nixosConfigurations.inspiron = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./hosts/inspiron
				
				agenix.nixosModules.default	
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
          			home-manager.backupFileExtension = "backup";
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = {inherit inputs;};
					home-manager.users.ethan = import ./hosts/inspiron/home.nix;
					home-manager.sharedModules = [nvf.homeManagerModules.default];
				}
			];
		};

		nixosConfigurations.otabello = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/otabello

        # agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            backupFileExtension = "backup";
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            sharedModules = [nvf.homeManagerModules.default];
          };
        }
      ];
    };
    
    nixosConfigurations.iso = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ./hosts/iso
      ];
    };
		
	};
}
