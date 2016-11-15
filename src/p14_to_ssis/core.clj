(ns p14-to-ssis.core
  (:gen-class)
  (:import java.io.File)
  (:require [clojure.string :as str]))

(defn add-ssis [s]
  (str s "_ssis"))

(def nhead (slurp "cambios_para_ssis_solo_cabecera.sql"))
(def nfoot (slurp "cambios_para_ssis_solo_pie.sql"))

(defn clean-spn [s]
  (if (nil? s) nil (re-find #"(?i)[.](.*?)[(]" s)))

(defn get-spn [ms]
  (->> (re-find ms)
       (last)
       (clean-spn)
       (last)))

(defn replace-spn [in]
  (let [matcher-spn (re-matcher #"(?i)create\s+procedure\s+(.*?)\s+AS" in)]
    (loop [spn (get-spn matcher-spn) out in sl []]
    (if (nil? spn)
      {:out out :spns sl}
      (recur (get-spn matcher-spn)
             (str/replace out spn (add-ssis spn))
             (conj sl (add-ssis spn)))))))

(defn replace-lp [in]
  (str/replace in "@logpadre" "@p_id_carga"))

(defn get-head [mh]
  (->> (re-find mh)
       (first)))

(defn new-head [oh sl]
  (str/replace nhead "spxxx"
               (first (filter #(re-find (re-pattern %) oh) sl))))

(defn new-foot [of]
  (str/replace nfoot "spvarxxx"
               (if (re-find #"@rc" of) "@rc" "@@ROWCOUNT")))

(defn replace-head [m-in]
  (let [in (:out m-in)
        sl (:spns m-in)
        matcher-head (re-matcher
                      #"(?i)\s+as\s+begin\s([\s\S]*?)\sbegin\s+try" in)]
    (loop [head (get-head matcher-head) out in]
      (if (nil? head)
        out
        (recur (get-head matcher-head)
               (str/replace out head (new-head head sl)))))))

(defn get-foot [mf]
  (->> (re-find mf)
       (first)))

(defn replace-foot [in]
  (let
      [matcher-foot
       (re-matcher
        #"(?i)\t*exec\w*\s+dbn1_stg_dhyf.dbo.spn1_finalizar_log([\s\S]*?)\send\s+catch"
        in)]
    (loop [foot (get-foot matcher-foot) out in]
      (if (nil? foot)
        out
        (recur (get-foot matcher-foot)
               (str/replace out foot (new-foot foot)))))))

  (defn rep-all[in]
    (-> (replace-spn in)
        (replace-head)
        (replace-foot)
        (replace-lp)))

(defn process-file [td sf cnt]
  (spit (str (.getPath td) "/"
             (str/replace sf #".sql" "_ssis.sql"))
        (rep-all cnt)))

(defn proc-dir [d]
  (println "Procesando direcorio" d)
  (.mkdir (File. (str (.getPath (File. d)) "/_ssis/")))
  (let [td (File. (str (.getPath (File. d)) "/_ssis/"))]
    (doseq [f (.listFiles (File. d))]
      (if (= "sql" (last (re-find #"(?i)[.](.*)" (.getName f))))
        (let [sf (.getName f)]
          (println "Procesando fichero" sf)
          (process-file td sf (slurp f)))))))

(defn -main
  [d & args]
  (proc-dir d))
