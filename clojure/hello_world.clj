(ns hello-world)

(defn hello 
  "Says hello world to the specified name."
  ([]
  	(hello "World"))
  ([name]
  	(str "Hello, " name "!")))
