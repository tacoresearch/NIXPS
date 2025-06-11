
{config, pkgs, lib, ... }:



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
   in {
  config = {
    services.greetd = {
      enable = true;
      vt = 2;
      #      restart = !sys.autoLogin;

      # <https://man.sr.ht/~kennylevinsen/greetd/>
      settings = {
        # default session is what will be used if no session is selected
        # in this case it'll be a TUI greeter
        default_session = defaultSession;

      };
    };

  };


# #enable greeter program
# #services.greetd.enable = true;
# services.greetd = {
#   enable = true;
#   settings = rec {
#     initial_session = {
#       command = "${pkgs.hyprland}/bin/Hyprland";
#       user = "greeter";
#     };
#   };
# };


# #Enabling hyprlnd on NixOS------------------------------------------------------
programs.hyprland = {
  enable = true;
#  nvidiaPatches = true;
  xwayland.enable = true;
};

# environment.sessionVariables = {
#  # If your cursor becomes invisible
#   WLR_NO_HARDWARE_CURSORS = "1";
#  # Hint electron apps to use wayland
#   NIXOS_OZONE_WL = "1";
# };

# hardware = {
# #    Opengl
#     opengl.enable = true;

#  #   Most wayland compositors need this
#   #  nvidia.modesetting.enable = true;
# };

# #waybar
# pkgs.waybar

# # #waybay environment system packages
# # environment.systemPackages = []
# # (pkgs.waybar.overrideAttrs (oldAttrs: {
# #     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
# #   })
# # )
# # ];

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