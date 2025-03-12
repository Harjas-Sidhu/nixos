{ config, lib, pkgs, ... }:

{
    programs.ghostty = {
		enable = true;
		shellIntegration.enableZshIntegration = true;

		settings = {
			font-size = 14;
			font-family = "JetBrainsMono Nerd Font Mono";
			window-theme = "dark";
		};
	};
}
