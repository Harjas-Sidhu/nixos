{ config, lib, pkgs, ... }:

{
	hardware.graphics.enable = true;

	hardware.nvidia = {
		prime = {
			sync.enable = true;
			offload.enable = false;

			nvidiaBusId = "PCI:1:0:0";
			amdgpuBusId = "PCI:5:0:0";
		};

		modesetting.enable = true;

		powerManagement = {
			enable = false;
			finegrained = false;
		};

		open = true;
		nvidiaSettings = true;
	};
}
