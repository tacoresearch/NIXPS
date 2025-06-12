{
  inputs,
  pkgs,
  ...
}: {
  ##feet are stinky
  programs.foot = {
    enable = true;
  };
## kittys are soft
    programs.kitty = {
    enable = true;
  };

##space 
    programs.starship = {
    enable = true;
  };

}