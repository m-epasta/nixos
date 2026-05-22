{ 
  description = "Nixos hyprland";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant.url = "github:abenz1267/elephant";

    walker = {
	url = "github:abenz1267/walker";
	inputs.elephant.follows = "elephant";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    hyprland,
    home-manager,
    elephant,
    ...
  }: {
    nixosConfigurations.mepasta = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
      	 home-manager.nixosModules.home-manager
	 {
	   home-manager.useGlobalPkgs = true;
	   home-manager.useUserPackages = true;
	   home-manager.extraSpecialArgs = { inherit inputs; };
	   home-manager.users.mepasta = import ./home.nix;
	 }

        ./configuration.nix
        ./hardware-configuration.nix
      ];

    };
  };
}
