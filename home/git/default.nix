{ config, lib, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "Harjas-Sidhu";
        userEmail = "harjassidhu1@gmail.com";
        lfs.enable = true;
        extraConfig = {
            credential.helper = "${
                pkgs.git.override { withLibsecret = true; }
            }/bin/git-credentials-libsecret";
        };
    };
}
