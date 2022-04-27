(fn set-tile [game peice]
  (let [new-tile (io.read)
        indecies (board.translate-tile new-tile)]
    (if (and (not= nil indecies) (= 2 (length indecies)))
        (let [row-i (. indecies 1)
              col-i (. indecies 2)]
          (tset (. game row-i) col-i peice))
        (do
          (print "Invalid tile, please try again.")
          (set-tile game peice))))
  game)

{: set-tile}
