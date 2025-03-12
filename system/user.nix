{ config, lib, pkgs, variables, ... }:

{
	users.users.${variables.username} = {
		isNormalUser = true;
		extraGroups = ["networkmanager" "wheel" "audio" "video" "camera" "fs"];
		initialPassword = variables.initialPassword;
	};

	security.sudo.enable = true;
}
