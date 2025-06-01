{ config, pkgs, lib, ... }:

let
  inherit (lib.strings) concatStringsSep;
  inherit (lib.meta) getExe;

  defaultSession = {
    user = "greeter";
    command = concatStringsSep " " [
      (getExe pkgs.greetd.tuigreet)
      "--time"
      "--time-format '%I:%M %p | %a • %h | %F'"
      "--cmd Hyprland"
      "--remember"
      "--remember-user-session"
      "--asterisks"
    ];
  };
in

{
  # Move greetd service configuration to the top level
  services.greetd = {
    enable = true;
    vt = 2;
    settings = {
      default_session = defaultSession;
    };
  };

  # Enable Hyprland at the top level
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Other configurations can also stay at the top level


# #waybar
# pkgs.waybar
# [
# #waybay environment system packages
# environment.systemPackages = []
# (pkgs.waybar.overrideAttrs (oldAttrs: {
#     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
#   })
# )




# #XDG portal
# xdg.portal.enable = true;
# xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

# #Enable sound with pipewire.
# sound.enable = true;
# security.rtkit.enable = true;
# services.pipewire = {
#   enable = true;
#   alsa.enable = true;
#   alsa.support32Bit = true;
#   pulse.enable = true;
#   jack.enable = true;
# };

# #rofi keybind
# bind = $mainMod, S, exec, rofi -show drun -show-icons


}