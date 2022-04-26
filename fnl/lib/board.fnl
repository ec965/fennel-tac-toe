(fn draw [board]
  (each [i row (ipairs board)]
    (-> (accumulate [str "" j tile (ipairs row)]
          (.. str " " tile))
        (print))))

(fn check-col [board index turn]
  (accumulate [won true i row (ipairs board)]
    (let [tile (. row index)]
      (and won (= turn tile)))))

(fn check-row [board index turn]
  (accumulate [won true i tile (ipairs (. board index))]
    (and won (= turn tile))))

{: draw : check-row : check-col}
