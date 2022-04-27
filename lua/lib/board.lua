local function get_raw_board()
  return {{"A", "B", "C"}, {"D", "E", "F"}, {"G", "H", "I"}}
end
local function translate_tile(find_tile)
  local function found(coord)
    return (2 == #coord)
  end
  local coord = {}
  for i, row in ipairs(get_raw_board()) do
    if found(coord) then
      coord = coord
    else
      local coord0 = {}
      for j, tile in ipairs(row) do
        if found(coord0) then
          coord0 = coord0
        elseif (tile == find_tile) then
          coord0 = {i, j}
        else
          coord0 = {}
        end
      end
      coord = coord0
    end
  end
  return coord
end
local function draw(board)
  for i, row in ipairs(board) do
    local function _3_()
      local str = ""
      for j, tile in ipairs(row) do
        str = (str .. " " .. tile)
      end
      return str
    end
    print(_3_())
  end
  return board
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
local function check(board, turn)
  local function check_all_rows(board0, turn0, index)
    if (index == 0) then
      return false
    else
      return (check_row(board0, turn0, index) or check_all_rows(board0, turn0, (index - 1)))
    end
  end
  local function check_all_cols(board0, turn0, index)
    if (index == 0) then
      return false
    else
      return (check_col(board0, turn0, index) or check_all_cols(board0, turn0, (index - 1)))
    end
  end
  return ((((false or check_all_rows(board, turn, #board)) or check_all_cols(board, turn, #board)) or check_tr_to_bl(board, turn)) or check_tl_to_br(board, turn))
end
return {draw = draw, ["check-row"] = check_row, ["check-col"] = check_col, ["check-tl-to-br"] = check_tl_to_br, ["check-tr-to-bl"] = check_tr_to_bl, check = check, ["get-raw-board"] = get_raw_board, ["translate-tile"] = translate_tile}
