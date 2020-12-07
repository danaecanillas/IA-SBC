(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Te
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Quadre
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Un quadre esta situat en una sala dins del museu
    (multislot Esta_En
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (multislot Es_De
        (type INSTANCE)
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

(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Author
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Un autor pinta uns quadres
    (multislot Pinta
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
    ([Bernard_Tschumi] of Author
         (Pinta  [The_Manhattan_Transcripts_Project,_New_York,_New_York,_Episode_1:_The_Park])
    )

    ([Sala_1] of Sala
         (Connecta_Amb  [Sala_2])
    )

    ([Sala_2] of Sala
         (Connecta_Amb  [Sala_1])
    )

    ([The_Manhattan_Transcripts_Project,_New_York,_New_York,_Episode_1:_The_Park] of Quadre
         (Esta_En  [Sala_1])
         (Es_De  [Bernard_Tschumi])
    )

    ([Otto] of Author
    )

)
