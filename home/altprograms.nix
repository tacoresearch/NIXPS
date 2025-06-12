{ pkgs, ... }:

{
  # Home Manager configuration
  home.packages = with pkgs; [ ];

  # Program configurations
  programs = {
    zsh = {
      enable = true;               # Enable Zsh
      autosuggestions.enable = true;  # Enable Zsh autosuggestions
    };

    thefuck = {
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