{ config, pkgs, variables, ... }:

{
	neworking.hostname = varibales.hostname;
	networking.networkmanager.enable = true;
}
