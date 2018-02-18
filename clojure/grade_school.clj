(ns grade-school)

(defn grade
  "Returns a vector of students in the grade."
  [db g]
  (db g []))

(defn add
  "Adds a student to a grade."
  ([db n g]
   (merge db {g (conj (grade db g) n)})))

(defn sorted
  "Returns a map sorted by grades, and students."
  [db]
  (->> db
       (map (fn [[k v]] {k (sort v)}))
       (into (sorted-map))))
