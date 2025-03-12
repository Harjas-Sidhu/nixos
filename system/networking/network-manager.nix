{ config, pkgs, variables, ... }:

{
	neworking.hostname = variables.hostname;
	networking.networkmanager.enable = true;
}
