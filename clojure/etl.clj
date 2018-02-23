(ns etl
  (:require [clojure.string :refer [lower-case]]))

(defn transform
  "Transforms the old data format to the new one."
  [m]
  (into {} (map #(zipmap (map lower-case (second %)) (repeat (first %))) m)))
