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
         (Genere  "male")
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

(defmodule mostrar
    (import MAIN ?ALL)
    (export ?ALL)
)

(defmessage-handler MAIN::Sala obtenirNom ()
    (format t "  Sala: %s" ?self:Nom)
    (printout t crlf)
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
    ; (format t "Sala: %d" (send ?self:Esta_En obtenirNom))
	; (printout t crlf)
    (format t "  Medi: %s" ?self:Medi)
	(printout t crlf)
    (format t "  Estil: %s" ?self:Estil)
	(printout t crlf)
    (progn$ (?curr-sala ?self:Esta_En)
        (send ?curr-sala obtenirNom)
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

(defrule MAIN::initialRule "Regla inicial"
	(declare (salience 10))
	=>
	(printout t"----------------------------------------------------------" crlf)
  	(printout t"          Personalizacion de visitas a un museo           " crlf)
	(printout t"----------------------------------------------------------" crlf)
  	(printout t crlf)  	
	(printout t"¡Bienvenido! A continuacion se le formularan una serie de preguntas para poder recomendarle una visita adecuada a sus preferencias." crlf)
	(printout t crlf)
	(focus mostrar) ; Següent modul de normes a executar
)


; (defrule mostrar::totsElsQuadres "Mostrar tots els quadres"
;     =>
;     (bind ?llista_instancies (find-all-instances ((?instancia Quadre)) TRUE))
;     (progn$ (?i ?llista_instancies)
;         (send ?i imprimir))
; )

(defrule mostrar::totsElsAutors "Mostrar tots els autors"
    =>
    (bind ?llista_instancies (find-all-instances ((?instancia Author)) TRUE))
    (progn$ (?i ?llista_instancies)
        (send ?i imprimir))
)