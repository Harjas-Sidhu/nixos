{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		neovim
	];

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};

	environment.variables.EDITOR = "nvim";
}
