--* --------------------------------------------------------------- *--
--?                           chatgpt Setup                         ?--
--* --------------------------------------------------------------- *--

local Helpers = require("utils.helpers")

-- IMPORTANT: to leverage the chatgpt plugin you will need to provide a valid API key; see the README for more details
-- check if the env var `NVIM_ENABLE_GPT` is set to true; if so invoke the plugin's default setup, with a couple of overrides
if Helpers.to_boolean(os.getenv("NVIM_ENABLE_GPT")) == true then
  require("chatgpt").setup({
    chat = {
      question_sign = "󰆆",
      answer_sign = "󰯉",
      border_left_sign = "",
      border_right_sign = "",
    },
    popup_window = {
      border = {
        text = {
          top = "󰯉  ChatGPT 󰯉 ",
        },
      },
    },
    openai_params = {
      model = "gpt-3.5-turbo",
      max_tokens = 900,
    },
  })
end

