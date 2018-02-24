(ns sublist
  (:require [clojure.set :refer [subset? superset?]]))

(defn classify
  "Classifies list 1 in relation to list 2."
  [l1 l2]
  (cond
    (= l1 l2) :equal
    (subset? l1 l2) :sublist
    (superset? l1 l2) :superlist
    :else :unequal))
