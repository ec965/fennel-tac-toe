local board = require("lib.board")
board.draw({{1, 2, 3}, {4, 5, 6}, {7, 8, 9}})
print("check row", board["check-row"]({{"x", "x", "o"}, {"x", "x", "x"}, {"x", "x", "o"}}, 2, "x"))
return print("check col", board["check-col"]({{"x", "x", "x"}, {"x", "x", "x"}, {"x", "x", "o"}}, 1, "o"))
