{pkgs, ...}:
{
  services.dunst.enable = true;
  services.dunst.settings = {
    global = {
      monitor = 0;
      follow = "mouse";
      geometry = "250x50-24+24";
      indicate_hidden = "yes";
      shrink = "no";
      separator_height = 0;
      padding = 16;
      horizontal_padding = 24;
      frame_width = 3;
      sort = "no";
      idle_threshold = 120;
      font = "Mononoki Nerd Font:style=Regular:size=13";
      line_height = 4;
      markup = "full";
      format = "<b>%s</b>\n%b";
      alignment = "center";
      show_age_threshold = 60;
      word_wrap = "yes";
      ignore_newline = "no";
      stack_duplicates = false;
      hide_duplicate_count = "yes";
      show_indicators = "no";
      icon_position = "off";
      sticky_history = "yes";
      history_length = 20;
      browser = "/usr/bin/firefox -new-tab";
      always_run_script = true;
      title = "Dunst";
      class = "Dunst";
    };

    urgency_low = {
      background = "#303030";
      foreground = "#d8dee8";
      frame_color = "#D3DBE6";
      timeout = 2;
    };

    urgency_normal = {
      background = "#2f343f";
      foreground = "#d8dee8";
      frame_color = "#D3DBE6";
      timeout = 4;
    };

    urgency_critical = {
    };
  };
}
