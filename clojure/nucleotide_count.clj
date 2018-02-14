(ns nucleotide-count)

(defn count
  "Returns the amount of times `ch` appears in `s`."
  [ch s]
  (when-not (.contains [\A \T \C \G] ch) (throw IllegalArgumentException))
  (clojure.core/count (filter #(= ch %) s)))

(defn nucleotide-counts
  "Returns occurences of each nucleotide in a given DNA string."
  [s]
  (let [keys [\A \T \C \G]]
    (zipmap keys (map #(count % s) keys))))
