(ns robot-name)

(defn generate-name
  "Generates a unique name for the robot."
  []
  (let [letters (apply str (repeatedly 2 #(char (+ (rand-int 26) 65))))
        number (rand-int 1000)]
    (format "%s%03d" letters number)))

(defn robot
  "Creates a robot, and names it."
  []
  (atom {:original-name (generate-name)}))

(defn robot-name
  "Returns the name of the robot."
  [r]
  (:original-name @r))

(defn reset-name
  "Resets the name of the robot."
  [r]
  (swap! r assoc :original-name (generate-name)))
