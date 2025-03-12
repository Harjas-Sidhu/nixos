{ config, pkgs, lib, ... }:

{
	services.redshift = {
  		enable = true;
  		temperature = {
    			day = 5500;
    			night = 3700;
  		};
	};

	services.geoclue2.enable = true;
	location.provider = "geoclue2";
}
