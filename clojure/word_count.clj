(ns word-count
  (:require [clojure.string :as string]))

(defn word-count
  "Count the occurences of each word in string."
  [w]
  (-> w
      (string/lower-case)
      (string/replace #"[^a-zA-Z0-9 ]" "")
      (string/split #"\s+")
      (frequencies)))
