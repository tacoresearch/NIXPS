
{config, pkgs, ... }:

{
# #Enabling hyprlnd on NixOS------------------------------------------------------
# programs.hyprland = {
#   enable = true;
# #  nvidiaPatches = true;
#   xwayland.enable = true;
# };

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
