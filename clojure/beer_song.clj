(ns beer-song
  (:require [clojure.string :as string]))

(defn verse
  "Returns the nth verse of the song."
  [n]
  (let [bottles (str n (if (== n 1) " bottle" " bottles"))
        removed (if (== n 1) "it" "one")
        bottles-left (condp == n 1 "no more bottles" 2 "1 bottle" (str (- n 1) " bottles"))]
    (if (== n 0)
      (str "No more bottles of beer on the wall, no more bottles of beer.\n"
           "Go to the store and buy some more, 99 bottles of beer on the wall.\n")
      (str bottles " of beer on the wall, " bottles " of beer.\n"
           "Take " removed " down and pass it around, " bottles-left " of beer on the wall.\n"))))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end] (string/join "\n" (map verse (range start (- end 1) -1)))))
