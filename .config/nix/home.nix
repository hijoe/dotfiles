{ config, pkgs, ... }:

{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = "/Users/" + builtins.getEnv "USER";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # Add your packages here as you migrate from Homebrew
    git
    curl
    wget
  ];

  # Let your existing dotfiles handle configuration files
  # Nix will just manage packages
  
  programs.home-manager.enable = true;
}
