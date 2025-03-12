{ config, pkgs, lib, variables, ... }:

{
	imports = [
		./rofi
        ./neovim
        ./git
        ./ghostty
	];

	home.username = variables.username;
	home.homeDirectory = "/home/${variables.username}";
	programs.home-manager.enable = true;
	home.stateVersion = "24.11";
}
