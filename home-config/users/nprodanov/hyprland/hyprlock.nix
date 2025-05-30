{ config, pkgs, ... }:
let font = "Meslo-lg";
  wallpapers-path = ".local/hypr-wallpapers";
  wallpaper = "${wallpapers-path}/min-24.png";
  profile-pic = "${wallpapers-path}/9400_5_2_01.jpg";
  scripts-path = ".local/hypr-scripts";
  battery-level = "${scripts-path}/battery-level.sh";
  network-status = "${scripts-path}/network-status.sh";
  cmus-lock = "${scripts-path}/cmus-lock.sh";
  cmus-toggle = "cmus-remote -u";
in {
    home.file.${wallpapers-path} = {
    source = ./wallpapers;
    recursive = true;
  };
  home.file.${scripts-path} = {
    source = ./scripts;
    recursive = true;
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "/home/justin/.cache/wal/colors-hyprland.conf";

      background = {
        monitor = "";
        # path = "screenshot"; # Commented out in source, so also in Nix
        path = wallpaper;
        # color = "$background"; # Commented out in source
        blur_passes = 1;
        contrast = 1;
        brightness = 0.8;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };

      input-field = {
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "#1e1e2e";
        inner_color = "#cdd6f4";
        font_color = "#cdd6f4";
        fade_on_empty = false;
        rounding = -1;
        check_color = "#cdd6f4";
        placeholder_text =
          ''<i><span foreground="##1e1e2e">Input Password...</span></i>'';
        hide_input = false;
        position = "0, -50";
        halign = "center";
        valign = "center";
      };

      # shape = [
      #   {
      #     size = "90, 40";
      #     color = "rgba(0, 0, 0, 0.0)";
      #     rounding = "-1";
      #     border_size = 4;
      #     border_color = "rgba(0, 207, 230, 1.0)";
      #     position = "-340, -5";
      #     halign = "right";
      #     valign = "top";
      #   }
      # ];

      # Labels are handled as a list of attribute sets in Nix
      label = [
        # DATE
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "#cdd6f4";
          font_size = 22;
          font_family = "Bebas Neue";
          position = "0, -400";
          halign = "center";
          valign = "center";
        }

        # TIME
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-H:%M")"'';
          color = "#cdd6f4";
          font_size = 95;
          font_family = "Bebas Neue";
          position = "0, -320";
          halign = "center";
          valign = "center";
        }

        # CURRENT SONG (commented out in original, so it won't be in the active Nix config unless uncommented)
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(${cmus-lock})"'';
          # color = "$foreground";
          color = "#eba0ac";
          onclick = cmus-toggle;
          font_size = 16;
          font_family = "JetBrains Mono";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }

        # User Label (whoami.sh)
        {
          monitor = "";
          text = ''
            cmd[update:1000] echo "$(/home/justin/Documents/Scripts/whoami.sh)"'';
          color = "$foreground";
          font_size = 14;
          font_family = "JetBrains Mono";
          position = "0, -10";
          halign = "center";
          valign = "top";
        }

        # Battery Label (battery.sh)
        {
          monitor = "";
          text = ''
            cmd[update:1000] echo "$(${battery-level})"'';
          color = "$foreground";
          font_size = 16;
          font_family = "JetBrains Mono";
          position = "-360, -15";
          halign = "right";
          valign = "top";
        }

        # Network Status Label (network-status.sh)
        {
          monitor = "";
          text = ''
            cmd[update:1000] echo "$(${network-status})"'';
          color = "$foreground";
          font_size = 16;
          font_family = "Meslo lg";
          position = "-100, -10";
          halign = "right";
          valign = "top";
        }
      ];

      # Images are handled as a list of attribute sets in Nix
      image = [
        # Profile Picture
        {
          monitor = "";
          path = profile-pic;
          size = 200;
          border_size = 2;
          border_color = "$foreground";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }

        # Desktop Environment
        # {
        #   monitor = "";
        #   path = "/home/justin/Pictures/profile_pictures/hypr.png";
        #   size = 75;
        #   border_size = 2;
        #   border_color = "$foreground";
        #   position = "-50, 50";
        #   halign = "right";
        #   valign = "bottom";
        # }
      ];
    };
  };
}
