-- mod-version:3 -- lite-xl 2.1

local core = require "core"
local command = require "core.command"
local keymap = require "core.keymap"
local config = require "core.config"
local common = require "core.common"
local style = require "core.style"
local View = require "core.view"

local tasksview = common.merge({
  drawer_size = 100
}, config.plugins.tasksview)

local TasksView = View:extend()

function TasksView:new()
  TasksView.super.new(self)
end


