{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    steam
    protonup
    kitty
    neovim
    vscode
    notion
		obs-studio
		mpv
    firefox
    openvpn
    lutris
    vesktop
    discord
    dolphin
    curl
    zoxide
    tree
		nmap
    spotify
    mpd-mpris
    spicetify-cli
    waybar
    swaynotificationcenter
    libnotify
    rofi-wayland
    openssh
    swww
    eza
    pamixer
    flatpak
    fish
    starship
    git
    electron
    lazygit
    xsel
    libsForQt5.sddm
    unzip
    python312
    python3Packages.tkinter
    python312Packages.pip
    corepack
    ninja
    gobject-introspection.dev
    meson
    cmake
    pywal
    gcc
    home-manager
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    brightnessctl
    pipewire
    pulseaudio
    fastfetch
    htop
    tty-clock
    tmux
    cava
    bat
    alsa-utils
    killall
    networkmanagerapplet
    adwaita-qt
    herbstluftwm
    hyprland
    nwg-look
    glib
    swaylock-effects
    wlogout
    swappy
    seatd
    xdg-desktop-portal-hyprland
    xwayland
    wl-clipboard
    cliphist
    nodejs_20
    firefox-devedition
    google-chrome
    playerctl
    (tela-circle-icon-theme.override { colorVariants = [ "dracula" ]; })
    imagemagick
    jq
    parallel
    catppuccin
    catppuccin-kvantum
    bibata-cursors
    vanilla-dmz
    grim
    grimblast
    slurp
    udiskie
    feh
    fzf
    service-wrapper
    cargo
    tlp
    bluez
    bluez-tools
    blueman
    pavucontrol
    nix-prefetch-git
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    cantarell-fonts
    cascadia-code
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
}
