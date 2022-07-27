{pkgs, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 40;
        collumns = 105;
      };

      window.padding = {
        x = 5;
        y = 6;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "mononoki Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "mononoki Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "mononoki Nerd Font Mono";
          style = "Italic";
        };
        size = 13;
      };

      colors = {
        primary.background = "#20201d";
        primary.foregorund = "#a6a28c";
                                                                                        

        normal = {
          black = "#20201d";
          red = "#d73737";
          green = "#60ac39";
          yellow = "#cfb017";
          blue = "#6684e1";
          magenta = "#b854d4";
          cyan = "#1fad83";
          white = "#cccccc";
        };

        bright = {
          black = "#7d7a68";
          red = "#d73737";
          green = "#60ac39";
          yellow = "#cfb017";
          blue = "#6684e1";
          magenta = "#b854d4";
          cyan = "#1fad83";
          white = "#cccccc";
        };
      };
    };
  };
}
