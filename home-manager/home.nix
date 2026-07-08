{ config, pkgs, inputs, lib,  ... }:

{
  home.username = "megatank58";
  home.homeDirectory = "/home/megatank58";

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    _1password-cli
    _1password-gui
    acpi
    alacritty
    brightnessctl
    cloudflare-warp
    fastfetch
    feishin
    grim
    htop
    inputs.swayalt.packages.${stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    jq
    lm_sensors
    nnn
    overskride
    radicle-node
    serpl
    swayfx
    waybar
    wl-clipboard
    wlogout
    wmenu
    zathura
    zoxide
  ];

  home.file = {
  ".config/sway/config".text = ''
    set $mod Mod4
    set $left h
    set $down j
    set $up k
    set $right l
    set $term alacritty
    set $menu wmenu-run
    set $browser zen

    default_border none
    output * bg /home/megatank58/Wallpapers/nijika_night.jpeg fill

    input type:touchpad {
      dwt enabled
      tap enabled
      natural_scroll disabled
      middle_emulation enabled
    }

    bindsym $mod+Return exec $term
    bindsym $mod+Shift+q kill
    bindsym $mod+d exec $menu
    bindsym $mod+z exec $browser

    floating_modifier $mod normal

    bindsym $mod+Shift+c reload
    bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
    bindsym $mod+$left focus left
    bindsym $mod+$down focus down
    bindsym $mod+$up focus up
    bindsym $mod+$right focus right
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    bindsym $mod+Shift+$left move left
    bindsym $mod+Shift+$down move down
    bindsym $mod+Shift+$up move up
    bindsym $mod+Shift+$right move right
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right

    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+b splith
    bindsym $mod+v splitv

    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    bindsym $mod+f fullscreen
    bindsym $mod+Shift+space floating toggle
    bindsym $mod+space focus mode_toggle
    bindsym $mod+a focus parent
    bindsym $mod+Shift+minus move scratchpad
    bindsym $mod+minus scratchpad show

    bindsym $mod+r mode "resize"

    bindsym --locked XF86AudioMute exec pactl set-sink-mute \@DEFAULT_SINK@ toggle
    bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume \@DEFAULT_SINK@ -5%
    bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume \@DEFAULT_SINK@ +5%
    bindsym --locked XF86AudioMicMute exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle
    bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
    bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+

    bindsym $mod+Print exec grim - | wl-copy

    set $opacity 0.95
    blur enable
    blur_passes 1
    blur_radius 5

    corner_radius 10

    shadows enable
    shadow_blur_radius 50

    for_window [class=".*"] opacity $opacity
    for_window [app_id=".*"] opacity $opacity

    bar {
        swaybar_command waybar
    }

    include /etc/sway/config.d/*
  '';
    ".config/waybar/config.jsonc" = {
      text = ''
        {
          "layer": "top",
          "position": "top",
          "height": 12,
          "spacing": 0,
          "margin-top": 0,
          "margin-bottom": 0,
          "margin-left": 0,
          "margin-right": 0,
          "modules-left": [
            "sway/workspaces"
          ],
          "modules-center": [
            "memory",
            "cpu"
          ],
          "modules-right": [
            "battery",
            "backlight",
            "pulseaudio",
            "clock",
            "network",
            "custom/powermenu"
          ],
          "sway/workspaces": {
            "disable-scroll": false,
            "all-outputs": true,
            "format": "{icon}",
            "format-focused": "{icon}",
            "format-icons": {
              "1": "1",
              "2": "2",
              "3": "3",
              "4": "4",
              "5": "5",
              "6": "6",
              "7": "7",
              "8": "8",
              "9": "9",
              "focused": "<span foreground='#b4befe'></span>",
              "urgent": "!"
            },
            "persistent_workspaces": {
              "1": "1",
              "2": "2",
              "3": "3",
              "4": "4",
              "5": "5",
              "6": "6",
              "7": "7",
              "8": "8",
              "9": "9"
            },
            "sort-by": "number",
            "on-click": "move to workspace",
            "on-scroll-up": "swaymsg workspace prev_on_output",
            "on-scroll-down": "swaymsg workspace next_on_output"
          },
          "memory": {
            "interval": 2,
            "format": " <span foreground='#cdd6f4'>{used}G</span>",
            "tooltip": true,
            "tooltip-format": "{used}GB / {total}GB"
          },
          "cpu": {
            "interval": 2,
            "format": " <span foreground='#cdd6f4'>{usage}%</span>",
            "tooltip": true,
            "tooltip-format": "Load: {load_avg1}\nUsage: {usage}%"
          },
          "pulseaudio": {
            "format": "{icon} <span foreground='#cdd6f4'>{volume}%</span>",
            "format-muted": "󰖁",
            "on-click": "pavucontrol",
            "scroll-step": 5,
            "max-volume": 100,
            "format-icons": {
              "headphones": "",
              "default": [
                "",
                "",
                "\u2009"
              ]
            }
          },
          "clock": {
            "timezone": "Asia/Kolkata",
            "locale": "en_IN.UTF-8",
            "tooltip-format": "<big>{:L%A, %d %B %Y}</big>\n<tt><small>{calendar}</small></tt>",
            "format": "<span foreground='#cdd6f4'>{:L%d %B, %A %H:%M}</span>",
          },
          // Relevant for laptops
          "battery": {
            "bat": "BAT0",
            "adapter": "ACAD",
            "full-at": 98,
            "low-threshold": 10,
            "interval": 5,
            "format": "{icon} <span foreground='#cdd6f4'>{capacity}%</span>",
            "format-charging": " <span foreground='#cdd6f4'>{capacity}%</span>",
            "format-icons": [
              "",
              "",
              "",
              "",
              ""
            ],
            "tooltip": false
          },
          // For laptops too
          "backlight": {
            "device": "amdgpu_bl2",
            "format": "{icon} <span foreground='#cdd6f4'>{percent}%</span>",
            "format-icons": [
              "",
              ""
            ],
            "on-scroll-up": "brightnessctl s +5%",
            "on-scroll-down": "brightnessctl s 5%-",
            "tooltip": false
          },
          "network": {
            "interface": "wlp13s0",
            "format-wifi": " ",
            "format-disconnected": "<span foreground='#f38ba8'>󰖪</span>",
            "tooltip": false,
            "on-click": "alacritty -e nmcli"
          },
          "custom/powermenu": {
            "format": " ",
            "on-click": "wlogout",
            "tooltip": false
          }
        }
      '';
    };
    ".config/waybar/style.css" = {
      text = ''
        * {
            font-family: "JetBrainsMono Nerd Font", "Material Design Icons", "unifont", sans-serif;
            font-size: 13px;
            font-weight: bold;
            border: none;
            border-radius: 0;
            min-height: 0;
        }

        window#waybar {
            background: #111111; 
            color: #cdd6f4;     
            border-radius: 0;
            border-bottom: none;
            min-height: 20px;
            padding: 0 5px;
            margin: 0;
        }

        #workspaces {
            background: #24262e;
            margin: 4px 0;
            padding: 0 8px;
            min-height: 20px;
            border-radius: 4px;
            margin-left: 8px;
        }

        #workspaces button {
            background: transparent;
            color: #cdd6f4;
            padding: 0 4px;
            margin: 0 2px;
            border: none;
            box-shadow: none;
            transition: none;
            min-width: 0;
        }

        #workspaces button.active {
            background: #45475a;    
            border-bottom: 2px solid #cba6f7; 
            padding-bottom: 0;
        }

        #workspaces button.urgent {
            color: #cba6f7;
            background: #f38ba8; 
        }

        #workspaces button:hover {
            background: #585b70;   
            border-radius: 2px;
        }

        #custom-round-left,
        #custom-round-right {
            font-size: 20px;
            color: #1e1e2e;   
            background: transparent;
            padding: 0;
            margin: 0;
            min-width: 0;
            margin-right: -1px;
            margin-left: -1px;
        }

        #temperature,
        #pulseaudio,
        #clock,
        #memory,
        #cpu,
        #battery,
        #backlight,
        #network,
        #custom-powermenu,
        #tray {
            padding: 0 10px;
            margin: 0;
            border-radius: 0;
            color: #cba6f7;  
        }

        #tray {
            background: #313244;
            margin: 7px 0;
            padding: 0 8px;
            min-height: 28px;
            border-radius: 6px 0 0 6px;
            margin-right: 0;
        }

        #tray button {
            padding: 0;
            margin: 0;
            border: none;
            min-height: 0;
            min-width: 0;
        }

        #tray image {
            padding: 0;
            margin: 0;
        }

        #battery,
        #memory,
        #cpu,
        #temperature,
        #backlight,
        #pulseaudio,
        #clock {
            color: #b4befe;      
        }

        #custom-powermenu,
        #network {
            color: #b4befe;
        }

        #custom-powermenu:hover {
            background: #45475a;
        }
      '';
    };
  };

  home.sessionVariables = {
    BROWSER = "zen";
  };
  programs.git = {
    enable = true;
    settings = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILCjnnPX9qJtdlMIL6olkBDDbYSQWmzKqiYeAZHHqETA";
        name = "megatank58";
        email = "51410502+megatank58@users.noreply.github.com";
      };
    };
  };
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_frappe";
      editor = {
        mouse = false;
        line-number = "relative";
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
      };
    };
    defaultEditor = true;
  };
  programs.jujutsu = {
    enable = true;
    settings = {
      signing = {
        behaviour = "drop";
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILCjnnPX9qJtdlMIL6olkBDDbYSQWmzKqiYeAZHHqETA";
        backends.ssh.program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      git = {
        sign-on-push = true;
      };
      ui = {
        show-cryptographic-signatures = true;
      };
      template-aliases = {
        "format_short_cryptographic_signature(sig)" = ''
          if(sig,
            sig.status(),
            "(no sig)",
          )
        '';
      };
      user = {
        name = "megatank58";
        email = "51410502+megatank58@users.noreply.github.com";
      };
    };
  };
  programs.nushell =  let jjCompletions = pkgs.runCommand "completions-jj.nu" {} ''
      ${pkgs.jujutsu}/bin/jj util completion nushell > $out
    '';
  in  {
    enable = true;
    extraConfig = ''
      use ${jjCompletions} *
      $env.EDITOR = "hx"
      source ~/.zoxide.nu
      $env.config.show_banner = false
      $env.SSH_AUTH_SOCK = "/home/megatank58/.1password/agent.sock"
    '';
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "Host *" = {
        IdentityAgent = "/home/megatank58/.1password/agent.sock";
      };
    };
  };
  programs.vesktop = {
    enable = true;
    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = true;
      notifyAboutUpdates = true;

      plugins = {
        ClearURLs.enabled = true;
        FixYoutubeEmbeds.enabled = true;
      };
    };
  };
  programs.home-manager.enable = true;
}
