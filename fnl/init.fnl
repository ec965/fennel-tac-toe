(local board (require :lib.board))
(local play (require :lib.play))

(let [game (board.get-raw-board)]
  (-> game
      (board.draw)
      (play.set-tile :x)
      (board.draw)))
