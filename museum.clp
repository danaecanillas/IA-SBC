;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------
;;
;;                PRACTICA 2 IA: SBC
;;
;; Alumnos: Dànae Canillas
;;          Miquel Escobar
;;          Arnau Soler
;;
;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------


;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------


;;; Inici de la solucio implementada

;;; ------------------------- Declaracio de moduls -----------------------------

;;; Modulo principal
(defmodule MAIN (export ?ALL))

;;; Modulo de recopilacio de los dades de l'usuari
(defmodule recopilacio-visita
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule recopilacio-prefs
	(import MAIN ?ALL)
	(import recopilacio-visita deftemplate ?ALL)
	(export ?ALL)
)
;;; Modulo de filtrado y procesado del contenido adequado al usuario
(defmodule processat
	(import MAIN ?ALL)
	(import recopilacio-visita deftemplate ?ALL)
	(import recopilacio-prefs deftemplate ?ALL)
	(export ?ALL)
)

;;; Modulo de generacion de soluciones
(defmodule generacio
	(import MAIN ?ALL)
	(export ?ALL)
)

;;; Modulo de presentacion de resultados
(defmodule presentacio
	(import MAIN ?ALL)
	(export ?ALL)
)
;;; -------------------------- Fi: Declaracio de moduls ------------------------

;;; ------------------------ Declaracio de missatges ---------------------------

(defmessage-handler MAIN::Quadre print ()
		(format t "Nom: %s %n" ?self:Nom)
	(printout t crlf)
		(format t "Autor: %s" (send ?self:Autor get-Nom))
	(printout t crlf)
		(format t "Tematica del quadre: %s" (send ?self:Tematica_quadre get-Nom_tematica))
	(printout t crlf)
		(format t "Epoca del quadre: %s" (send ?self:Epoca_quadre get-Nom_epoca))
	(printout t crlf)
		(format t "Estil del quadre: %s" (send ?self:Estil_quadre get-Nom_estil))
	(printout t crlf)
    (format t "Dimensions: %s" ?self:Dimensions)
	(printout t crlf)
		(format t "Rellevancia: %s" ?self:Rellevancia)
	(printout t crlf)
    (format t "Sala: %d" ?self:Sala)
	(printout t crlf)
)

(defmessage-handler MAIN::Recomanacio print ()
	(printout t "-----------------------------------" crlf)
	(printout t (send ?self:nom_quadre imprimir))
	(printout t crlf)
	(format t "Nivell de recomanacio: %d %n" ?self:score)
	(printout t "Justificacio: " crlf)
	(progn$ (?curr-just ?self:justificacions)
		(printout t ?curr-just crlf)
	)
	(printout t crlf)
	(printout t "-----------------------------------" crlf)
)

(defmessage-handler MAIN::Dia print ()
	(printout t "============================================" crlf)
	(bind $?recs ?self:recomanacions)
	(progn$ (?curr-rec $?recs)
		(printout t (send ?curr-rec print))
	)
	(printout t "============================================" crlf)
)
;;; ------------------------ Fin declaracion de messages -----------------------

;;; ------------------------ Declaracion de templates --------------------------
;;; Template para los datos socio-demograficos del usuario

(deftemplate MAIN::Visita
	(slot tipus (type STRING) (default "indefinit"))
	(slot dies (type INTEGER) (default -1))
	(slot hores (type DOUBLE) (default -1))
	(slot coneixement (type INTEGER) (default -1))
	(slot edat (type INTEGER) (default -1))
	(slot nacionalitat (type STRING) (default "indefinit"))
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencies_visita
	(multislot autors_preferits (type INSTANCE))
	(multislot tematiques_preferides (type INSTANCE))
	(multislot estils_preferits (type INSTANCE))
	(multislot epoques_preferides (type INSTANCE))
)

;;; Template para una llista de recomanacions sense ordre
(deftemplate MAIN::llista-rec-desordenada
	(multislot recomendaciones (type INSTANCE))
)

;;; Template para una llista de recomanacions amb ordre
(deftemplate MAIN::llista-rec-ordenada
	(multislot recomendaciones (type INSTANCE))
)

;;; Template para la lista de los dias de la recomendacion
(deftemplate MAIN::llista-dies
	(multislot dias (type INSTANCE))
)

;;; ------------------------ Fin declaracion de templates ----------------------

;;; ------------------------ Declaracion de funciones --------------------------

;;; Funcio per fer una pregunta amb respostes qualssevol
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?resposta (read))
	(while (not (lexemep ?resposta)) do
		(format t "%s " ?pregunta)
		(bind ?resposta (read))
    )
	?respuesta
)

;;; Funcio per fer una pregunta general amb una serie de respostes admitides
(deffunction MAIN::pregunta-opcions (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer)
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer)
          then (bind ?answer (lowcase ?answer))))
   ?answer
)

;;; Funcio per fer una pregunta amb resposta si/no
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE
       else FALSE)
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcio per fer una pregunta amb moltes opcions
(deffunction MAIN::pregunta-index (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles)
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica "Escull una opció:" 1 (length$ ?valores-posibles)))
	?respuesta
)

;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles)
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica els números separats per un espaci: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros)
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valores-posibles))))
            then
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        )
    )
    ?lista
)

;;; ----------------------- Fin declaracion de funciones -----------------------

;;; ----------------------- Declaracion de reglas y hechos ---------------------
(defrule MAIN::initialRule "Regla inicial"
	(declare (salience 10))
	=>
	(printout t " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  " crlf)
	(printout t "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌" crlf)
	(printout t " ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  " crlf)
	(printout t " ▄▄       ▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄       ▄▄  " crlf)
	(printout t "▐░░▌     ▐░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░▌     ▐░░▌" crlf)
	(printout t "▐░▌░▌   ▐░▐░▌▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌▐░▌░▌   ▐░▐░▌" crlf)
	(printout t "▐░▌▐░▌ ▐░▌▐░▌▐░▌       ▐░▌▐░▌          ▐░▌          ▐░▌       ▐░▌▐░▌▐░▌ ▐░▌▐░▌" crlf)
	(printout t "▐░▌ ▐░▐░▌ ▐░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌▐░▌ ▐░▐░▌ ▐░▌" crlf)
	(printout t "▐░▌  ▐░▌  ▐░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌" crlf)
	(printout t "▐░▌   ▀   ▐░▌▐░▌       ▐░▌ ▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌▐░▌   ▀   ▐░▌" crlf)
	(printout t "▐░▌       ▐░▌▐░▌       ▐░▌          ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌" crlf)
	(printout t "▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌ ▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌" crlf)
	(printout t "▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌" crlf)
	(printout t " ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  " crlf)
	(printout t " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  " crlf)
	(printout t "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌" crlf)
	(printout t " ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  " crlf)
  (printout t crlf)
	(printout t "Benvingut al nostre sistema de recomanació de visites! " crlf)
	(printout t "Si us plau contesteu les preguntes que venen a continuació per tal d'oferir-li un tour per el nostre museu." crlf)
	(printout t crlf)
	(focus recopilacio-visita)
)

;;; Modulo recopilacion

;;; ------------------- Fin declaracion de reglas ------------------------------
