(ns binary-search)

(defn middle
  "Returns the middle index for the list."
  [l]
  (quot (count l) 2))

(defn search-for
  "Returns the index of the number within the list."
  [n l]
  (loop [start 0
         end   (count l)]
    (let [position (+ start (quot (- end start) 2))]
      (cond (>= position (count l)) (throw (Exception. "Number not found in list."))
            (== (nth l position) n) position
            (<  (nth l position) n) (recur (inc position) end)
            :else                   (recur start position)))))
