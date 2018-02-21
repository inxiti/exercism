(ns leap)

(defn leap-year?
  "Checks if the year is a leap year."
  [y]
  (or (zero? (mod y 400))
      (and (zero? (mod y 4))
           (not= (mod y 100) 0))))
