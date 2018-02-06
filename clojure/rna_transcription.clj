(ns rna-transcription)

(defn convert
  "Transcribe DNA nucleotide to RNA complement."
  [n]
  (case n
    \G "C"
    \C "G"
    \T "A"
    \A "U"
    (throw (AssertionError.))))

(defn to-rna
  "Given a DNA strand, return its RNA complement."
  [[first & rest]]
  (if (some? rest)
    (str (convert first) (to-rna rest))
    (convert first)))
