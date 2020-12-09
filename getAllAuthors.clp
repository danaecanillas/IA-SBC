;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------

(defclass Quadre
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (multislot Esta_En
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (multislot Es_De
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
    (single-slot Data
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Amplada
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Author
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Genere
        (type STRING)
        (create-accessor read-write))
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
    ;;; Un autor pinta uns quadres
    (multislot Pinta
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot AnyNeixement
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
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

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Edat
        (type STRING)
        (create-accessor read-write))
    (multislot Te
        (type INSTANCE)
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
    (single-slot Dies
        (type INTEGER)
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

(definstances instances
    ([Autor6210] of Author
         (Genere  "male")
         (AnyMort  1918)
         (Pinta  [Art1])
         (AnyNeixement  1841)
         (Nacionalitat  "Austrian")
         (Nom  "Otto Wagner")
    )

    ([Autor47] of Author
         (Genere  "male")
         (AnyMort  2010)
         (AnyNeixement  1933)
         (Nacionalitat  "American")
         (Nom  "Raimund Abraham")
    )

    ([Art6] of Quadre
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (ArtistID  7056)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7056])
         (Altura  "35.6")
         (Medi  "Gelatin silver photograph")
         (Data  1976)
         (Amplada  "45.7")
    )

    ([Art3] of Quadre
         (Nom  "Villa near Vienna Project, Outside Vienna, Austria, Elevation")
         (ArtistID  7605)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7605])
         (Altura  "34.3")
         (Medi  "Graphite, pen, color pencil, ink, and gouache on tracing paper")
         (Data  1903)
         (Amplada  "31.8")
    )

    ([Art9] of Quadre
         (Nom  "Memorial to the Six Million Jewish Martyrs, project, New York City, New York, Perspective of central pier")
         (ArtistID  2964)
         (Esta_En  [Sala_1])
         (Es_De  [Autor2964])
         (Altura  "113.0")
         (Medi  "Charcoal and graphite on tracing paper")
         (Data  1968)
         (Amplada  "167.6")
    )

    ([Art8] of Quadre
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 1: The Park")
         (ArtistID  7056)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7056])
         (Altura  "35.6")
         (Medi  "Gelatin silver photograph")
         (Data  1976)
         (Amplada  "45.7")
    )

    ([Art5] of Quadre
         (Nom  "Villa, project, outside Vienna, Austria, Exterior perspective")
         (ArtistID  7605)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7605])
         (Altura  "38.4")
         (Medi  "Graphite, color pencil, ink, and gouache on tracing paper")
         (Data  1903)
         (Amplada  "19.1")
    )

    ([Autor8100] of Author
         (Genere  "male")
         (AnyMort  1936)
         (AnyNeixement  1869)
         (Nacionalitat  "German")
         (Nom  "Hans Poelzig")
    )

    ([Autor7470] of Author
         (Genere  "male")
         (AnyMort  1976)
         (Pinta  [Art2])
         (AnyNeixement  1944)
         (Nacionalitat  "French")
         (Nom  "Christian de Portzamparc")
    )

    ([Art2] of Quadre
         (Nom  "City of Music, National Superior Conservatory of Music and Dance, Paris, France, View from interior courtyard")
         (ArtistID  7470)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7470])
         (Altura  "40.6401")
         (Medi  "Paint and colored pencil on print")
         (Data  1987)
         (Amplada  "29.8451")
    )

    ([The_Manhattan_Transcripts_Project,_New_York,_New_York,_Episode_1:_The_Park] of Quadre
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (ArtistID  7056)
         (Esta_En  [Sala_1])
         (Es_De  [Bernard_Tschumi])
         (Altura  "35.6")
         (Medi  "Gelatin silver photograph")
         (Data  1976)
         (Amplada  "45.7")
    )

    ([Art7] of Quadre
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (ArtistID  7056)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7056])
         (Altura  "35.6")
         (Medi  "Gelatin silver photographs")
         (Data  1976)
         (Amplada  "45.7")
    )

    ([Autor7056] of Author
         (Genere  "male")
         (AnyMort  1992)
         (Pinta  [Art7] [Art8] [Art6] [Art4])
         (AnyNeixement  1944)
         (Nacionalitat  "Georgian")
         (Nom  "Bernard Tschumi")
    )

    ([Bernard_Tschumi] of Author
         (Genere  "male")
         (AnyMort  1992)
         (Pinta  [Art1] [The_Manhattan_Transcripts_Project,_New_York,_New_York,_Episode_1:_The_Park])
         (AnyNeixement  1944)
         (Nacionalitat  "Georgian")
         (Nom  "Bernard Tschumi")
    )

    ([Art4] of Quadre
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 1: The Park")
         (ArtistID  7056)
         (Esta_En  [Sala_1])
         (Es_De  [Autor7056])
         (Altura  "50.8")
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Data  1980)
         (Amplada  "50.8")
    )

    ([Otto_Wagner] of Author
         (Genere  "male")
         (AnyMort  1918)
         (AnyNeixement  1841)
         (Nacionalitat  "Austrian")
         (Nom  "Otto Wagner")
    )

    ([Autor7607] of Author
         (Genere  "male")
         (AnyMort  1969)
         (AnyNeixement  1878)
         (Nacionalitat  "Austrian")
         (Nom  "Marcel Kammerer")
    )

    ([Sala_1] of Sala
         (Nom  "Sala_1")
         (Connecta_Amb  [Sala_2])
    )

    ([Autor7608] of Author
         (Genere  "male")
         (AnyMort  1961)
         (AnyNeixement  1878)
         (Nacionalitat  "Austrian")
         (Nom  "Otto Sch�nthal")
    )

    ([Autor2964] of Author
         (Genere  "male")
         (AnyMort  1974)
         (Pinta  [Art9])
         (AnyNeixement  1901)
         (Nacionalitat  "American")
         (Nom  "Louis I. Kahn")
    )

    ([Sala_2] of Sala
         (Nom  "Sala_2")
         (Connecta_Amb  [Sala_1])
    )

    ([Autor7605] of Author
         (Genere  "male")
         (AnyMort  1957)
         (Pinta  [Art5] [Art3])
         (AnyNeixement  1876)
         (Nacionalitat  "Austrian")
         (Nom  "Emil Hoppe")
    )

    ([Art1] of Quadre
         (Nom  "Ferdinandsbr�cke Project, Vienna, Austria (Elevation, preliminary version)")
         (ArtistID  6210)
         (Esta_En  [Sala_1])
         (Es_De  [Autor6210])
         (Altura  "48.6")
         (Medi  "Ink and cut-and-pasted painted pages on paper")
         (Data  1896)
         (Amplada  "168.9")
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