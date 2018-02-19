(ns complex-numbers)

(defn real
  "Returns the real number."
  [[a _]]
  a)

(defn imaginary
  "Returns the imaginary part."
  [[_ b]]
  b)

(defn abs
  "Returns the absolute value of the complex number."
  [[a b]]
  (Math/sqrt (+ (* a a) (* b b))))

(defn conjugate
  "Returns the conjugate of the complex number."
  [[a b]]
  [a (- b)])

(defn add
  "Adds two complex numbers."
  [[a b] [c d]]
  [(+ a c) (+ b d)])

(defn sub
  "Subtracts a complex number from another."
  [[a b] [c d]]
  [(- a c) (- b d)])

(defn mul
  "Multiplies two complex numbers."
  [[a b] [c d]]
  [(- (* a c) (* b d)) (+ (* a d) (* b c))])

(defn reciprocal
  "Returns the reciprocal of a complex number."
  [[a b]]
  (let [scale (+ (* a a) (* b b))]
    [(/ (double a) scale) (/ (- (double b)) scale)]))

(defn div
  "Divides a complex number by another."
  [[a b] [c d]]
  (let [multiplied (mul [a b] (reciprocal [c d]))]
    [(Double. (format "%g" (first multiplied))) (Double. (format "%g" (second multiplied)))]))

