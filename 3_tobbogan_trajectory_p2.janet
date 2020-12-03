(defn read-input
  [array]
  (def line (getline))
  (if (deep= line @"")
    array
    (read-input (array/push array line))))

(defn count-trees
  [array trees x y dx dy width]
  (if (>= y (length array))
    trees
    (count-trees
      array
      (if (= (get (get array y) x) 35)
        (+ trees 1)
        trees)
      (mod (+ x dx) width) (+ y dy) dx dy width)))

(def input (read-input @[]))
(def width (- (length (get input 0)) 1))

(print (* (count-trees input 0 0 0 1 1 width)
          (count-trees input 0 0 0 3 1 width)
          (count-trees input 0 0 0 5 1 width)
          (count-trees input 0 0 0 7 1 width)
          (count-trees input 0 0 0 1 2 width)))
