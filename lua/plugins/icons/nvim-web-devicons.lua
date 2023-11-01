--* --------------------------------------------------------------- *--
--?                      nvim-web-devicons Setup                    ?--
--* --------------------------------------------------------------- *--

--* override icons based on the Patch Ubuntu Nerd Font that is installed (PREREQUISITE)
require("nvim-web-devicons").setup({
  override = {
    go = {
        icon = "󰟓"
      },
      md = {
      icon = "󰽛"
    },
    python = {
        icon = "󰌠"
    },
      rs = {
        icon = ""
    },
    tf = {
      icon = "󱁢"
    },
    tfvars = {
      icon = "󱁢"
    },
    ts = {
        icon = "󰛦"
    },
    lua = {
        icon = "󰢱"
    },
    yaml = {
        icon = ""
    },
    license = {
        icon = "󰿃"
    },
    makefile = {
        icon = "󰛕"
    },
  };

  override_by_filename = {
    [".gitignore"] = {
      icon = "󰊢"
    },
    [".gitconfig"] = {
      icon = "󰊢"
    },
    [".gitcommit"] = {
      icon = "󰊢"
    },
    [".gitattributes"] = {
      icon = "󰊢"
    },
    [".bashrc"] = {
      icon = ""
    },
    [".bash_profile"] = {
      icon = ""
    },
  };

  override_by_extension = {
    ["sh"] = {
      icon = ""
    },
    ["git"] = {
        icon = "󰊢"
      },
    ["Dockerfile"] = {
        icon = ""
      },
  };
})

