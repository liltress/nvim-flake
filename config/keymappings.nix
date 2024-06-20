{self, ...}: {
  keymaps = [
    # TODO cmd bindings
    # Telescope bindings
    {
      action = "<cmd>Telescope find_files<cr>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope git_commits<cr>";
      key = "<leader>gitc";
    }

  ];
}
