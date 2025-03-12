{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		histSize = 100000;
		shellAliases = {
    			ll = "ls -l";
    			update = "sudo nixos-rebuild switch";
  		};
	};
}
