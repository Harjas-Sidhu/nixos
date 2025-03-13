{ config, lib, pkgs, ... }:

{
    home.file.".config/nvim" = {
        recursive = true;
        source = ./config;
    };
}
