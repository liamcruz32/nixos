{
  description = "Configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {home-manager, nixpkgs, ... }: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { 
        allowUnfree = true;
      };
    };

    lib = nixpkgs.lib;

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
    };
  };
}
