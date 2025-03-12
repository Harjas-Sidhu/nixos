{ config, pkgs, variables, ... }:

{
	networking.hostname = variables.hostname;
	networking.networkmanager.enable = true;
}
