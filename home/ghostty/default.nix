{ config, lib, pkgs, ... }:

{
    programs.ghostty = {
		enable = true;

		settings = {
			font-size = 15;
			font-family = "JetBrainsMono Nerd Font Mono";
			window-theme = "dark";
            theme = "GruvboxDarkHard";
		};
	};
}
