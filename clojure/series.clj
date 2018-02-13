(ns series)

(defn slices
  "Output all the contiguous substrings of length `n` in the string."
  [s n]
  (if (== n 0)
    [""]
    (map #(apply str %) (partition n 1 s))))
