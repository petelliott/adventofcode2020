
(def solve)

(defn solve-mask [table andmask ormask mask idx]
  (cond
   (>= idx (- (count mask) 1)) (solve table andmask ormask)
   (= (nth mask idx) \X) (recur table (bit-or andmask (bit-shift-left 1 idx)) ormask mask (+ 1 idx))
   (= (nth mask idx) \1) (recur table andmask (bit-or ormask (bit-shift-left 1 idx)) mask (+ 1 idx))
   (= (nth mask idx) \0) (recur table andmask ormask mask (+ 1 idx))
   :else (println (list table andmask ormask mask idx (count mask)))))


(defn solve-set [table andmask ormask lhs rhs]
  (def addr (Integer. (re-find  #"\d+" lhs )))
  (def value (Integer. (re-find  #"\d+" rhs )))
  (solve (update table addr (fn [x] (bit-or (bit-and value andmask) ormask)))
         andmask ormask))

(defn solve [table andmask ormask]
  (def line (read-line))
  (if line
    (do
      (def split (clojure.string/split line #"="))
      (if (= (nth split 0) "mask ")
        (solve-mask table 0 0 (clojure.string/reverse (nth split 1)) 0)
        (solve-set table andmask ormask (nth split 0) (nth split 1))))
     (reduce + (map (fn [[k v]] v) table))))

(println (solve (hash-map) 0 0))