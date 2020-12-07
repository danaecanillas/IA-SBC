(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Autors
        (type STRING)
        (create-accessor read-write))
    (multislot Estil
        (type STRING)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
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
)

(defclass Author
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Genere
        (type STRING)
        (create-accessor read-write))
    (single-slot AnyNeixement
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
    ;;; Un autor pinta uns quadres
    (multislot Pinta
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Hores
        (type FLOAT)
        (create-accessor read-write))
    (multislot Te
        (type INSTANCE)
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

(defclass Quadre
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Data
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Amplada
        (type FLOAT)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (multislot Esta_En
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (multislot Es_De
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
    ([The_Manhattan_Transcripts_Project,_New_York,_New_York,_Episode_1:_The_Park] of Quadre
         (Data  1976)
         (ArtistID  7056)
         (Amplada  "45.7")
         (Esta_En  [Sala_1])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Altura  "35.6")
         (Medi  "Gelatin silver photograph")
         (Es_De  [Bernard_Tschumi])
    )

    ([Bernard_Tschumi] of Author
         (Genere  "male")
         (AnyNeixement  1944)
         (Nacionalitat  "Georgian")
         (AnyMort  1992)
         (Pinta  [The_Manhattan_Transcripts_Project,_New_York,_New_York,_Episode_1:_The_Park])
    )

    ([Otto] of Author
         (Nom  "Otto Wagner")
         (Genere  "male")
         (AnyNeixement  1841)
         (Nacionalitat  "Austrian")
         (AnyMort  1918)
    )

    ([Sala_2] of Sala
         (Connecta_Amb  [Sala_1])
    )

    ([Sala_1] of Sala
         (Connecta_Amb  [Sala_2])
    )

)
