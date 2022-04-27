local board = require("lib.board")
local play = require("lib.play")
local game = board["get-raw-board"]()
return board.draw(play["set-tile"](board.draw(game), "x"))
