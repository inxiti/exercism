(ns flatten-array
  (:refer-clojure :exclude [flatten]))

(defn flatten
  "Flattens a list, and removes all nils."
  [a]
  (filter some? (clojure.core/flatten a)))
