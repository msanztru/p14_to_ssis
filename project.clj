(defproject p14_to_ssis "1.0"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.7.0"]]
  :main ^:skip-aot p14-to-ssis.core
  :uberjar-name "p14_to_ssis.jar"
  :target-path "target/%s"
  :omit-source true
  :profiles {:uberjar {:aot :all}}
  )
