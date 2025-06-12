{ inputs, pkgs, ... }:

{
  # Home packages to install (optional)
  home.packages = with pkgs; [
    # You can include common packages here, for example:
    zsh
    thefuck
    atuin
    starship
  ];

  # Program configurations
  programs = {
    zsh = {
      enable = true;               # Enable Zsh
      autosuggestion.enable = true;  # Enable Zsh autosuggestions
    };

    pay-respects = {
      enable = true;                  # Enable The Fuck
      enableZshIntegration = true;    # Enable Zsh integration for The Fuck
    };

    atuin = {
      enable = true;                  # Enable Atuin
      enableZshIntegration = true;    # Enable Zsh integration for Atuin
    };

    starship = {
      enable = true;                  # Enable Starship prompt
      enableZshIntegration = true;    # Enable Zsh integration for Starship
    };
  };
}