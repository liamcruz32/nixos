{
  description = "My nix configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, home-manager, ... }:
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
      hammer = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.liam = {
              imports = [ (./users/liam/home.nix) ];
            };
          }

        ];
      };
    };

    # homeManagerConfiguration = {
    #   liam = home-manager.lib.homeManagerConfiguration {
    #     inherit system pkgs;
    #     username = liam;
    #     homeDirectory = /home/liam;
    #     configuration = {
    #       imports = [
    #         ./users/liam/home.nix
    #       ];
    #     };
    #   };
    # };
  };
}
