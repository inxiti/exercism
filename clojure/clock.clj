(ns clock)

(defn clock->string
  [m]
  (format "%02d:%02d" (quot m 60) (mod m 60)))

(defn clock
  [h m]
  (mod (+ (* h 60) m) 1440))

(defn add-time
  [c m]
  (clock 0 (+ c m)))
