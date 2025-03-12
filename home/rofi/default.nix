{ config, lib, variables, pkgs, ... }:

{
    home.packages = with pkgs; [
        jq
    ];

    programs.rofi = {
        enable = true;
        cycle = true;
        location = "center";
        pass = {};
        terminal = "ghostty";

        plugins = with pkgs; [
            rofi-systemd
                rofi-emoji
        ];

        theme = ./themes/launcher.rasi;
    };

    home.file."~/.config/rofi/config.rasi" = {
        source = ./config.rasi;
    };

    home.file."~/.config/rofi/themes" = {
        recursive = true;
        source = ./themes;
    };

    home.file."~/.config/rofi/images" = {
        recursive = true;
        source = ./images;
    };
}
