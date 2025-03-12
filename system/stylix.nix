{ config, lib, pkgs, ... }:

{
	stylix = {
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
		image = ../wallpapers/gruvbox/cool-wallpaper.png;

		cursor = {
			package = pkgs.simp1e-cursors;
			name = "Simp1e-Gruvbox-Dark";
		};

		fonts = {
			monospace = {
				package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
				name = "JetBrainsMono Nerd Font Mono";
			};
			sansSerif = {
				package = pkgs.dejavu_fonts;
				name = "DejaVu Sans";
			};
			serif = {
				package = pkgs.dejavu_fonts;
				name = "DejaVu Serif";
			};
			emoji = {
      				package = pkgs.noto-fonts-emoji;
      				name = "Noto Color Emoji";
    			};
		};

		targets.lightdm.useWallpaper = ../wallpapers/gruvbox/minimal-space.png;

		polarity = "dark";
	};
}
