{
  programs.kitty = {
    enable = true;

    settings = {
      include = "~/.config/kitty/themes/theme.conf";
      
      font_family = "Fira Code Nerd Font";
      bold_font = "auto";
      italic = "auto";
      bold_italic_font = "auto";

      font_size = 13;

      disable_ligatures = "never";
      copy_on_select = "always";
      placement_strategy = "center";

      cursor_shape = "block";
      cursor_beam_thickness = 10;

      confirm_os_window_close = 0;

      window_padding_width = 10;
    };
  };
}
