(ns anagram
  (:require [clojure.string :as string]))

(defn is-anagram?
  [w x]
  (if (and (= (sort (string/lower-case w)) (sort (string/lower-case x)))
           (= (count (filter #(Character/isUpperCase %) w))
              (count (filter #(Character/isUpperCase %) x)))
           (not= w x))
    x []))

(defn anagrams-for
  [w & ws]
  (let [words    (nth ws 0)
        anagrams (map #(is-anagram? w %) words)
        filtered (filter #(not (empty? %)) anagrams)]
    filtered))

