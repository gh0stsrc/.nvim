--* --------------------------------------------------------------- *--
--?                         nvim-notify Setup                       ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: nvim-notify is set as the default noftication mechanism for all plugins that use the vim.notify function (see core.lua for the override)

-- get the desired log level set by the `NVIM_LOG_LVL` environment variable, if not set the log lvl will default to `INFO`
local log_lvl_nm = string.upper(os.getenv("NVIM_LOG_LVL") or "INFO")

-- map of log level names to vim log levels
local log_lvl_map = {
  TRACE = vim.log.levels.TRACE,
  DEBUG = vim.log.levels.DEBUG,
  INFO  = vim.log.levels.INFO,
  WARN  = vim.log.levels.WARN,
  ERROR = vim.log.levels.ERROR,
  OFF   = vim.log.levels.OFF
}

-- load notify as a telescope extension
require("telescope").load_extension("notify")

-- configure the notify plugin
require("notify").setup({
    level = log_lvl_map[log_lvl_nm],
    icons = {
      ERROR   = "󰚌 ",
      WARN    = "󱡝 ",
      INFO    = "󰇥 ",
      DEBUG   = "󰻕 ",
      TRACE   = "󰛤 ",
  }
})

