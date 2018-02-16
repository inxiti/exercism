(ns phone-number)

(defn number
  "Returns the filtered phone number if it is valid."
  [n]
  (let [number (clojure.string/join (filter #(Character/isDigit %) n))
        length (count number)]
    (cond
      (== length 10) number
      (and (== length 11)
           (= (first number) \1)) (subs number 1)
      :else "0000000000")))

(defn area-code
  "Returns the area code of a phone number."
  [n]
  (subs (number n) 0 3))

(defn pretty-print
  "Pretty print the phone number."
  [n]
  (let [number (number n)]
    (format "(%s) %s-%s" (subs number 0 3) (subs number 3 6) (subs number 6))))
