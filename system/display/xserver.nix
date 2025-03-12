{ config, pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
      		xclip # Clipboard
    	];

	services.xserver = {
		enable = true;
		videoDrivers = [ "nvidia" "amdgpu" ];

		xkb = {
			layout = "us";
			variant = "";
		};

		excludePackages = with pkgs; [
			xterm
		];
		
	};
}
