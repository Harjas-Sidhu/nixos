{ config, lib, pkgs, variables, ... }:

{
	users.user.${variables.username} = {
		isNormalUser = true;
		extraGroups = ["networkmanager" "wheel" "audio" "video" "camera" "fs"];
		initialPassword = variables.initialPassword;
	};

	security.sudo.enable = true;
}
