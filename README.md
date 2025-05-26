 Ok, this is the basics for how to simply use this flake.

 #1 - Do a fresh install of nixos  
 
 #2 - edit configuration.nix (on your clean nixos) to add: git, direnv, vscode, chromium, then do a rebuild.

 ```
 # packages
 environment.systemPackages = with pkgs; [
  chromium
  git
  direnv
  vscode
  ];


#  enable flakes:
 nix.settings.experimental-features = [ "nix-command" " flakes" ]; 

 ```



 #3 - Generate an ssh key and upload it to github
   ``` ssh-keygen -t ed25591 ```
 
 #4 - git clone this repo

```
git clone git@github.com:tacoresearch/NIXPS.git
```
then configure git so you have it ready for later
```
git config --global user.name "Taco Research"
```

```
git config --global user.email "labs@tacoresearch.org"
```

 #4 - open the folder in vscode and make any changes as necessary, perhaps adding a new machine hardware config, etc.
```
code ./NIXPS/
```


 #5 - when ready, test it! use a terminal from within /NIXPS/ folder. 

```
 nix flake update
 sudo nixos-rebuild boot --flake .#nixps
```





 

 

 


 
 

