{ config, pkgs, ... }:
# just an example top-level "configuration.nix" file within the themelios scheme
{
    imports = [];

    i18n = {
        consoleFont = "Lat2-Terminus16";
        consoleKeyMap = "de";
        defaultLocale = "de_DE.UTF-8";
    };

    time.timeZone = "Europe/Berlin";

    programs.mtr.enable = true;
    programs.bash.enableCompletion = true;

    networking.hostName = "tc01";

    programs.git.enable = true;
    programs.git.package = pkgs.gitFull;
    programs.fish.enable = true;

    services.openssh.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.aw = {
        isNormalUser = true;
        description = "A W";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK2C6D1gJNjA7WMC7xrbi/nmpRqvgkHGn7CozVceINLX mail@a-w.io"
        ];
    };

}
