{ config, pkgs, ... }:

{
	services.xserver.windowManager.default = "awesome";
	services.xserver.windowManager.awesome = {
		enable = true;
		luaModules = with pkgs.luaPackages; [
			luarocks
		];
	};
}
