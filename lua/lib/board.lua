local function draw(board)
  for i, row in ipairs(board) do
    local function _1_()
      local str = ""
      for j, tile in ipairs(row) do
        str = (str .. " " .. tile)
      end
      return str
    end
    print(_1_())
  end
  return nil
end
local function check_col(board, index, turn)
  local won = true
  for i, row in ipairs(board) do
    local tile = row[index]
    won = (won and (turn == tile))
  end
  return won
end
local function check_row(board, index, turn)
  local won = true
  for i, tile in ipairs(board[index]) do
    won = (won and (turn == tile))
  end
  return won
end
return {draw = draw, ["check-row"] = check_row, ["check-col"] = check_col}
