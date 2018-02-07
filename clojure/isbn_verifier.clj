(ns isbn-verifier
  (:require [clojure.string :as string]))

(defn isbn?
  "Check if a given ISBN-10 is valid."
  [isbn]
  (if (string/includes? (subs (string/reverse isbn) 1) "X")
    false
    (let [lst     (string/split isbn #"")
          valid   (filter #(string/includes? "0123456789X" (str %)) lst)
          isbn'   (map #(Integer/parseInt %) (replace {"X" "10"} valid))
          r       (range 0 (count isbn'))
          result  (mod (reduce + (for [i r] (* (nth isbn' i) (- 10 i)))) 11)]
      (== result 0))))
