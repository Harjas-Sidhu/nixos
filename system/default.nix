{ config, lib, pkgs, ... }:

{
    imports = [
	    ./user.nix
	    ./touchpad.nix
	    ./stylix.nix
    ] ++
    import ( ./bootloader ) ++
    import ( ./networking ) ++
    import ( ./sound ) ++
    import ( ./shell ) ++
    import ( ./display ) ++
    import ( ./graphics ) ++
    import ( ./packages );
}
