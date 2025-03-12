{ config, lib, pkgs, inputs, variables, ... }:

{
	environment.systemPackages = [
		inputs.ghostty.packages."${variables.system}".default
	];	
}
