#sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
 unstable
{ config, ... }:
{
nixpkgs.config = {
allowUnfree = true;
packageOverrides = pkgs: {
unstable = import <unstable> {
config = config.nixpkgs.config;
};
};
};
}