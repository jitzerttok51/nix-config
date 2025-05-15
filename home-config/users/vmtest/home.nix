{ config, pkgs, lib, ... }:

{
  home.username = "vmtest";
  home.homeDirectory = "/home/vmtest";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    jetbrains.idea-community
    eclipses.eclipse-jee
    vscode
    qbittorrent
    libreoffice
    # caprine
    caprine-bin
    viber
    xiphos
    mpv
    chromium
    # obsidian
    thunderbird
    zulu17
    neofetch
    bat
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  nixpkgs.overlays = [
    (import ../../../overlays/viber.nix)
  ];

  programs.home-manager.enable = true;

  home.shellAliases = {
    cat = "bat";
    rcat = "cat";
  };

  home.keyboard = {
    layout = "us, bg";
    options = [
      "grp:caps_toggle"
    ]; 
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = lib.mkIf (config.programs.xserver.enable or true) # Apply only if X server is enabled
                [
                  (lib.hm.gvariant.mkTuple [ "xkb" "us" ]) # US English layout
                  (lib.hm.gvariant.mkTuple [ "xkb" "bg" ]) # Example: Bulgarian layout
                  # Add more layouts as needed
                ];

      xkb-options = lib.mkIf (config.programs.xserver.enable or true) # Apply only if X server is enabled
                    [
                      "grp:alt_shift_toggle" # Example: Switch layout with Alt+Shift
                      "terminate:ctrl_alt_bksp" # Example: Enable Ctrl+Alt+Backspace to kill X server
                      # Add more XKB options as needed
                    ];

      # You might also want to set 'current' to the index of the default layout (0-based)
      # current = lib.mkIf (config.programs.xserver.enable or true) 0; # Set US as default
    };

    # You might need other dconf settings for Cinnamon,
    # but input-sources is the primary one for layouts.
  };

  programs.zsh = {
    enable = true;
    # zsh-autoenv.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "history"
      ];
    };
    initExtra = ''
        neofetch
      '';
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.initContent
    # initContent = (let 
    #   # zshConfigEarlyInit = lib.mkOrder 500 "do something"; 
    #   zshConfig = lib.mkOrder 1500 "neofetch"; 
    #   in 
    #   lib.mkMerge [ 
    #     # zshConfigEarlyInit 
    #     zshConfig 
    #   ]);

  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
