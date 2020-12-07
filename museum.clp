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
(defmodule dades-visita
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule dades-preferencies
	(import MAIN ?ALL)
	(import dades-visita deftemplate ?ALL)
	(export ?ALL)
)
;;; Modulo de filtrado y procesado del contenido adequado al usuario
(defmodule processat
	(import MAIN ?ALL)
	(import dades-visita deftemplate ?ALL)
	(import dades-preferencies deftemplate ?ALL)
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
    (format t "%s" "Indica els números separats per un espai: ")
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

;;; Modul de recopilacio d'informació

(defrule dades-visita::definicio_tipus "Tipus de Visita"
	(not (Visita))
	=>
	(bind ?t (pregunta-numerica "Quanta gent sou? " 1 50))
    (if (= ?t 1) then (bind ?tipus "Individu"))
    (if (= ?t 2) then (bind ?tipus "Parella"))
    (if (and(> ?t 2) (< ?d 11)) then (bind ?tipus "Grup petit"))
    (if (> ?t 10) then (bind ?tipus "Grup gran"))
	(assert (Visita (tipus ?tipus)))
)

(defrule dades-visita::definicio_dies "Dies de la visita"
	?d <- (Visita (dies ?dies))
    (test (< ?dies 0))
		(test (> ?dies 15))
	=>
	(bind ?dies (pregunta-numerica "Quants dies durara la vostra visita?" 1 14))
	(modify ?e (dies ?dies))
)

(defrule dades-visita::definicio_hores "Hores de la visita"
	?h <- (Visita (hores ?hores))
    (test (< ?hores 0))
		(test (> ?hores 9))
    =>
    (bind ?hores (pregunta-numerica "Durant quantes hores diaries vol planificar la visita?" 1 8))
	(modify ?h (hores ?hores))
)

(defrule dades-visita::definicio_coneixement "Grau de coneixement de l'art"
    ?c <- (Visita (coneixement ?coneixement))
    (test( < ?coneixement 0))
	=>
  (bind ?score 0)

	(bind ?var (create$ "Si" "No"))
	(bind ?resposta (pregunta-index "Acostuma a visitar museus?" ?var))
		(if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

  (bind ?var (create$ "Si" "No"))
	(bind ?resposta (pregunta-index "Ha cursat estudis d'art?" ?var))
		(if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

  (bind ?var (create$ "Si" "No"))
	(bind ?resposta (pregunta-index "Es dedica professionalment a l'art?" ?var))
		(if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

	(bind ?var (create$ "Una plaça de toros" "Un bombardeig"))
	(bind ?resposta (pregunta-index "¿Qué representa el quadre de Guérnica de Pablo Picasso?" ?var))
		(if (= ?respota 2) then (bind ?score (+ 1 ?score)))

  (bind ?var (create$ "Impressionisme" "Surrealisme" "Dadaisme" "K-Pop"))
	(bind ?resposta (pregunta-index "Claude Monet va ser un pintor francès i és un dels creadors d'aquest moviment artístic:" ?var))
		(if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

  (bind ?var (create$ "Risto Mejide" "Zaha Hadid" "Diego Velazquez" "Frank O. Gehry"))
	(bind ?resposta (pregunta-index "El Museu Guggenheim Bilbao és un lloc dedicat a l'art contemporani dissenyat per:" ?var))
		(if (= ?resposta 4) then (bind ?score (+ 1 ?score)))

  (bind ?var (create$ "AC DC" "Alfa i omega"))
	(bind ?resposta (pregunta-index "En l'art medieval ¿quines dues lletres s'associen a Crist?" ?var))
		(if (= ?resposta 2) then (bind ?score (+ 1 ?score)))

	(bind ?var (create$ "Sandro Botticelli" "Papa Francesc" "Miguel Àngel" "Pinturillo"))
	(bind ?resposta (pregunta-index "El Judici Final o El Judici Universal és un mural realitzat a la fresca que es troba a la Capella Sixtina i va ser pintat per:" ?var))
		(if (= ?resposta 3) then (bind ?score (+ 1 ?score)))

	(bind ?var (create$ "El Moulin de la Galette" "Razzmatazz" "El Parc de la Ciutadella"))
	(bind ?resposta (pregunta-index "Cap a l'any 1900 els artistes bohemis es trobaven al barri de Montmartre (París). Quin era l'espai d'esbarjo que acostumaven a freqüentar?" ?var))
		(if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

	(bind ?var (create$ "Ratafia" "Absenta" "carajillo" "Vodka Naranja"))
	(bind ?resposta (pregunta-index "Moltes obres d'inicis de segle XX mostren personatges amb la mirada perduda i en estat d'embriaguesa. Quina beguda provocava aquests efectes?" ?var))
		(if (= ?resposta 2) then (bind ?score (+ 1 ?score)))

  (modify ?c (coneixement ?score))
)

(defrule dades-visita::definicio_edat "Edat mitjana de la Visita"
	?e <- (Visita (edat ?edat))
	(test (< ?edat 0))
	(test (> ?edat 121))
	=>
	(bind ?edat (pregunta-numerica "Indiqui l'edat mitjana de la visita " 1 120))
	(modify ?e (edat ?edat))
)

(defrule dades-visita::definicio_nacionalitat "Nacionalitat de la Visita"
	(not (Visita))
	=>
	(bind ?nacionalitat (pregunta-general "Quina es la vostra nacionalitat?" ))
	(modify ?n (nacionalitat ?nacionalitat))
)


(defrule dades-visita::passar-a-preferencies "Passem al modul de recopilacio de preferencies"
    (declare (salience 10))
				?g <- (Visita (tipus ~"indefinit")(edat ?edat) (dies ?dies) (hores ?hores) (coneixement ?coneixement) (nacionalitat ~"indefinit"))
    (test (> ?edat -1))
    (test (> ?dies -1))
    (test (> ?hores -1))
    (test (> ?coneixement -1))
		=>
		(focus preferencies-visita)
)

(deffacts dades-preferencies::fets-inicials "Establim fets per poder recopilar informacio"
    (autors_preferits ask)
    (tematiques_preferides ask)
    (estils_preferits ask)
		(epoques_preferides ask)
    (preferencies_visita )
)

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; Definir:
;; - autors_preferits
;; - tematiques_preferides
;; - estils_preferits
;; - epoques_preferides
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(defrule dades-preferencies::passar_processat "Passem al modul de processament de les dades"
	(declare (salience -1))
	?h1 <- (autors_preferits TRUE|FALSE)
	?h2 <- (tematiques_preferides TRUE|FALSE)
	?h3 <- (estils_preferits TRUE|FALSE)
	?h4 <- (epoques_preferides TRUE|FALSE)
	=>
	(focus processat)
    (printout t "Processant les dades obtingudes..." crlf)
)
;;; ------------------- Fin declaracion de reglas ------------------------------
