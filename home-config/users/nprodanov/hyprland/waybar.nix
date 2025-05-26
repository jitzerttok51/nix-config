{ pkgs, config, ... }: {

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        height = 20;
        # width = 1880;
        margin-top = 10;

        modules-left =
          [ "custom/menu" "hyprland/workspaces" "hyprland/window" ];
        modules-center =
          [ "custom/cmus" "custom/weather" "custom/foot" "custom/nemo" ];
        modules-right = [
          "tray"
          "hyprland/language"
          "pulseaudio"
          "battery"
          "clock"
          "custom/power"
        ];

        "custom/menu" = { # Converted from custom/menu
          format = "{icon}";
          format-icons = "";
          on-click = "~/.config/rofi/launchers/type-6/launcher_2.sh";
          escape = true;
          tooltip = false;
        };

        battery = {
          states = {
            		warning = 30;
            		critical = 15;
        	};
          format = "<span color='#fab387'>{icon}</span>  {capacity}%";
          format-warning = "<span color='#f5543b'>{icon}</span>  {capacity}%";
          format-critical = "<span color='#ff1f1f'>{icon}</span>  {capacity}%";
          format-icons = [ "󰁺" "󰁼" "󰁾" "󰂀" "󰁹" ];
          format-charging = "<span color='#62de72'>{icon}</span>  {capacity}%";
        	format-plugged = "<span color='#fab387'>{icon}</span>   {capacity}%";
        };

        "hyprland/workspaces" = { # Converted from hyprland/workspaces
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          tooltip = false;
        };

        "hyprland/window" = { # Converted from hyprland/window
          format = "{class}";
          separate-outputs = false;
        };

        "custom/cmus" = { # Converted from custom/cmus
          format = "{icon}    {}";
          format-icons = { default = [ "<span color='#89b4fa'></span>" ]; };
          max-length = 45;
          interval = 1;
          exec = ''cmus-remote -C "format_print '%F'"'';
          exec-if = "pgrep cmus";
          on-click = "cmus-remote -u";
          on-scroll-up = "cmus-remote --next";
          on-scroll-down = "cmus-remote --prev";
          escape = true;
          tooltip = false;
        };

        "custom/weather" = { # Converted from custom/weather
          format = "{}";
          interval = 10;
          exec = "~/.config/waybar/weather.sh";
          tooltip = false;
        };

        "custom/foot" = { # Converted from custom/foot
          format = "<span color='#a6e3a1'></span>";
          on-click = "exec kitty -T home";
          tooltip = false;
        };

        "custom/nemo" = { # Converted from custom/nemo
          format = "<span color='#89b4fa'>󰉋</span>";
          on-click = "exec dolphin ~";
          tooltip = false;
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };

        "hyprland/language" = { # Converted from hyprland/language
          format = "<span color='#fab387'>󰌏</span>   {}";
          format-en = "EN";
          format-bg = "BG";
        };

        pulseaudio = {
          scroll-step = 5;
          format = "<span color='#fab387'>{icon}</span>   {volume}%";
          format-icons = { default = [ "" "" "" ]; };
          on-click = "pavucontrol";
          tooltip = false;
        };

        clock = {
          format = "<span color='#fab387'></span>    {:%H:%M}";
          tooltip-format = ''
            <big><span color='#cdd6f4'>{:%Y %B}</span></big>
            <tt><small>{calendar}</small></tt>'';
          format-alt =
            "<span color='#eba0ac'></span>    <span color='#cdd6f4'>{:%Y-%m-%d}</span>";

          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#cdd6f4'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#f5c2e7'><b>W{}</b></span>";
              weekdays = "<span color='#f5c2e7'><b>{}</b></span>";
              today = "<span color='#eba0ac'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        "custom/power" = { # Converted from custom/power
          format = "{icon}";
          format-icons = "";
          on-click = "~/.config/rofi/powermenu/type-4/powermenu.sh";
          escape = true;
          tooltip = false;
        };

        escape = true;
        exec =
          "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"; # Script in resources folder
      };
    };
    style = (builtins.readFile ./waybar-style.css);
  };
}
