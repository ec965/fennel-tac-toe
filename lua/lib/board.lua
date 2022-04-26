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
local function check_col(board, turn, index)
  local won = true
  for i, row in ipairs(board) do
    local tile = row[index]
    won = (won and (turn == tile))
  end
  return won
end
local function check_row(board, turn, index)
  local won = true
  for i, tile in ipairs(board[index]) do
    won = (won and (turn == tile))
  end
  return won
end
local function check_tl_to_br(board, turn)
  local won = true
  for i, row in ipairs(board) do
    local tile = board[i][i]
    won = (won and (turn == tile))
  end
  return won
end
local function check_tr_to_bl(board, turn)
  local won = true
  for i, row in ipairs(board) do
    local row_index = (#row - (i - 1))
    local tile = board[row_index][i]
    won = (won and (turn == tile))
  end
  return won
end
return {draw = draw, ["check-row"] = check_row, ["check-col"] = check_col, ["check-tl-to-br"] = check_tl_to_br, ["check-tr-to-bl"] = check_tr_to_bl}
