
; AFEGIR DALT

(defclass Dia
	(is-a USER)
	(role concrete)
	(multislot recomanacions
		(type INSTANCE)
		(create-accessor read-write))
	(slot hores_dia
		(type INTEGER)
		(create-accessor read-write))
)

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


;;; FALTA ACABAR!!!!

(defrule generacion_soluciones::creacio_tour "Assignacio de recomanacions"
    ?g <- (Visita (dies ?dies) (tipus ?tipus) (hores ?hores) (coneixement ?coneixement));
	(lista-rec-ordenada (recomendaciones $?recs))
	(not (lista-dies))
	=>
    (bind ?hores (* ?hores 60))
	(bind $?tour (create$ ))
    (while (not(= (length$ $?tour) ?dies)) do
        (bind $?tour (insert$ $?tour (+ (length$ $?tour) 1) (make-instance (gensym) of Dia (hores_dia ?hores))))
    )
	(bind ?i 1)
	(bind ?rec-ant FALSE)
	(while (and (> (length$ $?recs) 0) (<= ?i ?dies))
		(bind ?dia (nth$ ?i $?tour))
		(bind $?recs-dia (create$ ))
		(bind ?t-max (send ?dia get-hores_dia))
		(bind ?t-ocu 0)
		(bind ?try 1)
		(bind ?asignados 0)
    ;;
        (bind ?j 1)
		(while (and(and(< ?t-ocu ?t-max) (< ?try 4)) (> (length$ $?recs) 0) (<= ?j (length$ ?recs))) do
			(bind ?rec (nth$ ?j $?recs))
			(bind ?cont (send ?rec get-nom_quadre))
			(bind ?a (send ?cont get-Amplada(* send ?cont get-Altura)))
            (if (or (eq ?tipus "Individu") then
                (if (> ?a 120000) then (bind ?t 12))
                (if (and (> ?a 13000) (< ?a 120000)) then (bind ?t 10))
                (if (and (> ?a 2000) (< ?a 13000)) then (bind ?t 6))
                (if (and (> ?a 0) (< ?a 2000)) then (bind ?t 4))
            )
            (if (eq ?tipus "Parella") then
                (if (> ?a 120000) then (bind ?t 13))
                (if (and (> ?a 13000) (< ?a 120000)) then (bind ?t 11))
                (if (and (> ?a 2000) (< ?a 13000)) then (bind ?t 7))
                (if (and (> ?a 0) (< ?a 2000)) then (bind ?t 5))

            )
            (if (eq ?tipus "Grup petit") then
                (if (> ?a 120000) then (bind ?t 14))
                (if (and (> ?a 13000) (< ?a 120000)) then (bind ?t 12))
                (if (and (> ?a 2000) (< ?a 13000)) then (bind ?t 8))
                (if (and (> ?a 0) (< ?a 2000)) then (bind ?t 6))

            )
            (if (eq ?tipus "Grup gran") then
                (if (> ?a 120000) then (bind ?t 16))
                (if (and (> ?a 13000) (< ?a 120000)) then (bind ?t 14))
                (if (and (> ?a 2000) (< ?a 13000)) then (bind ?t 10))
                (if (and (> ?a 0) (< ?a 2000)) then (bind ?t 8))
            )
      ;;
			(if (< (+ ?t-ocu ?t) ?t-max)
				then
					(bind ?t-ocu (+ ?t-ocu ?t))
					(bind ?try 1)
					(bind ?asignados (+ ?asignados 1))
					(bind ?recs-dia (insert$ $?recs-dia (+ (length$ $?recs-dia) 1) ?rec))
					(bind $?recs (delete-member$ $?recs ?rec))
				else
					(bind ?try (+ ?try 1))
			)
        (bind ?j (+ ?j 1))
		)
		(send ?dia put-recomendaciones $?recs-dia)
        (bind ?i (+ ?i 1))
	)
	(assert (tour-dies (dies $?lista)))
  (printout t "Assignacio de dies al tour..." crlf)
)
