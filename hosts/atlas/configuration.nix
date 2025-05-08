{ config, pkgs, inputs, variables, ... }:

{
	imports = [
      		./hardware-configuration.nix
    ]; 

	time.timeZone = "Asia/Kolkata";

  	i18n.defaultLocale = "en_IN";

  	i18n.extraLocaleSettings = {
    		LC_ADDRESS = "en_IN";
    		LC_IDENTIFICATION = "en_IN";
    		LC_MEASUREMENT = "en_IN";
    		LC_MONETARY = "en_IN";
    		LC_NAME = "en_IN";
    		LC_NUMERIC = "en_IN";
    		LC_PAPER = "en_IN";
    		LC_TELEPHONE = "en_IN";
    		LC_TIME = "en_IN";
  	};

  	nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  	environment.systemPackages = [
		inputs.zen-browser.packages."${variables.system}".specific
        pkgs.nodejs
        pkgs.php
        pkgs.php84Packages.composer
        inputs.zig.packages."${variables.system}"."master"
        pkgs.foliate
        pkgs.dconf
        pkgs.dconf-editor
        pkgs.glib
        pkgs.davinci-resolve
        pkgs.lutris
        pkgs.protonup-qt
        pkgs.wineWowPackages.stable
        pkgs.winetricks
        pkgs.glxinfo
        pkgs.vulkan-tools
        pkgs.vulkan-loader
        pkgs.vulkan-validation-layers
        pkgs.dxvk
  	];

    services.dbus.enable = true;

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
    };

    nix.settings.auto-optimise-store = true;

	system.stateVersion = "24.11";
}
