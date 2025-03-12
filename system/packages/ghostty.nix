{ config, lib, pkgs, inputs, variables, ... }:

{
	environment.systemPackages = [
		inputs.ghostty.packages."${variables.system}".default
	];

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
