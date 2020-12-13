; AFEGIR DALT
;;; Modulo de generacio de resultats
(defmodule resultats
	(import MAIN ?ALL)
	(export ?ALL)
)

;AFEGIR DALT
(deffunction max-puntuacio ($?tour)
	(bind ?max -1)
	(bind ?element nil)
	(progn$ (?curr-rec $?tour)
		(bind ?curr-cont (send ?curr-rec get-nom_quadre))
		(bind ?curr-punt (send ?curr-rec get-puntuacio))
		(if (> ?curr-punt ?max)
			then
			(bind ?max ?curr-punt)
			(bind ?element ?curr-rec)
		)
	)
	?element
)

;;; Template para una llista de recomanacions sense ordre
(deftemplate MAIN::unsorted_recomanacions
	(multislot recomanacions (type INSTANCE))
)

;;; Template para una llista de recomanacions amb ordre
(deftemplate MAIN::sorted_recomanacions
	(multislot recomanacions (type INSTANCE))
)


;;; Modul de generacio de respostes -------------------------------------------------
(defrule resultats::tour_desordenat "Creacio d'una llista de recomanacions per ordenar"
	(not (unsorted_recomanacions))
	=>
	(assert (unsorted_recomanacions))
)

(defrule resultats::add_recomanacio "Afegir recomanacio"
	(declare (salience 10))
	?add <- (object (is-a Recomanacio))
	?fet <- (unsorted_recomanacions (recomanacions $?tour))
	(test (not (member$ ?add $?tour)))
	=>
	(bind $?tour (insert$ $?tour (+ (length$ $?tour) 1) ?add))
	(modify ?fet (recomanacions $?tour))
)

(defrule resultats::tour_ordenat "Ordenar tour"
	(not (sorted_recomanacions))
	(unsorted_recomanacions (recomanacions $?tour))
	=>
	;;; Hacemos una ordenacion buscando maximo a cada paso (lento per simple de implementar)
	(bind $?resposta (create$ ))
	(while (not (eq (length$ $?tour) 0))  do
		(bind ?curr-rec (max-puntuacio $?tour))
		(bind $?tour (delete-member$ $?tour ?curr-rec))
		(bind $?resposta (insert$ $?resposta (+ (length$ $?resposta) 1) ?curr-rec))
	)
  (printout t "Ordenant..." crlf)
	(assert (sorted_recomanacions (recomanacions $?resposta)))
)
