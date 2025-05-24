username: {
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
#    ./asus.nix
#    ./audio.nix
#    ./gnome.nix
#    ./hyprland.nix
#    ./locale.nix
#    ./nautilus.nix
#    ./system.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    initialPassword = username;
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "docker"
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [./home.nix];
    };
  };
}
