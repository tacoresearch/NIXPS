{
  outputs = inputs @ {
    self,
    home-manager,
    nixpkgs,
    ...
  }: {
    # nixos config
    nixosConfigurations = {
      "nixps" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          (import ./system/nixps "bob")
          home-manager.nixosModules.home-manager
          {networking.hostName = "nixps";}
        ];
      };
    };

    #  homemanager config
    homeConfigurations = {
      "bob" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ({pkgs, ...}: {
            nix.package = pkgs.nix;
            home.username = "bob";
            home.homeDirectory = "/Users/bob";
          })
        ];
      };
    };

  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager?main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
}
