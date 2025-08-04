local git_status_items = function()
  local edit_file = function(modifier, file)
    vim.cmd("e " .. file)
  end

  local status = vim.fn.systemlist("git status -s")

  items = {}
  limit = 6
  for _, line in ipairs(status) do
    if limit == 0 then
      break
    end

    local modifier = ""
    local file = ""
    local parts = vim.split(line, " ")

    if #parts == 2 then
      modifier = parts[1]
      file = parts[2]
    elseif #parts == 3 then
      modifier = parts[2]
      file = parts[3]
    end

    -- no need to display deleted file for opening.
    if modifier == "D" then
      goto continue
    end

    table.insert(items, {
      {
        section = "Git Status (limit 6)",
        name = line,
        action = function()
          edit_file(modifier, file)
        end,
      },
    })

    limit = limit - 1
    ::continue::
  end

  return items
end

return {
  "echasnovski/mini.starter",
  dependencies = {
    "echasnovski/mini.nvim"
  },
  config = function()
    local starter = require("mini.starter")

    local new_section = function(name, action, section)
      return { name = name, action = action, section = section }
    end

    starter.setup({
      content_hooks = {
        starter.gen_hook.adding_bullet("░ ", true),
        starter.gen_hook.aligning("center", "center"),
      },
      header = table.concat({
        [[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
        [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
        [[/ /\  /  __/ (_) \ V /| | | | | | |]],
        [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
        [[───────────────────────────────────]],
      }, "\n"),
      query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
      items = {
        function()
          if require("auto-session").session_exists_for_cwd() then
            return { section = "Sessions", name = "Restore last session", action = [[SessionRestore]] }
          end
        end,
        function()
          if require("auto-session").session_exists_for_cwd() then
            return { section = "Sessions", name = "Delete last session", action = [[SessionDelete]] }
          end
        end,

        starter.sections.recent_files(6, true),
        starter.sections.recent_files(6, false),
        git_status_items(),
        starter.sections.builtin_actions(),
      },
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        starter.config.footer = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(starter.refresh)
      end,
    })
  end,
}
