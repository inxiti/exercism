(ns run-length-encoding
  (:use [clojure.string :only [blank? join]]))

(defn encode
  "Return amount|letter if `n` is greater than 1, otherwise returns the letter."
  [a l]
  (if (> a 1) (str a l) l))

(defn decode
  "Decodes an amount|letter, or letter coding."
  [[m & gs]]
  (let [amount (if (blank? (first gs)) 0 (Integer/parseInt (first gs)))
        letter (second gs)]
    (if (> amount 0) (join (repeat amount letter)) (str letter))))

(defn run-length-encode
  "Encodes a string with run-length-encoding."
  [s]
  (join (for [m (re-seq #"(\s|\w)\1*" s)] (encode (count (first m)) (last m)))))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [s]
  (join (for [m (re-seq #"(\d*)(\s|\w)" s)] (decode m))))
