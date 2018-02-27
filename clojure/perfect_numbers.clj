(ns perfect-numbers)

(defn proper-divisors
  "Get the proper divisors of a number."
  [n]
  (filter #(zero? (rem n %)) (range 1 n)))

(defn classify
  "Classifies a number as: perfect, deficient, or abundant."
  [n]
  (when (<= n 0)
    (throw (IllegalArgumentException. "Number must be greater than 0.")))
  (let [result (reduce + (proper-divisors n))]
    (cond
      (== result n) :perfect
      (<  result n) :deficient
      (>  result n) :abundant)))
