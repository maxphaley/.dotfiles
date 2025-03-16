return {
  {
    'ibhagwan/fzf-lua',
    opts = {
      files = {
        cwd_prompt = false,
        actions = {
          ["ctrl-h"] = { fn = function(_,o) require('fzf-lua.actions').toggle_ignore(_,o) end }
        }
      },
      grep = {
        hidden = true,
        actions = {
          ["ctrl-h"] = { fn = function(_,o) require('fzf-lua.actions').toggle_ignore(_,o) end }
        }
      },
      oldfiles = {
        stat_file = true
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100
        }
      }
    },
  },
}
