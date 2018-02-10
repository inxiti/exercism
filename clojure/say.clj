(ns say
  (:require [clojure.string :as string]))

(defn convert-number
  "Converts a number to its written out representation."
  [n]
  (let [tens {2 "twenty" 3 "thirty" 4 "forty" 5 "fifty" 6 "sixty" 7 "seventy" 8 "eighty"
              9 "ninety"}
        one-through-twenty {0 "" 1 "one" 2 "two" 3 "three" 4 "four" 5 "five" 6 "six" 7 "seven"
                            8 "eight" 9 "nine" 10 "ten" 11 "eleven" 12 "twelve" 13 "thirteen"
                            14 "fourteen" 15 "fifteen" 16 "sixteen" 17 "seventeen" 18 "eighteen"
                            19 "nineteen"}]
    (loop [num n acc "" more-than 100000000000]
      (let [digits   (count (str more-than))
            mapping  (if (or (== digits 11) (== digits 8) (== digits 5) (== digits 2)) tens
                         one-through-twenty)
            position (cond (or (== digits 11) (== digits 8) (== digits 5)) "%s %s-"
                           (< num 20)                  "%s-%s"
                           (== more-than 100000000000) "%s %s hundred" 
                           (== more-than   1000000000) "%s %s billion"
                           (== more-than    100000000) "%s %s hundred"
                           (== more-than      1000000) "%s %s million"
                           (== more-than       100000) "%s %s hundred"
                           (== more-than         1000) "%s %s thousand"
                           (== more-than          100) "%s %s hundred"
                           (>= num 20) "%s %s")]
        (cond
          (== num 0) acc
          (< num 20) (format position acc (get one-through-twenty num))
          (>= num more-than)
            (recur
              (bigint (Math/floor (mod num more-than)))
              (format position acc (get mapping (bigint (Math/floor (/ num more-than)))))
              (bigint (/ more-than 10)))
          (< num more-than) (recur num acc (bigint (/ more-than 10)))
          :else acc)))))

(defn number
  "Converts a number to its written out representation, and prepares it for presentation."
  [n]
  (when (or (< n 0) (>= n 1000000000000))
    (throw (IllegalArgumentException. "Invalid number, 0-999999999999 only.")))
  (if (== n 0)
    "zero"
    (-> (convert-number n)
        (string/trim)
        (string/replace #"^-" "")
        (string/replace #"- " "-"))))



