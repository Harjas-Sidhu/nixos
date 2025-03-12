{ config, lib, variables, pkgs, ... }:

{
	home.packages = with pkgs; [
		jq
	];

	programs.rofi = {
		enable = true;
		cycle = true;
		location = "center";
		pass = {};
		terminal = "ghostty";
		plugins = with pkgs; [
			rofi-systemd
			rofi-emoji
		];
		theme = import ./themes/launcher.rasi;
		configPath = import ./config.rasi;
	};

	home.file."~/.config/rofi/themes" = {
		recursive = true;
		source = ./themes;
	};

	home.file."~/.config/rofi/images" = {
		recursive = true;
		source = ./images;
	};
}
