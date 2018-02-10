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
            ds       (some (partial == digits) [11, 8, 5, 2])
            mapping  (if ds tens one-through-twenty)
            fmt      "%s %s"
            position (cond
                       ds                          (str fmt "-")
                       (<  num 20)                 "%s-%s"
                       (== more-than 100000000000) (str fmt " hundred")
                       (== more-than   1000000000) (str fmt " billion")
                       (== more-than    100000000) (str fmt " hundred")
                       (== more-than      1000000) (str fmt " million")
                       (== more-than       100000) (str fmt " hundred")
                       (== more-than         1000) (str fmt " thousand")
                       (== more-than          100) (str fmt " hundred")
                       :else                       fmt)]
        (cond
          (== num  0) acc
          (<  num 20) (format position acc (get one-through-twenty num))
          (>= num more-than)
          (recur (bigint (Math/floor (mod num more-than)))
                 (format position acc (get mapping (bigint (Math/floor (/ num more-than)))))
                 (bigint (/ more-than 10)))
          :else (recur num acc (bigint (/ more-than 10))))))))

(defn number
  "Converts a number to its written out representation, and prepares it for presentation."
  [n]
  (when (or
         (<  n 0)
         (>= n 1000000000000))
    (throw (IllegalArgumentException. "Number must be >= 0 and < 1000000000000.")))
  (if (== n 0)
    "zero"
    (-> (convert-number n)
        (string/trim)
        (string/replace #"(^-|-$)" "")
        (string/replace #"(-\s|-)+" "-"))))
