{ config, pkgs, ... }:

{
	boot.loader.systemd-boot.enable = false;

	boot.loader.grub = {
		enable = true;
		useOSProber = true;
		devices = [ "nodev" ];
		efiSupport = true;
        configurationLimit = 5;
        theme = ./config;
	};

	boot.loader.efi = {
		canTouchEfiVariables = true;
		efiSysMountPoint = "/boot";
	};
}
