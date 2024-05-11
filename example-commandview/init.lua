-- mod-version:3

local core = require "core"
local command = require "core.command"
local keymap = require "core.keymap"

-- Create file generation/filling function
local create_file = function (title, text)
  local f = io.open(system.absolute_path(".") .. "/" .. title, "w")
  f:write(text)
  f:close()
end

-- Create commandview definition
local main_function = function()
  core.command_view:enter("Choose file name", {
    submit = function(title)
      core.command_view:enter("Choose file content", {
        submit = function(text)
          create_file(title, text)
        end,
        suggest = function()
        	-- TODO
        end
      })
    end,
  })
end

-- Create command for file creation
command.add(nil, {
  ["commandview:create-file"] = function ()
    main_function()
  end
})

-- Create key binding
keymap.add {
  ["alt+p"] = "commandview:create-file"
}
