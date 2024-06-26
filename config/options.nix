{self, ...}: {
  config.opts = {
    # TODO clipboard support
    # line numbers
    number = true;
    relativenumber = true;
    # always show sign column
    signcolumn = "yes";
    autoindent = true;
    # tab defaults
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;
    # hightlight current line
    cursorline = true;    
    # start scholling this many lines away from the eduge
    scrolloff = 5;
    # clipboard (add xlip)
    clipboard = "unnamedplus";
  };
}
