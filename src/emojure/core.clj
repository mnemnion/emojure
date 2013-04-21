(ns emojure.core
  (:use     [clojure.repl]
   :use     [clojure.set]
            ))

(def ^{:doc "map"} 🌍 map)

(def ^{:doc "reduce"} 🌀 reduce)

(def ^{:doc "println"} 💬 println)

(def ^{:doc "read"} 👀 read)

(def ^{:doc "seq"} 🚥 seq) 

(def ^{:doc "eval"} 🔄 eval)

(def ^{:doc "rand-int"} 🎲 rand-int)

(def 💭 :foo)
 
(def 💍 :foo)

(def 👉 :apply)

     
(def demoji { 👀 read
              🌀 reduce
              🌍 map
              💬 println
              🚥 seq  
              🔄 eval
              🎲 rand-int
               })



(defn remojify
	"returns a map from symbols to their associated emojure"
	[😃]
	(clojure.set/map-invert 😃))

(def remoji (remojify demoji))

