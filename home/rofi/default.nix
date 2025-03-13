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

        extraConfig = {
# General settings
            modi = "drun,run,filebrowser,window";
            case-sensitive = false;
            filter = "";
            scroll-method = 0;
            normalize-match = true;
            show-icons = true;
            icon-theme = "Papirus";
            steal-focus = false;

# Matching settings
            matching = "normal";
            tokenize = true;

# SSH settings
            ssh-client = "ssh";
            ssh-command = "{terminal} -e {ssh-client} {host} [-p {port}]";
            parse-hosts = true;
            parse-known-hosts = true;

# Drun settings
            drun-categories = "";
            drun-match-fields = "name,generic,exec,categories,keywords";
            drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
            drun-show-actions = false;
            drun-url-launcher = "xdg-open";
            drun-use-desktop-cache = false;
            drun-reload-desktop-cache = false;
            "drun.parse-user" = true;
            "drun.parse-system" = true;

# Run settings
            run-command = "{cmd}";
            run-list-command = "";
            run-shell-command = "{terminal} -e {cmd}";

# Fallback icon
            "run,drun.fallback-icon" = "application-x-addon";

# Window switcher settings
            window-match-fields = "title,class,role,name,desktop";
            window-command = "wmctrl -i -R {window}";
            window-format = "{w} - {c} - {t:0}";
            window-thumbnail = false;

# History and sorting
            disable-history = false;
            sorting-method = "normal";
            max-history-size = 25;

# Display settings
            display-window = "Windows";
            display-windowcd = "Window CD";
            display-run = "Run";
            display-ssh = "SSH";
            display-drun = "Apps";
            display-combi = "Combi";
            display-keys = "Keys";
            display-filebrowser = "Files";

# Misc settings
            font = "JetBrainsMono Nerd Font Mono 14";
            sort = false;
            threads = 0;
            click-to-exit = true;

# File browser settings
            "filebrowser.directories-first" = true;
            "filebrowser.sorting-method" = "name";

# Timeout settings
            "timeout.action" = "kb-cancel";
            "timeout.delay" = 0;

# Note: Keybindings are commented out in the original file
        };
    };

# These are no longer needed with extraConfig
# home.file.".config/rofi/config.rasi" = {
#   source = ./config.rasi;
# };

# Keep these for themes and images
    home.file.".config/rofi/themes" = {
        recursive = true;
        source = ./themes;
    };
    home.file.".config/rofi/images" = {
        recursive = true;
        source = ./images;
    };
}
