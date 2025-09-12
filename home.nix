{
  inputs,
  config,
  pkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bigfoot";
  home.homeDirectory = "/home/bigfoot";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value; even if you update Home Manager. If you do
  # want to update the value; then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello; world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages; for example; by applying
    # # overrides. You can do that directly here; just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example; this adds a command 'my-hello' to your
    # # environment =
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello; ${config.home.username}!"
    # '')
    pkgs.git
    pkgs.material-design-icons
    pkgs.waybar
    pkgs.rofi-wayland
    pkgs.sassc
    pkgs.nwg-look
    pkgs.bibata-cursors
    #    pkgs.stylix
    pkgs.waypaper
    pkgs.swww
    pkgs.kdePackages.dolphin
    pkgs.yazi
    # pkgs.chromium
    pkgs.google-chrome
    pkgs.vscode
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.fastfetch
    pkgs.gh
    pkgs.kitty
    pkgs.vesktop
    pkgs.waybar
    pkgs.nixfmt-rfc-style
    pkgs.wlogout
    pkgs.localsend
    pkgs.pnpm
    pkgs.nodejs_24
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    #".config/hyprland/mocha.conf".source = "./jots/hypr/mocha.conf";
    #    ".config/hyprland/hyprland.conf".source = "./jots/hypr/hyprland.conf";
  };
  home.file."/home/bigfoot/.config/rofi/config.rasi".source = ./jots/rofi/config.rasi;
  home.file."/home/bigfoot/.config/rofi/catppuccin-default.rasi".source =
    ./jots/rofi/catppuccin-default.rasi;
  home.file."/home/bigfoot/.config/rofi/catppuccin-mocha.rasi".source =
    ./jots/rofi/catppuccin-mocha.rasi;
  home.file."/home/bigfoot/.config/scripts".source = ./jots/scripts;
  home.file."/home/bigfoot/.config/hypr/mocha.conf".source = ./jots/hypr/mocha.conf;
  home.file."/home/bigfoot/.config/hypr/hyprlock.conf".source = ./jots/hypr/hyprlock.conf;
  home.file."/home/bigfoot/.config/hypr/hypridle.conf".source = ./jots/hypr/hypridle.conf;
  home.file."/home/bigfoot/.config/hypr/hyprpaper.conf".source = ./jots/hypr/hyprpaper.conf;
  home.file."/home/bigfoot/.config/waybar/config.jsonc".source = ./jots/waybar/config.jsonc;
  home.file."/home/bigfoot/.config/waybar/style.css".source = ./jots/waybar/style.css;
  home.file."/home/bigfoot/.config/waybar/mocha.css".source = ./jots/waybar/mocha.css;
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bigfoot/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # programs.waybar = {
  #   enable = true;
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs = {
    config = {
      allowUnfree = true;
      # Optional = Use allowUnfreePredicate for fine-grained control
      # allowUnfreePredicate = pkg = builtins.elem (lib.getName pkg) [ "steam" "anydesk" ];
    };
  };
  # programs.hyprpanel = {
  #   # Configure and theme almost all options from the GUI.
  #   # See 'https =//hyprpanel.com/configuration/settings.html'.
  #   # Default = <same as gui>
  #   #    package = inputs.hyprpanel.packages.${pkgs.system}.default;
  #   enable = true;
  #   #    theme = "catppuccin_split";
  #   settings = {

  #     # Configure bar layouts for monitors.
  #     # See 'https =//hyprpanel.com/configuration/panel.html'.
  #     # Default = null
  #     #layout = {
  #     bar.layouts = {
  #       "0" = {
  #         left = [
  #           "dashboard"
  #           "workspaces"
  #           "windowtitle"
  #         ];
  #         middle = [ "media" ];
  #         right = [
  #           "cpu"
  #           "ram"
  #           "volume"
  #           "network"
  #           "systray"
  #           "notifications"
  #           "power"
  #         ];
  #       };
  #     };

  #     bar.launcher.autoDetectIcon = true;
  #     bar.workspaces.show_icons = true;
  #     menus.clock = {
  #       time = {
  #         military = true;
  #         hideSeconds = true;
  #       };
  #       weather.unit = "metric";
  #     };

  #     menus.dashboard.directories.enabled = false;
  #     menus.dashboard.stats.enable_gpu = false;
  #     menus.dashboard.controls.enabled = false;
  #     menus.dashboard.shortcuts.enabled = false;
  #     theme = {
  #       bar.transparent = false;
  #       bar.floating = true;

  #       font = {
  #         name = "JetBrainsMono NF";
  #         size = "16px";
  #       };
  #     };
  #     hyprland.enable = true;
  #     systemd = false;
  #   };
  # };
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    targets.waybar.enable = true;
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./jots/hypr/hyprland.conf}
    '';
  };
  programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
  };
  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = "0";
      window_margin_width = "10";
      confirm_os_window_close = "0";
      shell = "zsh";
    };
  };
  programs.zsh = {
    enable = true;
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
        "romkatv/powerlevel10k"
      ];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "node"
        "npm"
        "history"
        "sudo"
      ];
    };
    initContent = ''
      source ~/.p10k.zsh
    '';
  };
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Other extensions
      jnoortheen.nix-ide
      pkief.material-product-icons
      esbenp.prettier-vscode
      formulahendry.code-runner
      vscodevim.vim
      bradlc.vscode-tailwindcss
    ];
    profiles.default.userSettings = {
      "workbench.productIconTheme" = "material-product-icons";
      "window.titleBarStyle" = "native";
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "workbench.activityBar.location" = "top";
      "workbench.sideBar.location" = "right";
      "window.commandCenter" = false;
      "code-runner.executorMapByFileExtension" = {
        ".py" = "";
        ".vb" = "cd $dir && vbc /nologo $fileName && $dir$fileNameWithoutExt";
        ".vbs" = "cscript //Nologo";
        ".scala" = "scala";
        ".jl" = "julia";
        ".cr" = "crystal";
        ".ml" = "ocaml";
        ".zig" = "zig run";
        ".exs" = "elixir";
        ".hx" = "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt";
        ".rkt" = "racket";
        ".scm" = "csi -script";
        ".ahk" = "autohotkey";
        ".au3" = "autoit3";
        ".kt" =
          "cd $dir && kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar";
        ".kts" = "kotlinc -script";
        ".dart" = "dart";
        ".pas" = "cd $dir && fpc $fileName && $dir$fileNameWithoutExt";
        ".pp" = "cd $dir && fpc $fileName && $dir$fileNameWithoutExt";
        ".d" = "cd $dir && dmd $fileName && $dir$fileNameWithoutExt";
        ".hs" = "runhaskell";
        ".nim" = "nim compile --verbosity =0 --hints =off --run";
        ".csproj" = "dotnet run --project";
        ".fsproj" = "dotnet run --project";
        ".lisp" = "sbcl --script";
        ".kit" = "kitc --run";
        ".v" = "v run";
        ".vsh" = "v run";
        ".sass" = "sass --style expanded";
        ".cu" = "cd $dir && nvcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        ".ring" = "ring";
        ".sml" = "cd $dir && sml $fileName";
        ".mojo" = "mojo run";
        ".erl" = "escript";
        ".spwn" = "spwn build";
        ".pkl" = "cd $dir && pkl eval -f yaml $fileName -o $fileNameWithoutExt.yaml";
        ".gleam" = "gleam run -m $fileNameWithoutExt";
        ".nix" = "home-manager switch --flake";
      };
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "files.associations" = {
        "*.css" = "tailwindcss";
      };
      "editor.quickSuggestions" = {
        "strings" = "on";
      };
      "tailwindCSS.includeLanguages" = {
        "plaintext" = "html";
      };
    };
  };
  gtk = {
    enable = true;
  };
  qt = {
    enable = true;
  };
}
