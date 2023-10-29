--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                                    Logging Functions                                                     ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- define a table to represent the module
local M = {}
-- import async version the notify for use
local notify = require("notify").async

-- IMPORTANT: the logging functions below need to be called using plenary's async module (e.g. async.run)

-- log message using he INFO log level 
function M.log(msg, lvl)
  notify(msg, lvl, {title = "neotuesz"}).events.close()
end

-- log message using he `TRACE` log level 
function M.trace(msg)
  notify(msg, vim.log.levels.TRACE, {title = "neotuesz"}).events.close()
end

-- log message using he `DEBUG` log level 
function M.debug(msg)
  notify(msg, vim.log.levels.DEBUG, {title = "neotuesz"}).events.close()
end

-- log message using he `INFO` log level 
function M.info(msg)
  notify(msg, vim.log.levels.INFO, {title = "neotuesz"}).events.close()
end

-- log message using he `WARN` log level 
function M.warn(msg)
  notify(msg, vim.log.levels.WARN, {title = "neotuesz"}).events.close()
end

-- log message using he `ERROR` log level 
function M.error(msg)
  notify(msg, vim.log.levels.ERROR, {title = "neotuesz"}).events.close()
end

-- return module as a table
return M

