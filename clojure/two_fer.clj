(ns two-fer)

(defn two-fer
  "One for `name`, and one for me."
  ([] (two-fer "you"))
  ([name] (str "One for " name ", one for me.")))
