(ns bob
  (:require [clojure.string :as string]))

(defn response-for
  "Determines, and returns Bob's response in a conversation."
  [s]
  (let [fs (string/replace s #"[^a-zA-Z]" "")]
    (cond 
      (and (= s (string/upper-case s))
           (not (string/blank? fs))) "Whoa, chill out!"
      (string/blank? s) "Fine. Be that way!"
      (string/ends-with? s "?") "Sure."
      :else "Whatever.")))
