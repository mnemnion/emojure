(ns emojure.core
  (:use     [clojure.repl]
   :use     [clojure.set]
            ))

     
(def demoji { '👀 'read
              '👓 'load-string   
              '🌀 'reduce
              '🌍 'map
              '💬 'println
              '🚥 'seq  
              '🔄 'eval
              '🎲 'rand-int
              '📂 'slurp
              '💾 'spit
              '🚗 'first
              '🚋 'rest  ;my other car is a cdr
               })



(defn remojify
	"returns a map from symbols to their associated emojure"
	[😃]
	(clojure.set/map-invert 😃))

(def remoji (remojify demoji))

          
(defn- def-deref [x y]
  (eval `(def  ~x ~y)))  

(map def-deref (seq (keys demoji)) (seq (vals demoji)))
                                              

                                                 


                    
