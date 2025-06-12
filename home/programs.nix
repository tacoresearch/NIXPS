{
  inputs,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
  };
## kittys are soft
    programs.kitty = {
    enable = true;
  };
}