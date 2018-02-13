(ns collatz-conjecture)

(defn collatz
  "Return the amount of steps using the Collatz Conjecture to reach 1."
  ([n]
   (when (<= n 0)
     (throw (IllegalArgumentException. "Number must be greater than 0.")))
   (collatz n 0))

  ([n steps]
   (let [num (if (even? n)
               (/ n 2)
               (+ (* 3 n) 1))]
     (if (== 1 n)
       steps
       (recur num (inc steps))))))
