{ config, lib, pkgs, ... }:

{
	services.xserver.displayManager.lightdm = {
		enable = true;

		greeters.slick = {
			enable = true;
		};
	};

	services.displayManager.defaultSession = "none+awesome";
}
