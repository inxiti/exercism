(ns armstrong-numbers)

(defn armstrong?
  "Checks if the given number `x` is an armstrong number."
  [x]
  (let [coll (map #(Character/getNumericValue %) (str x))
        size (count coll)]
  (->> coll
       (map #(Math/pow % size))
       (reduce +)
       (== x))))
