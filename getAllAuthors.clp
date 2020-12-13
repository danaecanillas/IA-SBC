;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------

(defclass Author
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot AnyNeixement
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Genere
        (type STRING)
        (create-accessor read-write))
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    ;;; Un autor pinta uns quadres
    (multislot Pinta
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Autors
        (type STRING)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Estil
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Te
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Dies
        (type INTEGER)
        (create-accessor read-write))
    (multislot Edat
        (type STRING)
        (create-accessor read-write))
    (multislot Tipus
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Hores
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
)

(defclass Sala
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Una Sala pot estar connectada amb una altra sala
    (multislot Connecta_Amb
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
)

(defclass Quadre
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Amplada
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Estil
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Estil_Quadre
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Data
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (single-slot Esta_En
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (single-slot Es_De
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Estil
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Pintors_Estil
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Quadres_Estil
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
)

(definstances instances
    ([Autor7605] of Author
         (AnyNeixement  1876)
         (Genere  "male")
         (AnyMort  1957)
         (Nom  "Emil Hoppe")
         (Nacionalitat  "Austrian")
         (Pinta  [Art3] [Art5])
    )

    ([Art3] of Quadre
         (Amplada  "31.8")
         (Estil  "Expresionismo")
         (Altura  "34.3")
         (Estil_Quadre  [Estil3])
         (ArtistID  7605)
         (Data  1903)
         (Medi  "Graphite, pen, color pencil, ink, and gouache on tracing paper")
         (Nom  "Villa near Vienna Project, Outside Vienna, Austria, Elevation")
         (Esta_En  [Sala_6])
         (Rellevancia  2)
         (Es_De  [Autor7605])
    )

    ([Autor7607] of Author
         (AnyNeixement  1878)
         (Genere  "male")
         (AnyMort  1969)
         (Nom  "Marcel Kammerer")
         (Nacionalitat  "Austrian")
    )

    ([Art5] of Quadre
         (Amplada  "19.1")
         (Estil  "Cubismo")
         (Altura  "38.4")
         (Estil_Quadre  [Estil4])
         (ArtistID  7605)
         (Data  1903)
         (Medi  "Graphite, color pencil, ink, and gouache on tracing paper")
         (Nom  "Villa, project, outside Vienna, Austria, Exterior perspective")
         (Esta_En  [Sala_6])
         (Rellevancia  3)
         (Es_De  [Autor7605])
    )

    ([Estil6] of Estil
         (Pintors_Estil  [Autor2964])
         (Quadres_Estil  [Art9])
         (Nom  "Romanticismo")
    )

    ([Sala_1] of Sala
         (Connecta_Amb  [Sala_4] [Sala_0])
         (Nom  "Sala_1")
    )

    ([Estil1] of Estil
         (Pintors_Estil  [Autor6210])
         (Quadres_Estil  [Art1])
         (Nom  "Clasicismo")
    )

    ([Estil2] of Estil
         (Pintors_Estil  [Autor7470])
         (Quadres_Estil  [Art2])
         (Nom  "Abstractismo")
    )

    ([Sala_9] of Sala
         (Nom  "9")
    )

    ([Sala_6] of Sala
         (Nom  "6")
    )

    ([Sala_7] of Sala
         (Nom  "7")
    )

    ([Estil5] of Estil
         (Pintors_Estil  [Autor7056])
         (Quadres_Estil  [Art8])
         (Nom  "Arte Naif")
    )

    ([Art7] of Quadre
         (Amplada  "45.7")
         (Estil  "Expresionismo")
         (Altura  "35.6")
         (Estil_Quadre  [Estil3])
         (ArtistID  7056)
         (Data  1976)
         (Medi  "Gelatin silver photographs")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Esta_En  [Sala_9])
         (Rellevancia  2)
         (Es_De  [Autor7056])
    )

    ([Sala_10] of Sala
         (Nom  "10")
    )

    ([Autor6210] of Author
         (AnyNeixement  1841)
         (Genere  "male")
         (AnyMort  1918)
         (Nom  "Otto Wagner")
         (Nacionalitat  "Austrian")
         (Pinta  [Art1])
    )

    ([Autor7470] of Author
         (AnyNeixement  1944)
         (Genere  "male")
         (AnyMort  1976)
         (Nom  "Christian de Portzamparc")
         (Nacionalitat  "French")
         (Pinta  [Art2])
    )

    ([Sala_0] of Sala
         (Connecta_Amb  [Sala_1] [Sala_2])
         (Nom  "Entrada")
    )

    ([Autor7056] of Author
         (AnyNeixement  1944)
         (Genere  "male")
         (AnyMort  1992)
         (Nom  "Bernard Tschumi")
         (Nacionalitat  "Georgian")
         (Pinta  [Art6] [Art4] [Art7] [Art8])
    )

    ([Autor47] of Author
         (AnyNeixement  1933)
         (Genere  "male")
         (AnyMort  2010)
         (Nom  "Raimund Abraham")
         (Nacionalitat  "American")
    )

    ([Art2] of Quadre
         (Amplada  "29.8451")
         (Estil  "Abstractismo")
         (Altura  "40.6401")
         (Estil_Quadre  [Estil2])
         (ArtistID  7470)
         (Data  1987)
         (Medi  "Paint and colored pencil on print")
         (Nom  "City of Music, National Superior Conservatory of Music and Dance, Paris, France, View from interior courtyard")
         (Esta_En  [Sala_3])
         (Rellevancia  2)
         (Es_De  [Autor7470])
    )

    ([Art1] of Quadre
         (Amplada  "168.9")
         (Estil  "Clasicismo")
         (Altura  "48.6")
         (Estil_Quadre  [Estil1])
         (ArtistID  6210)
         (Data  1896)
         (Medi  "Ink and cut-and-pasted painted pages on paper")
         (Nom  "Ferdinandsbr�cke Project, Vienna, Austria (Elevation, preliminary version)")
         (Esta_En  [Sala_10])
         (Rellevancia  4)
         (Es_De  [Autor6210])
    )

    ([Art8] of Quadre
         (Amplada  "45.7")
         (Estil  "Arte Naif")
         (Altura  "35.6")
         (Estil_Quadre  [Estil5])
         (ArtistID  7056)
         (Data  1976)
         (Medi  "Gelatin silver photograph")
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 1: The Park")
         (Esta_En  [Sala_9])
         (Rellevancia  2)
         (Es_De  [Autor7056])
    )

    ([Sala_8] of Sala
         (Nom  "8")
    )

    ([Autor2964] of Author
         (AnyNeixement  1901)
         (Genere  "male")
         (AnyMort  1974)
         (Nom  "Louis I. Kahn")
         (Nacionalitat  "American")
         (Pinta  [Art9])
    )

    ([Autor8100] of Author
         (AnyNeixement  1869)
         (Genere  "male")
         (AnyMort  1936)
         (Nom  "Hans Poelzig")
         (Nacionalitat  "German")
    )

    ([Sala_2] of Sala
         (Connecta_Amb  [Sala_0] [Sala_4] [Sala_3])
         (Nom  "Sala_2")
    )

    ([Sala_3] of Sala
         (Connecta_Amb  [Sala_2])
         (Nom  "Sala_3")
    )

    ([Art6] of Quadre
         (Amplada  "45.7")
         (Estil  "Expresionismo")
         (Altura  "35.6")
         (Estil_Quadre  [Estil3])
         (ArtistID  7056)
         (Data  1976)
         (Medi  "Gelatin silver photograph")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Esta_En  [Sala_9])
         (Rellevancia  4)
         (Es_De  [Autor7056])
    )

    ([Art9] of Quadre
         (Amplada  "167.6")
         (Estil  "Romanticismo")
         (Altura  "113.0")
         (Estil_Quadre  [Estil6])
         (ArtistID  2964)
         (Data  1968)
         (Medi  "Charcoal and graphite on tracing paper")
         (Nom  "Memorial to the Six Million Jewish Martyrs, project, New York City, New York, Perspective of central pier")
         (Esta_En  [Sala_5])
         (Rellevancia  4)
         (Es_De  [Autor2964])
    )

    ([Sala_5] of Sala
         (Nom  "5")
    )

    ([Estil3] of Estil
         (Pintors_Estil  [Autor7605] [Autor7056])
         (Quadres_Estil  [Art6] [Art4] [Art7] [Art3])
         (Nom  "Expresionismo")
    )

    ([Sala_4] of Sala
         (Connecta_Amb  [Sala_1] [Sala_2])
         (Nom  "Sortida")
    )

    ([Art4] of Quadre
         (Amplada  "50.8")
         (Estil  "Expresionismo")
         (Altura  "50.8")
         (Estil_Quadre  [Estil3])
         (ArtistID  7056)
         (Data  1980)
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 1: The Park")
         (Esta_En  [Sala_9])
         (Rellevancia  2)
         (Es_De  [Autor7056])
    )

    ([Estil4] of Estil
         (Pintors_Estil  [Autor7605])
         (Quadres_Estil  [Art5])
         (Nom  "Cubismo")
    )

    ([Autor7608] of Author
         (AnyNeixement  1878)
         (Genere  "male")
         (AnyMort  1961)
         (Nom  "Otto Sch�nthal")
         (Nacionalitat  "Austrian")
    )

)

;;; ----- Classes propies del generador de solucions -----

(defclass Recomanacio
	(is-a USER)
	(role concrete)
    (slot nom_quadre
		(type INSTANCE)
		(create-accessor read-write))
    (slot puntuacio
        (type INTEGER)
        (create-accessor read-write))
    (multislot justificacions
		(type STRING)
		(create-accessor read-write))
)

(defclass Dia
	(is-a USER)
	(role concrete)
	(multislot recomanacions
		(type INSTANCE)
		(create-accessor read-write))
	(slot hores_dia
		(type INTEGER)
		(create-accessor read-write))
    (slot hores_dia
		(type INTEGER)
		(create-accessor read-write))
)


;;-------------------------------------------------------------------------------------------------------------
;;                    MAIN
;;-------------------------------------------------------------------------------------------------------------

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

(defmodule processat_dades
    (import MAIN ?ALL)
    (import dades-visita deftemplate ?ALL)
    (import dades-preferencies deftemplate ?ALL)
    (export ?ALL)
)

(defmodule generacio_solucions
    (import MAIN ?ALL)
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
    (format t "  Estil: %s" (send ?self:Estil_Quadre get-Nom))
	(printout t crlf)
    (format t "  Sala: %s" (send ?self:Esta_En get-Nom))
    (printout t crlf)
    (format t "  Autor: %s" (send ?self:Es_De get-Nom))
    (printout t crlf)
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

(defmessage-handler MAIN::Estil imprimir ()
    (format t "Estil Nom: %s" ?self:Nom)
	(printout t crlf)
    (printout t "Quadres de l'estil: " crlf)
    (progn$ (?curr-quadre ?self:Quadres_Estil)
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

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencies_visita
	(multislot autors_preferits (type INSTANCE))
	(multislot estils_preferits (type INSTANCE))
	(slot epoca_inici (type INTEGER) (default -1))
	(slot epoca_final (type INTEGER) (default 2020))
)

;;; Template para una llista de recomanacions sense ordre
(deftemplate MAIN::unsorted_recomanacions
	(multislot recomanacions (type INSTANCE))
)

;;; Template para una llista de recomanacions amb ordre
(deftemplate MAIN::sorted_recomanacions
	(multislot recomanacions (type INSTANCE))
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
(deffunction MAIN::pregunta-general (?pregunta)
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


;;; ---- FUNCIONS RANDOM DE PROVA ----



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
;  	?n <- (Visita (nacionalitat ?nacionalitat))
;  	=>
;  	(bind ?nacionalitat (pregunta-general "Quina es la vostra nacionalitat?" ))
;  	(modify ?n (nacionalitat ?nacionalitat))
;  )

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
    (autors_pref ask)
    (estils_pref ask)
    (epoca_pref ask)
    (preferencies_visita)
)

(defrule dades-preferencies::ask_autors_preferits "Pregunta a l'usuari si té autors preferits"
	?fet <- (autors_pref ask)
	=>
	(bind ?resposta (pregunta-si-no "Te preferencies pel que fa als autors de les obres? "))
	(retract ?fet)
	(if (eq ?resposta TRUE)
		then (assert (autors_pref choose))
		else
		(assert (autors_preferits FALSE))
	)
)

(defrule dades-preferencies::autors_preferits "Establim els autors preferits"
    ?fet <- (autors_pref choose)
      ?preferencies <- (preferencies_visita)
      =>
	     (bind $?obj-autors (find-all-instances ((?inst Author)) TRUE))
       (bind $?nom-autors (create$ ))
       (loop-for-count (?i 1 (length$ $?obj-autors)) do
           (bind ?curr-obj (nth$ ?i ?obj-autors))
      		 (bind ?curr-nom (send ?curr-obj get-Nom))
      		 (bind $?nom-autors(insert$ $?nom-autors (+ (length$ $?nom-autors) 1) ?curr-nom))
	)
	(bind ?chosen (pregunta-multi "Esculli els seus autors preferits: " $?nom-autors))
  (bind $?resposta (create$ ))
	(loop-for-count (?i 1 (length$ ?chosen)) do
		(bind ?curr-index (nth$ ?i ?chosen))
		(bind ?curr-autor (nth$ ?curr-index ?obj-autors))
		(bind $?resposta(insert$ $?resposta (+ (length$ $?resposta) 1) ?curr-autor))
	)

	(retract ?fet)
  (assert (autors_pref TRUE))
  (modify ?preferencies (autors_preferits $?resposta))
)

(defrule dades-preferencies::ask_estils_preferits "Pregunta a l'usuari si té estils preferits"
	?fet <- (estils_pref ask)
	=>
	(bind ?resposta (pregunta-si-no "Te preferencies pel que fa a l'estil de les obres? "))
	(retract ?fet)
	(if (eq ?resposta TRUE)
		then (assert (estils_pref choose))
		else
		(assert (estils_preferits FALSE))
	)
)

(defrule dades-preferencies::estils_preferits "Establim els estils preferits"
    ?fet <- (estils_pref choose)
      ?preferencies <- (preferencies_visita)
      =>
	     (bind $?obj-estils (find-all-instances ((?inst Estil)) TRUE))
       (bind $?nom-estils (create$ ))
       (loop-for-count (?i 1 (length$ $?obj-estils)) do
           (bind ?curr-obj (nth$ ?i ?obj-estils))
      		 (bind ?curr-nom (send ?curr-obj get-Nom))
      		 (bind $?nom-estils(insert$ $?nom-estils (+ (length$ $?nom-estils) 1) ?curr-nom))
	)
	(bind ?chosen (pregunta-multi "Esculli els seus estils preferits: " $?nom-estils))
  (bind $?resposta (create$ ))
	(loop-for-count (?i 1 (length$ ?chosen)) do
		(bind ?curr-index (nth$ ?i ?chosen))
		(bind ?curr-autor (nth$ ?curr-index ?obj-estils))
		(bind $?resposta(insert$ $?resposta (+ (length$ $?resposta) 1) ?curr-autor))
	)

	(retract ?fet)
  (assert (estils_pref TRUE))
  (modify ?preferencies (estils_preferits $?resposta))
)

(defrule dades-preferencies::ask_epoca_preferida "Pregunta a l'usuari si té època preferida"
	?fet <- (epoca_pref ask)
	=>
	(bind ?resposta (pregunta-si-no "Te preferencies pel que fa a l'epoca de les obres? "))
	(retract ?fet)
	(if (eq ?resposta TRUE)
		then (assert (epoca_pref choose))
		else
		(assert (epoca_pref FALSE))
	)
)

(defrule dades-preferencies::epoca_preferida "Establim les epoques preferides"
    ?fet <- (epoca_pref choose)
    ?preferencies <- (preferencies_visita)
    =>
    (bind ?any_ini (pregunta-numerica "Esculli l'any d'inici de la epoca: " 0 2020))
    (bind ?any_fi (pregunta-numerica "Esculli l'any de final de la epoca: " 0 2020))
    (retract ?fet)
    (assert (epoca_pref TRUE))
    (modify ?preferencies (epoca_inici ?any_ini) (epoca_final ?any_fi))
)

(defrule dades-preferencies::passar_processat "Passem al modul de processament de les dades"
    (declare (salience -1))
    ; ?h1 <- (autors_pref TRUE|FALSE)
    ; ?h2 <- (estils_pref TRUE|FALSE)
	=>
	(focus processat_dades)
    (printout t "Processant les dades obtingudes..." crlf)
)


;;; ----------------- Modul processat de dades -------------------

(defrule processat_dades::afegir-quadres "Afegint tots els quadres"
    (declare (salience 10))
	=>
	(bind $?llista_instancies (find-all-instances ((?inst Quadre)) TRUE))
	(progn$ (?i ?llista_instancies)
		(make-instance (gensym) of Recomanacio (nom_quadre ?i)(puntuacio 0))
	)
   (printout t "Afegint quadres..." crlf)
)

(defrule processat_dades::aux-authors "Crea fets per poder processar els autors preferits"
    (preferencies_visita (autors_preferits $?gen))
	?fet <- (autors_pref ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?fet)
	(if (eq ?aux TRUE)then
		(progn$ (?curr-gen $?gen)
			(assert (autors ?curr-gen))
		)
	)
    (printout t "Creant fets autors..." crlf)
)

(defrule processat_dades::aux-estils "Crea fets per poder processar els estils preferits"
    (preferencies_visita (estils_preferits $?gen))
	?hecho <- (estils_pref ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then
		(progn$ (?curr-gen $?gen)
			(assert (estils ?curr-gen))
		)
	)
    (printout t "Creant fets estils..." crlf)
)

(defrule processat_dades::aux-epoca "Crea fets per poder processar l'epoca preferida"
    (preferencies_visita (epoca_inici ?inici) (epoca_final ?final))
	?hecho <- (epoca_pref ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?hecho)
	(if (eq ?aux TRUE)then
		(loop-for-count (?cnt1 ?inici ?final) do
			(assert (epoca ?cnt1))
		)
	)
    (printout t "Creant fets epoca..." crlf)
)

;;; ----------- Apliquem els filtres de les preguntes ----------

(defrule processat_dades::valorar-coneixement-superior-a-4 "Se mejora la puntuacion de los cuadros"
	(Visita (coneixement ?nivel))
	(test (> ?nivel 4)) 
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <-(object (is-a Quadre) (Rellevancia ?relevancia))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorado-nivel ?cont ?nivel))
	=>
    (if (> ?relevancia 3) then
        (bind ?p (+ ?p 70))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una rellevancia alta acord al coneixement del visitant -> +70")) 
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just) 
    (assert (valorado-nivel ?cont ?nivel))
    (printout t "Valorant nivell del grup..." crlf)
)

(defrule processat_dades::valorar-coneixement-inferior-a-4 "Se mejora la puntuacion de los cuadros"
	(Visita (coneixement ?nivel))
	(test (<= ?nivel 4)) 
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <-(object (is-a Quadre) (Rellevancia ?relevancia))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorado-nivel ?cont ?nivel))
	=>
    (if (< ?relevancia 4) then
        (bind ?p (+ ?p 40))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una rellevancia mitjana/baixa acord al nivell del visitant -> +40")) 
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just) 
    (assert (valorado-nivel ?cont ?nivel))
    (printout t "Valorant nivell del grup..." crlf)
)

(defmethod processat_dades::string_to_float ((?s STRING))
   (float (string-to-field ?s)))

(defrule processat_dades::valorar-tamany-quadre-grup-petit "Se mejora la puntuacion de los cuadros"
	(Visita (tipus ?tipus))
	(test (eq ?tipus "Grup petit")) 
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <- (object (is-a Quadre)  (Altura ?h) (Amplada ?w))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorat-tamany ?cont))
	=>
    (if (> (string_to_float ?h) 40.0) then
        (bind ?p (+ ?p 20))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una altura suficient per un grup -> +20")) 
	)
    (if (> (string_to_float ?w) 40.0) then
        (bind ?p (+ ?p 20))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una amplada suficient per un grup -> +20")) 
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just) 
    (assert (valorat-tamany ?cont))
    (printout t "Valorant tamany del quadre..." crlf)
)

(defrule processat_dades::valorar-tamany-quadre-grup-gran "Se mejora la puntuacion de los cuadros"
	(Visita (tipus ?tipus))
	(test (eq ?tipus "Grup gran")) 
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <- (object (is-a Quadre)  (Altura ?h) (Amplada ?w))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorat-tamany ?cont))
	=>
    (if (> (string_to_float ?h) 80.0) then
        (bind ?p (+ ?p 30))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una altura suficient per un grup gran -> +30")) 
	)
    (if (> (string_to_float ?w) 80.0) then
        (bind ?p (+ ?p 30))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una amplada suficient per un grup gran -> +30")) 
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just) 
    (assert (valorat-tamany ?cont))
    (printout t "Valorant tamany del quadre..." crlf)
)

(defrule processat_dades::valorar-autors-preferits "Es millora la puntuacio de quadres d'autorss preferits"
	?hecho <- (autors ?auto)
	?cont <-(object (is-a Quadre) (Es_De ?autor))
	(test (eq (instance-name ?auto) ?autor))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorat-autor-preferit ?cont ?auto)) ;?auto al final
	=>
	(bind ?p (+ ?p 50))
	(bind ?text (str-cat "Pertany a l'autor preferit: " (send ?auto get-Nom) " -> +50"))
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just)
	(assert (valorat-autor-preferit ?cont ?auto))
    (printout t "Comprovant autors preferits..." crlf)
)

(defrule processat_dades::valorar-estilos-preferits "Es millora la puntuacio de quadres amb estils preferits"
	?hecho <- (estils ?estil)
	?cont <-(object (is-a Quadre) (Estil_Quadre ?estilos))
	(test (eq (instance-name ?estil) ?estilos))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorat-estil-preferit ?cont ?estil))
	=>
	(bind ?p (+ ?p 50))
	(bind ?text (str-cat "Pertany a l'estil preferit: " (send ?estil get-Nom) " -> +50"))
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just)
	(assert (valorat-estil-preferit ?cont ?estil))
    (printout t "Comprovant estils preferits..." crlf)
)

(defrule processat_dades::valorar-epoca-preferida "Es millora la puntuacio de quadres de l'epoca"
	?hecho <- (epoca ?any)
    ; ?hecho <- (preferencies_visita (epoca_inici ?inici) (epoca_final ?final))
	?cont <-(object (is-a Quadre) (Data ?data))
	(test (eq ?any ?data))
    ; (test (or (>= ?data ?inici) (<= ?data ?final)))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valorat-any-preferit ?cont ?any))
	=>
	(bind ?p (+ ?p 50))
	(bind ?text (str-cat "Pertany a un any de l'epoca preferida: " ?data " -> +50"))
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just)
	(assert (valorat-any-preferit ?cont ?any))
    (printout t "Comprovant anys preferits..." crlf)
)

(defrule processat_dades::passar-a-generacio "Passa al modul de generacio de respostes"
	(declare(salience -10))
	=>
	(printout t "Generando respuesta..." crlf)
	(focus generacio_solucions)
)

;;; ------------ Modul generacio solucions ----------------

(defrule generacio_solucions::crea-llista-recomanacions "Se crea una lista de recomendaciones para ordenarlas"
	(not (llista-rec-desordenada))
	=>
	(assert (llista-rec-desordenada))
)

;;; La resta de funcions

(defrule generacio_solucions::passar-a-mostrar "Se pasa al modulo de presentacion"
    ; (dias-orden-sala)
    (llista-rec-desordenada)
	=>
	(focus mostrar)
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


(defrule mostrar::totsElsEstils "Mostrar tots els autors"
    =>
    (bind ?llista_instancies (find-all-instances ((?instancia Estil)) TRUE))

    (progn$ (?i ?llista_instancies)
        (send ?i imprimir))
)

; ;;; Funció per obtenir l'area del quadre
; (deffunction obtenir-area (?quadre)
;     (bind ?resposta (* quadre:Altura quadre:Amplada))
;     ?resposta
; )


; (deffunction dades-visita::info-grup ()
;     (Visita (tipus ?tipus) (dies ?dies) (hores ?hores) (coneixement) (edat ?edat))
;     =>
;     (format t "  Tipus: %s" ?tipus)
;     (printout t crlf)
;     (format t "  Dies: %s" ?dies)
;     (printout t crlf)
;     (format t "  Hores: %s" ?hores)
;     (printout t crlf)
;     (format t "  Coneixement: %s" ?edat)
;     (printout t crlf)
; )
