local function set_tile(game, peice)
  do
    local new_tile = io.read()
    local indecies = board["translate-tile"](new_tile)
    if ((nil ~= indecies) and (2 == #indecies)) then
      local row_i = indecies[1]
      local col_i = indecies[2]
      game[row_i][col_i] = peice
    else
      print("Invalid tile, please try again.")
      set_tile(game, peice)
    end
  end
  return game
end
return {["set-tile"] = set_tile}
