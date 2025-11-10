return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    cmd = 'CopilotChat',
    opts = function()
      local user = vim.env.USER or 'User'
      user = user:sub(1, 1):upper() .. user:sub(2)
      local default_mappings = {
        complete = {
          insert = '<C-y>',
          callback = function()
            require('CopilotChat.completion').complete()
          end,
        },
        close = {
          insert = '<C-x>',
        },
        reset = {
          normal = '<leader>ar',
          insert = '',
        },
      }
      return {
        model = 'gpt-5',
        auto_insert_mode = false,
        window = {
          width = 0.35,
        },
        headers = {
          user = '  You',
          assistant = '  Copilot',
          tool = '🔧 Tool',
        },
        mappings = default_mappings,
      }
    end,
    keys = {
      { '<c-s>', '<CR>', ft = 'copilot-chat', desc = 'Submit Prompt', remap = true },
      { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
      {
        '<leader>aa',
        function()
          return require('CopilotChat').toggle()
        end,
        desc = 'Toggle (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ax',
        function()
          return require('CopilotChat').reset()
        end,
        desc = 'Clear (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>aq',
        function()
          vim.ui.input({
            prompt = 'Quick Chat: ',
          }, function(input)
            if input ~= '' then
              require('CopilotChat').ask(input)
            end
          end)
        end,
        desc = 'Quick Chat (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ap',
        function()
          require('CopilotChat').select_prompt()
        end,
        desc = 'Prompt Actions (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>as',
        function()
          require('CopilotChat').save()
        end,
        desc = 'Save chat (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>al',
        function()
          require('CopilotChat').load()
        end,
        desc = 'Load chat (CopilotChat)',
        mode = { 'n', 'v' },
      },
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'

      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-chat',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
}
