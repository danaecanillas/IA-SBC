;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Te
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Hores
        (type FLOAT)
        (create-accessor read-write))
    (multislot Tipus
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (multislot Edat
        (type STRING)
        (create-accessor read-write))
    (single-slot Dies
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Sala
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    ;;; Una Sala pot estar connectada amb una altra sala
    (multislot Connecta_Amb
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Quadre
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Estil
        (type STRING)
        (create-accessor read-write))
    (single-slot Amplada
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Data
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (multislot Es_De
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (multislot Esta_En
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
)

(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Estil
        (type STRING)
        (create-accessor read-write))
    (multislot Autors
        (type STRING)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Author
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (single-slot Genere
        (type STRING)
        (create-accessor read-write))
    ;;; Un autor pinta uns quadres
    (multislot Pinta
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot AnyNeixement
        (type INTEGER)
        (create-accessor read-write))
)

(definstances instances
    ([Art9] of Quadre
         (Estil  "Romanticismo")
         (Amplada  "167.6")
         (Data  1968)
         (Es_De  [Autor2964])
         (Altura  "113.0")
         (Rellevancia  4)
         (ArtistID  2964)
         (Esta_En  [Sala_5])
         (Nom  "Memorial to the Six Million Jewish Martyrs, project, New York City, New York, Perspective of central pier")
         (Medi  "Charcoal and graphite on tracing paper")
    )

    ([Autor7608] of Author
         (AnyMort  1961)
         (Nom  "Otto Sch�nthal")
         (Nacionalitat  "Austrian")
         (Genere  "male")
         (AnyNeixement  1878)
    )

    ([Art6] of Quadre
         (Estil  "Expresionismo")
         (Amplada  "45.7")
         (Data  1976)
         (Es_De  [Autor7056])
         (Altura  "35.6")
         (Rellevancia  4)
         (ArtistID  7056)
         (Esta_En  [Sala_9])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Medi  "Gelatin silver photograph")
    )

    ([Art4] of Quadre
         (Estil  "Expresionismo")
         (Amplada  "50.8")
         (Data  1980)
         (Es_De  [Autor7056])
         (Altura  "50.8")
         (Rellevancia  2)
         (ArtistID  7056)
         (Esta_En  [Sala_9])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 1: The Park")
         (Medi  "Photographic reproduction with colored synthetic laminate")
    )

    ([Sala_2] of Sala
         (Nom  "Sala_2")
         (Connecta_Amb  [Sala_0] [Sala_3] [Sala_4])
    )

    ([Autor7056] of Author
         (AnyMort  1992)
         (Nom  "Bernard Tschumi")
         (Nacionalitat  "Georgian")
         (Genere  "male")
         (Pinta  [Art6] [Art4] [Art7] [Art8])
         (AnyNeixement  1944)
    )

    ([Sala_8] of Sala
         (Nom  "8")
    )

    ([Art5] of Quadre
         (Estil  "Cubismo")
         (Amplada  "19.1")
         (Data  1903)
         (Es_De  [Autor7605])
         (Altura  "38.4")
         (Rellevancia  3)
         (ArtistID  7605)
         (Esta_En  [Sala_6])
         (Nom  "Villa, project, outside Vienna, Austria, Exterior perspective")
         (Medi  "Graphite, color pencil, ink, and gouache on tracing paper")
    )

    ([Autor6210] of Author
         (AnyMort  1918)
         (Nom  "Otto Wagner")
         (Nacionalitat  "Austrian")
         (Genere  "male")
         (Pinta  [Art1])
         (AnyNeixement  1841)
    )

    ([Art3] of Quadre
         (Estil  "Expresionismo")
         (Amplada  "31.8")
         (Data  1903)
         (Es_De  [Autor7605])
         (Altura  "34.3")
         (Rellevancia  2)
         (ArtistID  7605)
         (Esta_En  [Sala_6])
         (Nom  "Villa near Vienna Project, Outside Vienna, Austria, Elevation")
         (Medi  "Graphite, pen, color pencil, ink, and gouache on tracing paper")
    )

    ([Art8] of Quadre
         (Estil  "Arte Naif")
         (Amplada  "45.7")
         (Data  1976)
         (Es_De  [Autor7056])
         (Altura  "35.6")
         (Rellevancia  2)
         (ArtistID  7056)
         (Esta_En  [Sala_9])
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 1: The Park")
         (Medi  "Gelatin silver photograph")
    )

    ([Art7] of Quadre
         (Estil  "Expresionismo")
         (Amplada  "45.7")
         (Data  1976)
         (Es_De  [Autor7056])
         (Altura  "35.6")
         (Rellevancia  2)
         (ArtistID  7056)
         (Esta_En  [Sala_9])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Medi  "Gelatin silver photographs")
    )

    ([Sala_1] of Sala
         (Nom  "Sala_1")
         (Connecta_Amb  [Sala_0] [Sala_4])
    )

    ([Sala_0] of Sala
         (Nom  "Entrada")
         (Connecta_Amb  [Sala_2] [Sala_1])
    )

    ([Autor2964] of Author
         (AnyMort  1974)
         (Nom  "Louis I. Kahn")
         (Nacionalitat  "American")
         (Genere  "male")
         (Pinta  [Art9])
         (AnyNeixement  1901)
    )

    ([Sala_3] of Sala
         (Nom  "Sala_3")
         (Connecta_Amb  [Sala_2])
    )

    ([Autor47] of Author
         (AnyMort  2010)
         (Nom  "Raimund Abraham")
         (Nacionalitat  "American")
         (Genere  "female")
         (AnyNeixement  1933)
    )

    ([Sala_4] of Sala
         (Nom  "Sortida")
         (Connecta_Amb  [Sala_2] [Sala_1])
    )

    ([Art1] of Quadre
         (Estil  "Clasicismo")
         (Amplada  "168.9")
         (Data  1896)
         (Es_De  [Autor6210])
         (Altura  "48.6")
         (Rellevancia  4)
         (ArtistID  6210)
         (Esta_En  [Sala_10])
         (Nom  "Ferdinandsbr�cke Project, Vienna, Austria (Elevation, preliminary version)")
         (Medi  "Ink and cut-and-pasted painted pages on paper")
    )

    ([Autor7605] of Author
         (AnyMort  1957)
         (Nom  "Emil Hoppe")
         (Nacionalitat  "Austrian")
         (Genere  "male")
         (Pinta  [Art3] [Art5])
         (AnyNeixement  1876)
    )

    ([Sala_10] of Sala
         (Nom  "10")
    )

    ([Art2] of Quadre
         (Estil  "Abstractismo")
         (Amplada  "29.8451")
         (Data  1987)
         (Es_De  [Autor7470])
         (Altura  "40.6401")
         (Rellevancia  2)
         (ArtistID  7470)
         (Esta_En  [Sala_3])
         (Nom  "City of Music, National Superior Conservatory of Music and Dance, Paris, France, View from interior courtyard")
         (Medi  "Paint and colored pencil on print")
    )

    ([Sala_7] of Sala
         (Nom  "7")
    )

    ([Autor8100] of Author
         (AnyMort  1936)
         (Nom  "Hans Poelzig")
         (Nacionalitat  "German")
         (Genere  "male")
         (AnyNeixement  1869)
    )

    ([Autor7470] of Author
         (AnyMort  1976)
         (Nom  "Christian de Portzamparc")
         (Nacionalitat  "French")
         (Genere  "male")
         (Pinta  [Art2])
         (AnyNeixement  1944)
    )

    ([Sala_9] of Sala
         (Nom  "9")
    )

    ([Autor7607] of Author
         (AnyMort  1969)
         (Nom  "Marcel Kammerer")
         (Nacionalitat  "Austrian")
         (Genere  "male")
         (AnyNeixement  1878)
    )

    ([Sala_6] of Sala
         (Nom  "6")
    )

    ([Sala_5] of Sala
         (Nom  "5")
    )

)



;;-------------------------------------------------------------------------------------------------------------
;;                    MAIN
;;-------------------------------------------------------------------------------------------------------------

; (defrule retorna_instancies
;     =>
;     (bind ?llista_instancies (find-all-instances ((?instancia Author)) TRUE))
;     (progn$ (?i ?llista_instancies)
;       (printout t (send ?i get-Nom) " " (send ?i get-Nacionalitat) " " (send ?i get-Genere) crlf))
; )

; (defrule retorna_homes
;     =>
;     (bind ?llista_instancies (find-all-instances ((?instancia Author)) (eq ?instancia:Genere "male")))
;     (progn$ (?i ?llista_instancies)
;       (printout t (send ?i get-Nom) " " (send ?i get-Nacionalitat) " " (send ?i get-Genere) crlf))
; )

;;; Modulo principal de utilidades

(defmodule MAIN (export ?ALL))

;;; Modul de recopilacio de les dades de l'usuari
(defmodule dades-visita
	(import MAIN ?ALL)
	(export ?ALL)
)

;;; Modul de recopilacio de les preferencies de l'usuari
(defmodule dades-preferencies
	(import MAIN ?ALL)
	(import dades-visita deftemplate ?ALL)
	(export ?ALL)
)

(defmodule mostrar
    (import MAIN ?ALL)
    (export ?ALL)
)

; Funcio per obtenir el nom d'una Sala
(defmessage-handler MAIN::Sala obtenirNom ()
    (bind ?resposta ?self:Nom)
    ?resposta ; Si l'ultima instrucció es una variable la funcio retorna el valor
)

(defmessage-handler MAIN::Quadre imprimir ()
    (printout t "-----------------------------------" crlf)
	(format t "  Titulo: %s" ?self:Nom)
	(printout t crlf)
	(format t "  Anyo: %d" ?self:Data)
	(printout t crlf)
    (format t "  Altura: %s" ?self:Altura)
	(printout t crlf)
    (format t "  Amplada: %s" ?self:Amplada)
	(printout t crlf)
    (format t "  Medi: %s" ?self:Medi)
	(printout t crlf)
    (format t "  Estil: %s" ?self:Estil)
	(printout t crlf)
    (progn$ (?curr-sala ?self:Esta_En)
        (format t "  Sala: %s" (send ?curr-sala obtenirNom))
        (printout t crlf)
    )
    (progn$ (?curr-autor ?self:Es_De)
        (format t "  Autor: %s" (send ?curr-autor get-Nom))
        (printout t crlf)
    )
    ; (format t "Pintado por: %s" (send ?self:Es_De get-Nom))
	; (printout t crlf)
)

(defmessage-handler MAIN::Author imprimir ()
	(format t "Nom: %s" ?self:Nom)
	(printout t crlf)
    (format t "Nacionalitat: %s" ?self:Nacionalitat)
	(printout t crlf)
	(format t "Any Neixement: %d" ?self:AnyNeixement)
	(printout t crlf)
    (format t "Any Mort: %d" ?self:AnyMort)
	(printout t crlf)
    (printout t "Quadres de l'autor: " crlf)
    (progn$ (?curr-quadre ?self:Pinta)
        (send ?curr-quadre imprimir)
    )
    (printout t "===================================" crlf)
    (printout t crlf)
)

;;; ------------------------ Declaracion de templates --------------------------

(deftemplate MAIN::Visita
	(slot tipus (type STRING) (default "indefinit"))
	(slot dies (type INTEGER) (default -1))
	(slot hores (type INTEGER) (default -1))
	(slot coneixement (type INTEGER) (default -1))
	(slot edat (type INTEGER) (default -1))
	(slot nacionalitat (type STRING) (default "indefinit"))
)

;;; ------------------------ Fin declaracion de templates ----------------------

;;; ------------------------ Declaracion de funciones --------------------------

;;; Funcio de test per preguntar el sexe de l'autor
(deffunction MAIN::pregunta-sexe (?pregunta ?a ?b)
    (format t "%s (%s o %s) " ?pregunta ?a ?b)
    (bind ?resposta (read))
    (while (not (or(eq ?resposta ?a)(eq ?resposta ?b)))
        (format t "%s (%s o %s) " ?pregunta ?a ?b)
        (bind ?resposta (read))
    )
    (if (eq ?resposta male)
      then
      (bind ?resposta "male")
      else
      (bind ?resposta "female")
    )
    ?resposta
)

;;; Funcio per fer una pregunta amb respostes qualssevol
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?resposta (read))
	(while (not (lexemep ?resposta)) do
		(format t "%s " ?pregunta)
		(bind ?resposta (read))
    )
	?resposta
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
   (bind ?response (pregunta-opcions ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then (bind ?resposta TRUE)
       else (bind ?resposta FALSE))
    ?resposta
)

;;; Funcion para hacer una pregunta con resposta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?resposta (read))
	(while (not(and(>= ?resposta ?rangini)(<= ?resposta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?resposta (read))
	)
	?resposta
)

;;; Funcio per fer una pregunta amb moltes opcions
(deffunction MAIN::pregunta-index (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles)
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?resposta (pregunta-numerica "Escull una opció:" 1 (length$ ?valores-posibles)))
	?resposta
)

;;; Funcion para hacer una pregunta multi-resposta con indices
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
	(focus dades-visita)
)

(defrule dades-visita::definicio_tipus "Tipus de Visita"
	(not (Visita))
	=>
	(bind ?t (pregunta-numerica "Quanta gent sou? " 1 50))
    (if (= ?t 1) then (bind ?tipus "Individu"))
    (if (= ?t 2) then (bind ?tipus "Parella"))
    (if (and(> ?t 2) (< ?t 11)) then (bind ?tipus "Grup petit"))
    (if (> ?t 10) then (bind ?tipus "Grup gran"))
	(assert (Visita (tipus ?tipus)))
)

(defrule dades-visita::definicio_dies "Dies de la visita"
	?d <- (Visita (dies ?dies))
    (test (< ?dies 0))
	=>
	(bind ?dies (pregunta-numerica "Quants dies durara la vostra visita?" 1 14))
	(modify ?d (dies ?dies))
)

(defrule dades-visita::definicio_hores "Hores de la visita"
	?h <- (Visita (hores ?hores))
    (test (< ?hores 0))
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
        (if (= ?resposta 2) then (bind ?score (+ 1 ?score)))

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
	=>
	(bind ?edat (pregunta-numerica "Indiqui l'edat mitjana de la visita " 1 120))
	(modify ?e (edat ?edat))
)

; (defrule dades-visita::definicio_nacionalitat "Nacionalitat de la Visita"
; 	?n <- (Visita (nacionalitat ?nacionalitat))
; 	=>
; 	(bind ?nacionalitat (pregunta-general "Quina es la vostra nacionalitat?" ))
; 	(modify ?n (nacionalitat ?nacionalitat))
; )

(defrule dades-visita::passar-a-preferencies "Passem al modul de recopilacio de preferencies"
    ; (declare (salience 10))
	; 			?g <- (Visita (tipus ~"indefinit")(edat ?edat) (dies ?dies) (hores ?hores) (coneixement ?coneixement) (nacionalitat ~"indefinit"))
    ; (test (> ?edat -1))
    ; (test (> ?dies -1))
    ; (test (> ?hores -1))
    ; (test (> ?coneixement -1))
		=>
		(focus dades-preferencies)
)


(deffacts dades-preferencies::fets-inicials "Establim fets per poder recopilar informacio"
    (autors_preferits ask)
    (tematiques_preferides ask)
    (estils_preferits ask)
		(epoques_preferides ask)
    (preferencies_visita )
)


(defrule dades-preferencies::autors_preferits "Establim els autors preferits"
    =>
    (printout t "Encara no esta fet :)" crlf)
)


(defrule dades-preferencies::tematiques_preferides "Establim els autors preferits"
    =>
    (printout t "Encara no esta fet :)" crlf)
)


(defrule dades-preferencies::estils_preferits "Establim els autors preferits"
    =>
    (printout t "Encara no esta fet :)" crlf)
)


(defrule dades-preferencies::epoques_preferides "Establim els autors preferits"
    =>
    (printout t "Encara no esta fet :)" crlf)
)


(defrule dades-preferencies::passar_processat "Passem al modul de processament de les dades"
	=>
	(focus mostrar)
    (printout t "Processant les dades obtingudes..." crlf)
)




;;; ---------------- FUNCIONS MEVES -----------------------


; (defrule mostrar::totsElsQuadres "Mostrar tots els quadres"
;     =>
;     (bind ?llista_instancies (find-all-instances ((?instancia Quadre)) TRUE))
;     (progn$ (?i ?llista_instancies)
;         (send ?i imprimir))
; )

(defrule mostrar::totsElsAutors "Mostrar tots els autors"
    =>
    ; (bind ?llista_instancies (find-all-instances ((?instancia Author)) TRUE))
    (bind ?sexe (pregunta-sexe "Escull el sexe" male female))
    (printout t crlf)
    (bind ?llista_instancies (find-all-instances ((?instancia Author)) (eq ?instancia:Genere ?sexe)))
    
    (progn$ (?i ?llista_instancies)
        (send ?i imprimir))
)

; ;;; Funció per obtenir l'area del quadre
; (deffunction obtenir-area (?quadre)
;     (bind ?resposta quadre:Altura * quadre:Amplada)
;     ?resposta
; )