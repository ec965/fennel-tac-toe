(fn get-raw-board []
  [[:A :B :C] [:D :E :F] [:G :H :I]])

(fn translate-tile [find-tile]
  "translate a tile into it's board indecies [ row, col ]"
  (fn found [coord]
    (= 2 (length coord)))

  (accumulate [coord [] i row (ipairs (get-raw-board))]
    (if (found coord) coord (accumulate [coord [] j tile (ipairs row)]
                              (if (found coord) coord
                                  (= tile find-tile) [i j]
                                  [])))))

(fn draw [board]
  "draw the board to stdout"
  (each [i row (ipairs board)]
    (-> (accumulate [str "" j tile (ipairs row)]
          (.. str " " tile))
        (print)))
  board)

(fn check-col [board turn index]
  "check a column on a board for a win"
  (accumulate [won true i row (ipairs board)]
    (let [tile (. row index)]
      (and won (= turn tile)))))

(fn check-row [board turn index]
  "check a row on a board for a win"
  (accumulate [won true i tile (ipairs (. board index))]
    (and won (= turn tile))))

(fn check-tl-to-br [board turn]
  "check diagonal top left to bottom right"
  (accumulate [won true i row (ipairs board)]
    (let [tile (-> board (. i) (. i))]
      (and won (= turn tile)))))

(fn check-tr-to-bl [board turn]
  "check diagonal top right to bottom left"
  (accumulate [won true i row (ipairs board)]
    (let [row-index (- (length row) (- i 1))
          tile (-> board (. row-index) (. i))]
      (and won (= turn tile)))))

(fn check [board turn]
  "check an entire 3x3 board"
  (fn check-all-rows [board turn index]
    (if (= index 0) false
        (or (check-row board turn index)
            (check-all-rows board turn (- index 1)))))

  (fn check-all-cols [board turn index]
    (if (= index 0) false
        (or (check-col board turn index)
            (check-all-cols board turn (- index 1)))))

  (-> false (or (check-all-rows board turn (length board)))
      (or (check-all-cols board turn (length board)))
      (or (check-tr-to-bl board turn)) (or (check-tl-to-br board turn))))

{: draw
 : check-row
 : check-col
 : check-tl-to-br
 : check-tr-to-bl
 : check
 : get-raw-board
 : translate-tile}
