(fn draw [board]
  (each [i row (ipairs board)]
    (-> (accumulate [str "" j tile (ipairs row)]
          (.. str " " tile))
        (print))))

(fn check-col [board turn index]
  (accumulate [won true i row (ipairs board)]
    (let [tile (. row index)]
      (and won (= turn tile)))))

(fn check-row [board turn index]
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
          tile (-> board (. row-index (. i)))]
      (and won (= turn tile)))))

{: draw : check-row : check-col : check-tl-to-br : check-tr-to-bl}
