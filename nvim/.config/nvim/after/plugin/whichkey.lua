local wk = require("which-key")
wk.register({
  f = { name = "find" },
  c = { name = "code actions" },
  p = { name = "project" },
  s = { name = "symbols" },
  g = { name = "git" },
  v = { name = "view" },
}, { prefix = "<leader>" })
