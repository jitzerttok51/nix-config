{ config, pkgs, ...}: {
    programs.zsh = {
    enable = true;
    # zsh-autoenv.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "history" ];
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
}