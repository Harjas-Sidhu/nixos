{ config, pkgs, variables, ... }:

{
	networking.hostName = variables.hostname;
	networking.networkmanager.enable = true;
}
