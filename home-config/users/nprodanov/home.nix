{ config, pkgs, lib, nix-vscode-extensions, ... }:

{
  imports = [ 
    ./vscode.nix
    ../../../modules/desktop/hyprland.nix
    # <plasma-manager/modules>
  ];

  home.username = "nprodanov";
  home.homeDirectory = "/home/nprodanov";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # jetbrains.idea-community
    # eclipses.eclipse-jee
    vscode
    yt-dlp
    # qbittorrent
    # libreoffice
    # caprine
    # caprine-bin
    # viber
    # xiphos
    mpv
    # chromium
    # obsidian
    # thunderbird
    zulu17
    neofetch
    bat
    # dconf-editor
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

/*
  dconf.settings = {
    "org/gnome/libgnomekbd/keyboard" = {
      layouts = ["us" "bg\tphonetic"];
      options = [ "grp\tgrp:alt_shift_toggle" ];
    };

    "org/cinnamon/desktop/interface" = {
      keyboard-layout-use-upper = true;
    };
  };
*/
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

  programs.git = {
    enable = true;
    userEmail = "Nikolay.Prodanov@proton.me";
    userName = "Nikolay Prodanov";
    signing = {
      signByDefault = true;
      key = "0x7F7E202ABB244D20";
      format = "openpgp";
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  programs.gpg = {
    enable = true;
  };

  programs.plasma = {
    enable = true;
    workspace = {
      theme = "breeze-dark";
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor.theme = "Breeze_Light";
      iconTheme = "Papirus-Dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."Desktops"."Number" = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };
    shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+Ctrl+Alt+L"
        ];
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };
    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
        widgets = [ "org.kde.plasma.appmenu" ];
      }
    ];
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
