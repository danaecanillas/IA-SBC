;;------------------------------------------------------------------------------
;;------------------------------------------------------------------------------
;;
;;                PRACTICA 2 IA: SBC
;;
;; Alumnos: Dànae Canillas
;;          Miquel Escobar
;;          Arnau Soler
;;------------------------------------------------------------------------------
;;------------------------------------------------------------------------------

;;------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;------------------------------------------------------------------------------

(defclass Estil
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Pintors_Estil
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (multislot Quadres_Estil
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Author
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
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
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Quadre
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Amplada
        (type FLOAT)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (single-slot Esta_En
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
    (single-slot Data
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Estil
        (type STRING)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (single-slot Es_De
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Estil_Quadre
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
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (single-slot Dies
        (type INTEGER)
        (create-accessor read-write))
    (multislot Te
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Hores
        (type FLOAT)
        (create-accessor read-write))
    (multislot Tipus
        (type SYMBOL)
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

(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Estil
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
    ([Art24] of Quadre
         (Amplada  "78.7")
         (Esta_En  [Sala_9])
         (Medi  "Ink on tracing paper")
         (Data  1980)
         (Estil  "Arte Naif")
         (Altura  "48.3")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art79] of Quadre
         (Amplada  "107.9502")
         (Esta_En  [Sala_6])
         (Medi  "Graphite and watercolor on paper")
         (Data  1985)
         (Estil  "Cubismo")
         (Altura  "52.0701")
         (Es_De  [Autor2702])
         (Nom  "Berkowitz House, Martha's Vineyard, Massachusetts, Exterior perspective")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art78] of Quadre
         (Amplada  "17.8")
         (Esta_En  [Sala_3])
         (Medi  "Graphite on tracing paper")
         (Data  1914)
         (Estil  "Expresionismo")
         (Altura  "34.9")
         (Es_De  [Autor8219])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspectives and elevation")
         (Rellevancia  3)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Art70] of Quadre
         (Amplada  "55.9")
         (Esta_En  [Sala_6])
         (Medi  "Ink and graphite on paper")
         (Data  1977)
         (Estil  "Expresionismo")
         (Altura  "34.3")
         (Es_De  [Autor2702])
         (Nom  "Gymnasium-Bridge Project, New York, New York, Perspective")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil3])
    )

    ([Art7] of Quadre
         (Amplada  "45.7")
         (Esta_En  [Sala_9])
         (Medi  "Gelatin silver photographs")
         (Data  1976)
         (Estil  "Expresionismo")
         (Altura  "35.6")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Art67] of Quadre
         (Amplada  "83.8")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper")
         (Data  1937)
         (Estil  "Surrealismo")
         (Altura  "29.5")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Exterior elevation of loggia")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art14] of Quadre
         (Amplada  "50.8")
         (Esta_En  [Sala_9])
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Data  1980)
         (Estil  "Expresionismo")
         (Altura  "50.8")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 3: The Tower (The Fall)")
         (Rellevancia  1)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Art90] of Quadre
         (Amplada  "28.7338")
         (Esta_En  [Sala_3])
         (Medi  "Graphite and color pencil on tracing paper")
         (Data  1924)
         (Estil  "Expresionismo")
         (Altura  "34.2901")
         (Es_De  [Autor8219])
         (Nom  "Residence of Salman Schocken, Jerusalem, Israel, Perspective and elevation")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Autor5076] of Author
         (Genere  "male")
         (Pinta  [Art97] [Art95] [Art99])
         (AnyNeixement  1918)
         (Nacionalitat  "American")
         (Nom  "Paul Rudolph")
         (AnyMort  1997)
    )

    ([Art4] of Quadre
         (Amplada  "50.8")
         (Esta_En  [Sala_9])
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Data  1980)
         (Estil  "Expresionismo")
         (Altura  "50.8")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 1: The Park")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Autor1863] of Author
         (Genere  "male")
         (Pinta  [Art29] [Art33] [Art31])
         (AnyNeixement  1949)
         (Nacionalitat  "American")
         (Nom  "Roger C. Ferri")
         (AnyMort  1991)
    )

    ([Art94] of Quadre
         (Amplada  "36.8")
         (Esta_En  [Sala_3])
         (Medi  "Graphite on tracing paper")
         (Data  1933)
         (Estil  "Arte Naif")
         (Altura  "30.2")
         (Es_De  [Autor8219])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspectives and elevation")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Art27] of Quadre
         (Amplada  "41.0")
         (Esta_En  [Sala_6])
         (Medi  "Colored pencil and graphite on tracing paper")
         (Data  1918)
         (Estil  "Clasicismo")
         (Altura  "37.1")
         (Es_De  [Autor8100])
         (Nom  "Concert Hall Project, Dresden, Germany (Interior perspective of preliminary scheme)")
         (Rellevancia  2)
         (ArtistID  8100)
         (Estil_Quadre  [Estil1])
    )

    ([Art99] of Quadre
         (Amplada  "87.0")
         (Esta_En  [Sala_6])
         (Medi  "Graphite and colored pencil on paper")
         (Data  1958)
         (Estil  "Arte Pop")
         (Altura  "69.2")
         (Es_De  [Autor5076])
         (Nom  "Yale University, Art and Architecture Building, New Haven, Connecticut, Elevation")
         (Rellevancia  4)
         (ArtistID  5076)
         (Estil_Quadre  [Estil7])
    )

    ([Art3] of Quadre
         (Amplada  "31.8")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, pen, color pencil, ink, and gouache on tracing paper")
         (Data  1903)
         (Estil  "Expresionismo")
         (Altura  "34.3")
         (Es_De  [Autor7605])
         (Nom  "Villa near Vienna Project, Outside Vienna, Austria, Elevation")
         (Rellevancia  2)
         (ArtistID  7605)
         (Estil_Quadre  [Estil3])
    )

    ([Art25] of Quadre
         (Amplada  "78.7")
         (Esta_En  [Sala_9])
         (Medi  "Ink and cut-and-pasted gelatin silver photographs on tracing paper")
         (Data  1980)
         (Estil  "Arte Naif")
         (Altura  "48.3")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block,")
         (Rellevancia  1)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art50] of Quadre
         (Amplada  "93.3")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper")
         (Data  1910)
         (Estil  "Surrealismo")
         (Altura  "91.4")
         (Es_De  [Autor27])
         (Nom  "Public Library, Stockholm, Sweden, Elevation of front facade")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art77] of Quadre
         (Amplada  "103.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite on vellum")
         (Data  1984)
         (Estil  "Cubismo")
         (Altura  "52.1")
         (Es_De  [Autor2702])
         (Nom  "Autonomous Artisans' House, project, New York (Staten Island), New York, Perspective")
         (Rellevancia  3)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Sala_8] of Sala
         (Nom  "8")
    )

    ([Autor7607] of Author
         (Genere  "male")
         (Pinta  [Art11])
         (AnyNeixement  1878)
         (Nacionalitat  "Austrian")
         (Nom  "Marcel Kammerer")
         (AnyMort  1969)
    )

    ([Art47] of Quadre
         (Amplada  "55.5")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper mounted on board")
         (Data  1923)
         (Estil  "Arte Naif")
         (Altura  "47.9")
         (Es_De  [Autor27])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Floor plan of mezzanine")
         (Rellevancia  2)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art44] of Quadre
         (Amplada  "79.4")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper mounted on board")
         (Data  1923)
         (Estil  "Surrealismo")
         (Altura  "56.8")
         (Es_De  [Autor27])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Elevation of front of auditorium")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art62] of Quadre
         (Amplada  "83.5")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper mounted on board")
         (Data  1935)
         (Estil  "Surrealismo")
         (Altura  "30.5")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: Two sections")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art34] of Quadre
         (Amplada  "30.2")
         (Esta_En  [Sala_8])
         (Medi  "Graphite and crayon on yellow tracing paper")
         (Data  1978)
         (Estil  "Surrealismo")
         (Altura  "30.2")
         (Es_De  [Autor2308])
         (Nom  "Fargo-Moorhead Cultural Center Bridge, project, Fargo, North Dakota and Moorhead, Minnesota, South elevation")
         (Rellevancia  4)
         (ArtistID  2308)
         (Estil_Quadre  [Estil8])
    )

    ([Art65] of Quadre
         (Amplada  "41.9")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper")
         (Data  1935)
         (Estil  "Arte Naif")
         (Altura  "41.9")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, First version: ground floor plan")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Sala_10] of Sala
         (Nom  "10")
    )

    ([Sala_9] of Sala
         (Nom  "9")
    )

    ([Art31] of Quadre
         (Amplada  "110.8077")
         (Esta_En  [Sala_9])
         (Medi  "Ink and pastel on paper")
         (Data  1979)
         (Estil  "Fauvismo")
         (Altura  "141.6053")
         (Es_De  [Autor1863])
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Developed plan and section elevations)")
         (Rellevancia  3)
         (ArtistID  1863)
         (Estil_Quadre  [Estil9])
    )

    ([Estil6] of Estil
         (Pintors_Estil  [Autor2964])
         (Nom  "Romanticismo")
         (Quadres_Estil  [Art9])
    )

    ([Autor8100] of Author
         (Genere  "male")
         (Pinta  [Art27])
         (AnyNeixement  1869)
         (Nacionalitat  "German")
         (Nom  "Hans Poelzig")
         (AnyMort  1936)
    )

    ([Sala_3] of Sala
         (Nom  "Sala_3")
         (Connecta_Amb  [Sala_2])
    )

    ([Estil7] of Estil
         (Pintors_Estil  [Autor7607] [Autor5076] [Autor7608])
         (Nom  "Arte Pop")
         (Quadres_Estil  [Art11] [Art95] [Art97] [Art99] [Art13])
    )

    ([Sala_6] of Sala
         (Nom  "6")
    )

    ([Art19] of Quadre
         (Amplada  "61.0")
         (Esta_En  [Sala_9])
         (Medi  "Ink on tracing paper")
         (Data  1979)
         (Estil  "Arte Naif")
         (Altura  "121.9")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall),")
         (Rellevancia  1)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Sala_0] of Sala
         (Nom  "Entrada")
         (Connecta_Amb  [Sala_1] [Sala_2])
    )

    ([Art59] of Quadre
         (Amplada  "83.5")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper mounted on board")
         (Data  1935)
         (Estil  "Surrealismo")
         (Altura  "30.8")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: exterior elevation")
         (Rellevancia  5)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art83] of Quadre
         (Amplada  "56.8")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Cubismo")
         (Altura  "75.6")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, Garden of Sounds, perspective and plan")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art80] of Quadre
         (Amplada  "13.6525")
         (Esta_En  [Sala_3])
         (Medi  "Graphite on copy paper")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "21.59")
         (Es_De  [Autor8219])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspectives")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Estil4] of Estil
         (Pintors_Estil  [Autor7605] [Autor2702])
         (Nom  "Cubismo")
         (Quadres_Estil  [Art93] [Art79] [Art83] [Art77] [Art81] [Art5] [Art85] [Art72] [Art89] [Art87])
    )

    ([Art64] of Quadre
         (Amplada  "46.7")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper")
         (Data  1921)
         (Estil  "Surrealismo")
         (Altura  "19.7")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, First version: exterior perspective")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art36] of Quadre
         (Amplada  "27.3")
         (Esta_En  [Sala_8])
         (Medi  "Graphite, ink and crayon on paper")
         (Data  1978)
         (Estil  "Clasicismo")
         (Altura  "27.6")
         (Es_De  [Autor2308])
         (Nom  "French & Company, project, New York (Manhattan), New York, Facade study")
         (Rellevancia  1)
         (ArtistID  2308)
         (Estil_Quadre  [Estil1])
    )

    ([Art81] of Quadre
         (Amplada  "56.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Cubismo")
         (Altura  "75.6")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, View from court of four-sided pentagon, perspective, site plan")
         (Rellevancia  1)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art35] of Quadre
         (Amplada  "60.0")
         (Esta_En  [Sala_8])
         (Medi  "Ink and graphite on paper")
         (Data  1978)
         (Estil  "Surrealismo")
         (Altura  "59.7")
         (Es_De  [Autor2308])
         (Nom  "Vacation House Project, Aspen, Colorado, Elevations, interior and exterior perspectives and plan")
         (Rellevancia  3)
         (ArtistID  2308)
         (Estil_Quadre  [Estil8])
    )

    ([Art61] of Quadre
         (Amplada  "83.8")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper mounted on board")
         (Data  1935)
         (Estil  "Arte Naif")
         (Altura  "30.8")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: exterior elevation and section")
         (Rellevancia  5)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art17] of Quadre
         (Amplada  "60.9601")
         (Esta_En  [Sala_9])
         (Medi  "Ink and transfer on tracing paper")
         (Data  1979)
         (Estil  "Arte Naif")
         (Altura  "121.9202")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art86] of Quadre
         (Amplada  "29.2101")
         (Esta_En  [Sala_3])
         (Medi  "Graphite on tracing paper")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "36.8301")
         (Es_De  [Autor8219])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspectives of the medical school and auditorium")
         (Rellevancia  1)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Art84] of Quadre
         (Amplada  "29.2")
         (Esta_En  [Sala_3])
         (Medi  "Graphite and color pencil on tracing paper")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "36.2")
         (Es_De  [Autor8219])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Interior perspective and details of furniture")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Art2] of Quadre
         (Amplada  "29.8451")
         (Esta_En  [Sala_3])
         (Medi  "Paint and colored pencil on print")
         (Data  1987)
         (Estil  "Abstractismo")
         (Altura  "40.6401")
         (Es_De  [Autor7470])
         (Nom  "City of Music, National Superior Conservatory of Music and Dance, Paris, France, View from interior courtyard")
         (Rellevancia  2)
         (ArtistID  7470)
         (Estil_Quadre  [Estil2])
    )

    ([Art97] of Quadre
         (Amplada  "47.9")
         (Esta_En  [Sala_6])
         (Medi  "Ink and printed polymer sheet on paper")
         (Data  1949)
         (Estil  "Arte Pop")
         (Altura  "64.8")
         (Es_De  [Autor5076])
         (Nom  "Finney Guest House Project, Siesta Key, Florida, Aerial perspective")
         (Rellevancia  4)
         (ArtistID  5076)
         (Estil_Quadre  [Estil7])
    )

    ([Estil2] of Estil
         (Pintors_Estil  [Autor7470])
         (Nom  "Abstractismo")
         (Quadres_Estil  [Art2])
    )

    ([Autor7056] of Author
         (Genere  "male")
         (Pinta  [Art7] [Art8] [Art32] [Art4] [Art12] [Art16] [Art25] [Art10] [Art17] [Art18] [Art30] [Art22] [Art21] [Art14] [Art26] [Art23] [Art6] [Art19] [Art20] [Art24])
         (AnyNeixement  1944)
         (Nacionalitat  "Georgian")
         (Nom  "Bernard Tschumi")
         (AnyMort  1992)
    )

    ([Art63] of Quadre
         (Amplada  "62.9")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper")
         (Data  1891)
         (Estil  "Surrealismo")
         (Altura  "26.0")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior perspective")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art57] of Quadre
         (Amplada  "83.5")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper mounted on board")
         (Data  1935)
         (Estil  "Surrealismo")
         (Altura  "30.5")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: section and two exterior elevations")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art5] of Quadre
         (Amplada  "19.1")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, color pencil, ink, and gouache on tracing paper")
         (Data  1903)
         (Estil  "Cubismo")
         (Altura  "38.4")
         (Es_De  [Autor7605])
         (Nom  "Villa, project, outside Vienna, Austria, Exterior perspective")
         (Rellevancia  3)
         (ArtistID  7605)
         (Estil_Quadre  [Estil4])
    )

    ([Autor27] of Author
         (Genere  "male")
         (Pinta  [Art47] [Art50] [Art55] [Art51] [Art53] [Art48] [Art66] [Art54] [Art56] [Art38] [Art57] [Art62] [Art49] [Art58] [Art42] [Art67] [Art60] [Art59] [Art41] [Art39] [Art61] [Art52] [Art45] [Art43] [Art63] [Art46] [Art68] [Art40] [Art44] [Art64] [Art65])
         (AnyNeixement  1885)
         (Nacionalitat  "Swedish")
         (Nom  "Erik Gunnar Asplund")
         (AnyMort  1940)
    )

    ([Estil8] of Estil
         (Pintors_Estil  [Autor27] [Autor7608] [Autor2308])
         (Nom  "Surrealismo")
         (Quadres_Estil  [Art59] [Art41] [Art38] [Art45] [Art43] [Art63] [Art60] [Art67] [Art34] [Art50] [Art39] [Art15] [Art68] [Art44] [Art64] [Art57] [Art62] [Art35] [Art58])
    )

    ([Art29] of Quadre
         (Amplada  "110.8")
         (Esta_En  [Sala_9])
         (Medi  "Ink and pastel on paper")
         (Data  1979)
         (Estil  "Fauvismo")
         (Altura  "141.6")
         (Es_De  [Autor1863])
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Structural details)")
         (Rellevancia  4)
         (ArtistID  1863)
         (Estil_Quadre  [Estil9])
    )

    ([Estil3] of Estil
         (Pintors_Estil  [Autor7056] [Autor8219] [Autor2702] [Autor8101] [Autor7605])
         (Nom  "Expresionismo")
         (Quadres_Estil  [Art70] [Art98] [Art14] [Art26] [Art92] [Art96] [Art6] [Art75] [Art32] [Art4] [Art76] [Art10] [Art7] [Art78] [Art21] [Art90] [Art69] [Art3] [Art71] [Art74] [Art91])
    )

    ([Art51] of Quadre
         (Amplada  "93.0")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper with paper backing")
         (Data  1927)
         (Estil  "Arte Naif")
         (Altura  "90.8")
         (Es_De  [Autor27])
         (Nom  "Public Library, Stockholm, Sweden, Elevation of west facade")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Sala_2] of Sala
         (Nom  "Sala_2")
         (Connecta_Amb  [Sala_0] [Sala_3] [Sala_4])
    )

    ([Art39] of Quadre
         (Amplada  "61.9")
         (Esta_En  [Sala_2])
         (Medi  "Ink on ozalid")
         (Data  1917)
         (Estil  "Surrealismo")
         (Altura  "31.1")
         (Es_De  [Autor27])
         (Nom  "Villa Snellman, Djursholm, Sweden, Exterior elevation")
         (Rellevancia  2)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art15] of Quadre
         (Amplada  "35.8")
         (Esta_En  [Sala_9])
         (Medi  "Pencil, ink, colored pencil, and gouache on paper")
         (Data  1906)
         (Estil  "Surrealismo")
         (Altura  "29.6")
         (Es_De  [Autor7608])
         (Nom  "Imperial Post Office, Teschen, Austria (Elevation)")
         (Rellevancia  3)
         (ArtistID  7608)
         (Estil_Quadre  [Estil8])
    )

    ([Estil5] of Estil
         (Pintors_Estil  [Autor27] [Autor8219] [Autor7056])
         (Nom  "Arte Naif")
         (Quadres_Estil  [Art51] [Art53] [Art19] [Art48] [Art20] [Art66] [Art30] [Art54] [Art24] [Art22] [Art80] [Art52] [Art86] [Art49] [Art42] [Art84] [Art16] [Art25] [Art61] [Art17] [Art18] [Art73] [Art94] [Art82] [Art46] [Art56] [Art8] [Art40] [Art88] [Art47] [Art12] [Art65] [Art23] [Art55])
    )

    ([Art26] of Quadre
         (Amplada  "78.7")
         (Esta_En  [Sala_9])
         (Medi  "Ink and cut-and-pasted gelatin silver photographs on tracing paper")
         (Data  1980)
         (Estil  "Expresionismo")
         (Altura  "48.3")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 4: The Block")
         (Rellevancia  3)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Sala_7] of Sala
         (Nom  "7")
    )

    ([Art92] of Quadre
         (Amplada  "24.1")
         (Esta_En  [Sala_3])
         (Medi  "Graphite and color pencil on tracing paper")
         (Data  1936)
         (Estil  "Expresionismo")
         (Altura  "35.2")
         (Es_De  [Autor8219])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Israel, Perspectives and elevation")
         (Rellevancia  1)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Art42] of Quadre
         (Amplada  "62.5")
         (Esta_En  [Sala_2])
         (Medi  "Ink on ozalid")
         (Data  1917)
         (Estil  "Arte Naif")
         (Altura  "57.2")
         (Es_De  [Autor27])
         (Nom  "Villa Snellman, Djursholm, Sweden, Ground-floor plan")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art75] of Quadre
         (Amplada  "33.0")
         (Esta_En  [Sala_6])
         (Medi  "Graphite and watercolor on paper")
         (Data  1980)
         (Estil  "Expresionismo")
         (Altura  "8.3")
         (Es_De  [Autor2702])
         (Nom  "Autonomous Artisans' House, project, Staten Island, New York, Perspective")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil3])
    )

    ([Art56] of Quadre
         (Amplada  "51.1")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper")
         (Data  1935)
         (Estil  "Arte Naif")
         (Altura  "39.4")
         (Es_De  [Autor27])
         (Nom  "Law Courts Annex, Gothenburg, Sweden, Plan of courtroom and section of desk")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art1] of Quadre
         (Amplada  "168.9")
         (Esta_En  [Sala_10])
         (Medi  "Ink and cut-and-pasted painted pages on paper")
         (Data  1896)
         (Estil  "Clasicismo")
         (Altura  "48.6")
         (Es_De  [Autor6210])
         (Nom  "Ferdinandsbr�cke Project, Vienna, Austria (Elevation, preliminary version)")
         (Rellevancia  4)
         (ArtistID  6210)
         (Estil_Quadre  [Estil1])
    )

    ([Sala_5] of Sala
         (Nom  "5")
    )

    ([Autor2964] of Author
         (Genere  "male")
         (Pinta  [Art9])
         (AnyNeixement  1901)
         (Nacionalitat  "American")
         (Nom  "Louis I. Kahn")
         (AnyMort  1974)
    )

    ([Art93] of Quadre
         (Amplada  "56.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Cubismo")
         (Altura  "75.6")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, Passage below water basin, perspective and plan")
         (Rellevancia  5)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art6] of Quadre
         (Amplada  "45.7")
         (Esta_En  [Sala_9])
         (Medi  "Gelatin silver photograph")
         (Data  1976)
         (Estil  "Expresionismo")
         (Altura  "35.6")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Rellevancia  4)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Art66] of Quadre
         (Amplada  "101.6")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper")
         (Data  1930)
         (Estil  "Arte Naif")
         (Altura  "65.4")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Exterior-perspective study")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art16] of Quadre
         (Amplada  "61.0")
         (Esta_En  [Sala_9])
         (Medi  "Ink on tracing paper")
         (Data  1979)
         (Estil  "Arte Naif")
         (Altura  "121.9")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Rellevancia  1)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art37] of Quadre
         (Amplada  "20.3")
         (Esta_En  [Sala_8])
         (Medi  "Graphite and Prismacolor crayon on tracing paper")
         (Data  1978)
         (Estil  "Clasicismo")
         (Altura  "20.3")
         (Es_De  [Autor2308])
         (Nom  "Vacation House, project, Aspen, Colorado, Fireplace")
         (Rellevancia  2)
         (ArtistID  2308)
         (Estil_Quadre  [Estil1])
    )

    ([Art53] of Quadre
         (Amplada  "90.8")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper")
         (Data  1915)
         (Estil  "Arte Naif")
         (Altura  "90.8")
         (Es_De  [Autor27])
         (Nom  "Public Library, Stockholm, Sweden, Plan of first and second galleries")
         (Rellevancia  4)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art40] of Quadre
         (Amplada  "61.6")
         (Esta_En  [Sala_2])
         (Medi  "Ink on ozalid")
         (Data  1917)
         (Estil  "Arte Naif")
         (Altura  "31.8")
         (Es_De  [Autor27])
         (Nom  "Villa Snellman, Djursholm, Sweden, Exterior elevation")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art18] of Quadre
         (Amplada  "61.0")
         (Esta_En  [Sala_9])
         (Medi  "Ink on tracing paper")
         (Data  1980)
         (Estil  "Arte Naif")
         (Altura  "121.9")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Rellevancia  4)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art60] of Quadre
         (Amplada  "83.3")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper on board")
         (Data  1935)
         (Estil  "Surrealismo")
         (Altura  "30.8")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior elevation")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art82] of Quadre
         (Amplada  "35.8776")
         (Esta_En  [Sala_3])
         (Medi  "Colored pencil on tracing paper")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "27.3051")
         (Es_De  [Autor8219])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspective")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Art45] of Quadre
         (Amplada  "79.1")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper mounted on board")
         (Data  1923)
         (Estil  "Surrealismo")
         (Altura  "57.2")
         (Es_De  [Autor27])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Elevation of rear of auditorium")
         (Rellevancia  5)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art30] of Quadre
         (Amplada  "94.7739")
         (Esta_En  [Sala_9])
         (Medi  "Pen, ink, gouache, and airbrush on paper")
         (Data  1984)
         (Estil  "Arte Naif")
         (Altura  "94.4564")
         (Es_De  [Autor7056])
         (Nom  "Parc de la Villette, Le Case Vide, Paris, France (Axonometric of folly)")
         (Rellevancia  4)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art71] of Quadre
         (Amplada  "29.2")
         (Esta_En  [Sala_3])
         (Medi  "Graphite and color pencil on tracing paper")
         (Data  1935)
         (Estil  "Expresionismo")
         (Altura  "35.6")
         (Es_De  [Autor8219])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Interior perspectives")
         (Rellevancia  4)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Art55] of Quadre
         (Amplada  "70.5")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "30.5")
         (Es_De  [Autor27])
         (Nom  "Law Courts Annex, Gothenburg, Sweden, Exterior elevation")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Autor7470] of Author
         (Genere  "male")
         (Pinta  [Art2])
         (AnyNeixement  1944)
         (Nacionalitat  "French")
         (Nom  "Christian de Portzamparc")
         (AnyMort  1976)
    )

    ([Art23] of Quadre
         (Amplada  "78.7")
         (Esta_En  [Sala_9])
         (Medi  "Ink and photographs on tracing paper")
         (Data  1980)
         (Estil  "Arte Naif")
         (Altura  "48.2")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (Rellevancia  3)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Sala_4] of Sala
         (Nom  "Sortida")
         (Connecta_Amb  [Sala_1] [Sala_2])
    )

    ([Art49] of Quadre
         (Amplada  "26.7")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper mounted on board")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "21.0")
         (Es_De  [Autor27])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Perspective of promenade")
         (Rellevancia  2)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art74] of Quadre
         (Amplada  "150.2")
         (Esta_En  [Sala_6])
         (Medi  "Silkscreen")
         (Data  1958)
         (Estil  "Expresionismo")
         (Altura  "55.2")
         (Es_De  [Autor8101])
         (Nom  "Helium Bridge Project")
         (Rellevancia  3)
         (ArtistID  8101)
         (Estil_Quadre  [Estil3])
    )

    ([Art41] of Quadre
         (Amplada  "34.0")
         (Esta_En  [Sala_2])
         (Medi  "Graphite and crayon on tracing paper mounted on board")
         (Data  1917)
         (Estil  "Surrealismo")
         (Altura  "39.4")
         (Es_De  [Autor27])
         (Nom  "Villa Snellman, Djursholm, Sweden, Site plan")
         (Rellevancia  5)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art38] of Quadre
         (Amplada  "34.9")
         (Esta_En  [Sala_2])
         (Medi  "Graphite and crayon on tracing paper mounted on board")
         (Data  1917)
         (Estil  "Surrealismo")
         (Altura  "23.2")
         (Es_De  [Autor27])
         (Nom  "Villa Snellman, Djursholm, Sweden, Elevation of garden facade, sketch")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art9] of Quadre
         (Amplada  "167.6")
         (Esta_En  [Sala_5])
         (Medi  "Charcoal and graphite on tracing paper")
         (Data  1968)
         (Estil  "Romanticismo")
         (Altura  "113.0")
         (Es_De  [Autor2964])
         (Nom  "Memorial to the Six Million Jewish Martyrs, project, New York City, New York, Perspective of central pier")
         (Rellevancia  4)
         (ArtistID  2964)
         (Estil_Quadre  [Estil6])
    )

    ([Art48] of Quadre
         (Amplada  "29.8")
         (Esta_En  [Sala_2])
         (Medi  "Ink and graphite on tracing paper mounted on board")
         (Data  1931)
         (Estil  "Arte Naif")
         (Altura  "33.0")
         (Es_De  [Autor27])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Perspective of staircase")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art52] of Quadre
         (Amplada  "93.7")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper with paper backing")
         (Data  1933)
         (Estil  "Arte Naif")
         (Altura  "90.2")
         (Es_De  [Autor27])
         (Nom  "Public Library, Stockholm, Sweden, Section")
         (Rellevancia  3)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art20] of Quadre
         (Amplada  "61.0")
         (Esta_En  [Sala_9])
         (Medi  "Ink and photographic reproductions on tracing paper")
         (Data  1979)
         (Estil  "Arte Naif")
         (Altura  "121.9")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Rellevancia  1)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Autor2308] of Author
         (Genere  "male")
         (Pinta  [Art35] [Art36] [Art34] [Art37])
         (AnyNeixement  1934)
         (Nacionalitat  "American")
         (Nom  "Michael Graves")
         (AnyMort  2015)
    )

    ([Art11] of Quadre
         (Amplada  "31.4")
         (Esta_En  [Sala_6])
         (Medi  "Ink, graphite, watercolor, gouache, and airbrush on paper")
         (Data  1900)
         (Estil  "Arte Pop")
         (Altura  "47.9")
         (Es_De  [Autor7607])
         (Nom  "Royal Hunting Tent, project, Exterior perspective")
         (Rellevancia  2)
         (ArtistID  7607)
         (Estil_Quadre  [Estil7])
    )

    ([Autor7608] of Author
         (Genere  "male")
         (Pinta  [Art15] [Art13])
         (AnyNeixement  1878)
         (Nacionalitat  "Austrian")
         (Nom  "Otto Sch�nthal")
         (AnyMort  1961)
    )

    ([Art96] of Quadre
         (Amplada  "37.5")
         (Esta_En  [Sala_3])
         (Medi  "Graphite on tracing paper")
         (Data  1938)
         (Estil  "Expresionismo")
         (Altura  "29.8")
         (Es_De  [Autor8219])
         (Nom  "Gated Wall, Perspective and elevation")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Estil9] of Estil
         (Pintors_Estil  [Autor47] [Autor1863])
         (Nom  "Fauvismo")
         (Quadres_Estil  [Art31] [Art29] [Art33] [Art28])
    )

    ([Art58] of Quadre
         (Amplada  "83.8")
         (Esta_En  [Sala_2])
         (Medi  "Graphite on tracing paper mounted on board")
         (Data  1935)
         (Estil  "Surrealismo")
         (Altura  "30.8")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior elevation")
         (Rellevancia  2)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art54] of Quadre
         (Amplada  "33.0")
         (Esta_En  [Sala_2])
         (Medi  "Gouache on board")
         (Data  1930)
         (Estil  "Arte Naif")
         (Altura  "52.7")
         (Es_De  [Autor27])
         (Nom  "Stockholm Exhibition, Stockholm, Sweden (Elevation of advertising tower)")
         (Rellevancia  1)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Art91] of Quadre
         (Amplada  "56.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Expresionismo")
         (Altura  "75.6")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, Water basin, amphitheater, and jack-up rig, perspective and plan")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil3])
    )

    ([Art88] of Quadre
         (Amplada  "40.6401")
         (Esta_En  [Sala_3])
         (Medi  "Colored pencil on tracing paper")
         (Data  1936)
         (Estil  "Arte Naif")
         (Altura  "21.9075")
         (Es_De  [Autor8219])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspective")
         (Rellevancia  1)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Art32] of Quadre
         (Amplada  "99.6952")
         (Esta_En  [Sala_9])
         (Medi  "Pen, ink, and gouache on paper")
         (Data  1986)
         (Estil  "Expresionismo")
         (Altura  "69.2151")
         (Es_De  [Autor7056])
         (Nom  "Parc de la Villette, Paris, France, Aerial perspective of follies")
         (Rellevancia  4)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Art28] of Quadre
         (Amplada  "135.8903")
         (Esta_En  [Sala_4])
         (Medi  "Graphite")
         (Data  1970)
         (Estil  "Fauvismo")
         (Altura  "87.3127")
         (Es_De  [Autor47])
         (Nom  "Earth-Cloud House, project")
         (Rellevancia  2)
         (ArtistID  47)
         (Estil_Quadre  [Estil9])
    )

    ([Art21] of Quadre
         (Amplada  "50.8")
         (Esta_En  [Sala_9])
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Data  1980)
         (Estil  "Expresionismo")
         (Altura  "50.8")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 4: The Block")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Autor8219] of Author
         (Genere  "male")
         (Pinta  [Art84] [Art88] [Art71] [Art76] [Art78] [Art80] [Art90] [Art94] [Art82] [Art86] [Art96] [Art98] [Art73] [Art92])
         (AnyNeixement  1887)
         (Nacionalitat  "American")
         (Nom  "Erich Mendelsohn")
         (AnyMort  1953)
    )

    ([Art69] of Quadre
         (Amplada  "30.2")
         (Esta_En  [Sala_6])
         (Medi  "Graphite on paper")
         (Data  1977)
         (Estil  "Expresionismo")
         (Altura  "33.3")
         (Es_De  [Autor2702])
         (Nom  "Gymnasium-Bridge, project, New York City, New York, Perspective")
         (Rellevancia  1)
         (ArtistID  2702)
         (Estil_Quadre  [Estil3])
    )

    ([Autor7605] of Author
         (Genere  "male")
         (Pinta  [Art3] [Art5])
         (AnyNeixement  1876)
         (Nacionalitat  "Austrian")
         (Nom  "Emil Hoppe")
         (AnyMort  1957)
    )

    ([Art85] of Quadre
         (Amplada  "56.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Cubismo")
         (Altura  "75.6")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, New subway station opening onto elongated gap, perspective and plan")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art8] of Quadre
         (Amplada  "45.7")
         (Esta_En  [Sala_9])
         (Medi  "Gelatin silver photograph")
         (Data  1976)
         (Estil  "Arte Naif")
         (Altura  "35.6")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 1: The Park")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art68] of Quadre
         (Amplada  "158.8")
         (Esta_En  [Sala_2])
         (Medi  "Ink and graphite on drafting cloth")
         (Data  1937)
         (Estil  "Surrealismo")
         (Altura  "49.2")
         (Es_De  [Autor27])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Exterior elevation, final version")
         (Rellevancia  4)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art10] of Quadre
         (Amplada  "50.8")
         (Esta_En  [Sala_9])
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Data  1980)
         (Estil  "Expresionismo")
         (Altura  "50.8")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 2: The Street (Border Crossing)")
         (Rellevancia  5)
         (ArtistID  7056)
         (Estil_Quadre  [Estil3])
    )

    ([Art46] of Quadre
         (Amplada  "55.2")
         (Esta_En  [Sala_2])
         (Medi  "Ink on paper mounted on board")
         (Data  1923)
         (Estil  "Arte Naif")
         (Altura  "47.9")
         (Es_De  [Autor27])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Plan of ground floor")
         (Rellevancia  2)
         (ArtistID  27)
         (Estil_Quadre  [Estil5])
    )

    ([Autor2702] of Author
         (Genere  "male")
         (Pinta  [Art87] [Art75] [Art79] [Art91] [Art72] [Art85] [Art70] [Art93] [Art69] [Art77] [Art81] [Art89] [Art83])
         (AnyNeixement  1947)
         (Nacionalitat  "American")
         (Nom  "Steven Holl")
         (AnyMort  1984)
    )

    ([Autor47] of Author
         (Genere  "male")
         (Pinta  [Art28])
         (AnyNeixement  1933)
         (Nacionalitat  "American")
         (Nom  "Raimund Abraham")
         (AnyMort  2010)
    )

    ([Art12] of Quadre
         (Amplada  "817.8816")
         (Esta_En  [Sala_9])
         (Medi  "Ink, charcoal, graphite, cut-and-pasted photographic reproductions, Letraset type, and color pencil on tracing paper")
         (Data  1978)
         (Estil  "Arte Naif")
         (Altura  "60.9601")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 2: The Street (Border Crossing)")
         (Rellevancia  2)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Art98] of Quadre
         (Amplada  "29.2")
         (Esta_En  [Sala_3])
         (Medi  "Graphite on tracing paper")
         (Data  1923)
         (Estil  "Expresionismo")
         (Altura  "41.9")
         (Es_De  [Autor8219])
         (Nom  "Gated Wall, Perspective and elevation")
         (Rellevancia  2)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Art89] of Quadre
         (Amplada  "56.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Cubismo")
         (Altura  "75.6")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, Subway station and shops, ticket-taker tower, perspective and plan")
         (Rellevancia  4)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art76] of Quadre
         (Amplada  "35.9")
         (Esta_En  [Sala_3])
         (Medi  "Graphite and color pencil on tracing paper")
         (Data  1910)
         (Estil  "Expresionismo")
         (Altura  "20.3")
         (Es_De  [Autor8219])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Elevations")
         (Rellevancia  3)
         (ArtistID  8219)
         (Estil_Quadre  [Estil3])
    )

    ([Art72] of Quadre
         (Amplada  "75.6")
         (Esta_En  [Sala_6])
         (Medi  "Graphite on paper")
         (Data  1977)
         (Estil  "Cubismo")
         (Altura  "55.9")
         (Es_De  [Autor2702])
         (Nom  "Gymnasium Bridge, project, New York City, New York, Plan, site plan, and exterior perspective")
         (Rellevancia  4)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art13] of Quadre
         (Amplada  "21.6")
         (Esta_En  [Sala_9])
         (Medi  "Graphite, ink, watercolor, and metallic paint on paper")
         (Data  1905)
         (Estil  "Arte Pop")
         (Altura  "30.5")
         (Es_De  [Autor7608])
         (Nom  "House in Krems, project, Krems, Austria, Elevation")
         (Rellevancia  1)
         (ArtistID  7608)
         (Estil_Quadre  [Estil7])
    )

    ([Sala_1] of Sala
         (Nom  "Sala_1")
         (Connecta_Amb  [Sala_4] [Sala_0])
    )

    ([Autor8101] of Author
         (Genere  "male")
         (Pinta  [Art74])
         (AnyNeixement  1919)
         (Nacionalitat  "American")
         (Nom  "Paolo Soleri")
         (AnyMort  2013)
    )

    ([Art43] of Quadre
         (Amplada  "62.2")
         (Esta_En  [Sala_2])
         (Medi  "Ink on ozalid")
         (Data  1917)
         (Estil  "Surrealismo")
         (Altura  "56.5")
         (Es_De  [Autor27])
         (Nom  "Villa Snellman, Djursholm, Sweden, Second-floor plan")
         (Rellevancia  2)
         (ArtistID  27)
         (Estil_Quadre  [Estil8])
    )

    ([Art33] of Quadre
         (Amplada  "113.3477")
         (Esta_En  [Sala_9])
         (Medi  "Pastel on paper")
         (Data  1979)
         (Estil  "Fauvismo")
         (Altura  "112.7127")
         (Es_De  [Autor1863])
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Perspective)")
         (Rellevancia  1)
         (ArtistID  1863)
         (Estil_Quadre  [Estil9])
    )

    ([Art22] of Quadre
         (Amplada  "78.7")
         (Esta_En  [Sala_9])
         (Medi  "Ink and cut-and-pasted gelatin silver photographs on tracing paper")
         (Data  1980)
         (Estil  "Arte Naif")
         (Altura  "48.3")
         (Es_De  [Autor7056])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (Rellevancia  3)
         (ArtistID  7056)
         (Estil_Quadre  [Estil5])
    )

    ([Estil1] of Estil
         (Pintors_Estil  [Autor8100] [Autor6210] [Autor2308])
         (Nom  "Clasicismo")
         (Quadres_Estil  [Art36] [Art37] [Art27] [Art1])
    )

    ([Art73] of Quadre
         (Amplada  "35.9")
         (Esta_En  [Sala_3])
         (Medi  "Graphite and color pencil on tracing paper")
         (Data  1944)
         (Estil  "Arte Naif")
         (Altura  "21.6")
         (Es_De  [Autor8219])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspective and plan")
         (Rellevancia  5)
         (ArtistID  8219)
         (Estil_Quadre  [Estil5])
    )

    ([Autor6210] of Author
         (Genere  "male")
         (Pinta  [Art1])
         (AnyNeixement  1841)
         (Nacionalitat  "Austrian")
         (Nom  "Otto Wagner")
         (AnyMort  1918)
    )

    ([Art87] of Quadre
         (Amplada  "56.5")
         (Esta_En  [Sala_6])
         (Medi  "Graphite, ink and ink wash on paper")
         (Data  1986)
         (Estil  "Cubismo")
         (Altura  "76.2")
         (Es_De  [Autor2702])
         (Nom  "Porta Vittoria, project, Milan, Italy, View at elliptical passage, perspective and plan")
         (Rellevancia  2)
         (ArtistID  2702)
         (Estil_Quadre  [Estil4])
    )

    ([Art95] of Quadre
         (Amplada  "164.5")
         (Esta_En  [Sala_6])
         (Medi  "Ink on tracing paper")
         (Data  1989)
         (Estil  "Arte Pop")
         (Altura  "37.1")
         (Es_De  [Autor5076])
         (Nom  "Residence for Herbert Green, Studies for an Unfolded Modular House, Cherry Hill, Pennsylvania, Perspective")
         (Rellevancia  2)
         (ArtistID  5076)
         (Estil_Quadre  [Estil7])
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
)

;;; Inici de la solucio implementada
;;-------------------------------------------------------------------------------------------------------------
;;                    MAIN
;;-------------------------------------------------------------------------------------------------------------

;;; ------------------------- Declaracio de moduls -----------------------------

;;; Modul principal
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

;;; Modul de processat del contingut adequat a l'usuari
(defmodule processat_dades
    (import MAIN ?ALL)
    (import dades-visita deftemplate ?ALL)
    (import dades-preferencies deftemplate ?ALL)
    (export ?ALL)
)

;;; Modulo de generacio de resultats
(defmodule resultats
	(import MAIN ?ALL)
	(export ?ALL)
)

;;; Modul de resultats
(defmodule mostrar
    (import MAIN ?ALL)
    (export ?ALL)
)
;;; -------------------------- Fi: Declaracio de moduls ------------------------

;;; ------------------------ Declaracio de missatges ---------------------------

; Funcio per obtenir el nom d'una Sala
(defmessage-handler MAIN::Sala obtenirNom ()
    (bind ?resposta ?self:Nom)
    ?resposta ; Si l'ultima instrucció es una variable la funcio retorna el valor
)

(defmessage-handler MAIN::Quadre imprimir ()
    ; (printout t "-----------------------------------" crlf)
	(format t "  Titulo: %s" ?self:Nom)
	(printout t crlf)
	(format t "  Anyo: %d" ?self:Data)
	(printout t crlf)
    (format t "  Altura: %s - Amplada: %s" ?self:Altura ?self:Amplada)
	(printout t crlf)
    ; (format t "  Amplada: %s" ?self:Amplada)
	; (printout t crlf)
    ; (format t "  Medi: %s" ?self:Medi)
	; (printout t crlf)
    (format t "  Estil: %s" (send ?self:Estil_Quadre get-Nom))
	(printout t crlf)
    (format t "  Sala: %s" (send ?self:Esta_En get-Nom))
    (printout t crlf)
    (format t "  Autor: %s" (send ?self:Es_De get-Nom))
    (printout t crlf)
)

; (defmessage-handler MAIN::Author imprimir ()
; 	(format t "Nom: %s" ?self:Nom)
; 	(printout t crlf)
;     (format t "Nacionalitat: %s" ?self:Nacionalitat)
; 	(printout t crlf)
; 	(format t "Any Neixement: %d" ?self:AnyNeixement)
; 	(printout t crlf)
;     (format t "Any Mort: %d" ?self:AnyMort)
; 	(printout t crlf)
;     (printout t "Quadres de l'autor: " crlf)
;     (progn$ (?curr-quadre ?self:Pinta)
;         (send ?curr-quadre imprimir)
;     )
;     (printout t "===================================" crlf)
;     (printout t crlf)
; )

; (defmessage-handler MAIN::Estil imprimir ()
;     (format t "Estil Nom: %s" ?self:Nom)
; 	(printout t crlf)
;     (printout t "Quadres de l'estil: " crlf)
;     (progn$ (?curr-quadre ?self:Quadres_Estil)
;         (send ?curr-quadre imprimir)
;     )
;     (printout t "===================================" crlf)
;     (printout t crlf)
; )

(defmessage-handler MAIN::Recomanacio imprimir ()
	(printout t "-----------------------------------" crlf)
	(printout t (send ?self:nom_quadre imprimir))
	(printout t crlf)
	(format t "Nivel de recomendacion: %d %n" ?self:puntuacio)
	(printout t "Justificacion de la eleccion: " crlf)
	(progn$ (?curr-just ?self:justificacions)
		(printout t ?curr-just crlf)
	)
	(printout t crlf)
	(printout t "-----------------------------------" crlf)
)

(defmessage-handler MAIN::Dia imprimir ()
	(printout t "============================================" crlf)    
	(bind $?recs ?self:recomanacions)
	(progn$ (?curr-rec $?recs)
		(printout t (send ?curr-rec imprimir))
	)
	(printout t "============================================" crlf)
)

;;; ------------------------ Declaracio de templates ---------------------------

(deftemplate MAIN::Visita
	(slot tipus (type STRING) (default "indefinit"))
	(slot dies (type INTEGER) (default -1))
	(slot hores (type INTEGER) (default -1))
	(slot coneixement (type INTEGER) (default -1))
	(slot edat (type INTEGER) (default -1))
	(slot nacionalitat (type STRING) (default "indefinit"))
)

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

(deftemplate MAIN::llista_dies
	(multislot dies (type INSTANCE))
)


(deftemplate MAIN::dies_ordre_sala
	(multislot dies (type INSTANCE))
)

;;; ------------------------ Fi declaracio de templates ------------------------

;;; ------------------------ Declaracio de funcions ----------------------------

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
;;; ----------------------- Fi declaracio de funcions --------------------------

;;; ----------------------- Declaracio de regles y fet -------------------------

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
    (bind ?resposta (pregunta-index "El Judici Final o El Judici Universal és un mural que es troba a la Capella Sixtina i va ser pintat per:" ?var))
        (if (= ?resposta 3) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "El Moulin de la Galette" "Razzmatazz" "El Parc de la Ciutadella"))
    (bind ?resposta (pregunta-index "Cap a l'any 1900 els artistes bohemis es trobaven al barri de Montmartre (París). Quin era l'espai d'esbarjo que acostumaven a freqüentar?" ?var))
        (if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "Ratafia" "Absenta" "Carajillo" "Vodka Naranja"))
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
    (declare (salience 10))
 	?g <- (Visita (tipus ~"indefinit")(edat ?edat) (dies ?dies) (hores ?hores) (coneixement ?coneixement))
     (test (> ?edat -1))
     (test (> ?dies -1))
     (test (> ?hores -1))
     (test (> ?coneixement -1))
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
	?fet <- (estils_pref ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?fet)
	(if (eq ?aux TRUE)then
		(progn$ (?curr-gen $?gen)
			(assert (estils ?curr-gen))
		)
	)
    (printout t "Creant fets estils..." crlf)
)

(defrule processat_dades::aux-epoca "Crea fets per poder processar l'epoca preferida"
    (preferencies_visita (epoca_inici ?inici) (epoca_final ?final))
	?fet <- (epoca_pref ?aux)
	(test (or (eq ?aux TRUE) (eq ?aux FALSE)))
	=>
	(retract ?fet)
	(if (eq ?aux TRUE)then
		(loop-for-count (?cnt1 ?inici ?final) do
			(assert (epoca ?cnt1))
		)
	)
    (printout t "Creant fets epoca..." crlf)
)

;;; ----------- Apliquem els filtres de les preguntes ----------

(defrule processat_dades::valorar-coneixement-superior-a-4 "Millorar puntuacio dels quadres"
	(Visita (coneixement ?coneixement))
	(test (> ?coneixement 4))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <-(object (is-a Quadre) (Rellevancia ?relevancia))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valoracio ?cont ?coneixement))
	=>
    (if (> ?relevancia 3) then
        (bind ?p (+ ?p 70))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una rellevancia alta acord al coneixement del visitant -> +70"))
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just)
    (assert (valoracio ?cont ?coneixement))
    (printout t "Valorant coneixement del grup..." crlf)
)

(defrule processat_dades::valorar-coneixement-inferior-a-4 "Millorar puntuacio dels quadres"
	(Visita (coneixement ?coneixement))
	(test (<= ?coneixement 4))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <-(object (is-a Quadre) (Rellevancia ?relevancia))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valoracio ?cont ?coneixement))
	=>
    (if (< ?relevancia 4) then
        (bind ?p (+ ?p 40))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Té una rellevancia mitjana/baixa acord al coneixement del visitant -> +40"))
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just)
    (assert (valoracio ?cont ?coneixement))
    (printout t "Valorant coneixement del grup..." crlf)
)

(defmethod MAIN::string_to_float ((?s STRING))
   (float (string-to-field ?s)))

(defrule processat_dades::valorar-tamany-quadre-grup-petit "Millorar tamany dels quadres"
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

(defrule processat_dades::valorar-tamany-quadre-grup-gran "Millorar tamany dels quadres"
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

(defrule processat_dades::valorar-autors-preferits "Es millora la puntuacio de quadres d'autors preferits"
	?fet <- (autors ?auto)
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
	?fet <- (estils ?estil)
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
	?fet <- (epoca ?any)
    ; ?fet <- (preferencies_visita (epoca_inici ?inici) (epoca_final ?final))
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
	(printout t "Generant resposta..." crlf)
	(focus resultats)
)

;;; ---------------------- Modul generacio solucions ---------------------------

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
(defrule resultats::creacio_tour "Assignacio de recomanacions"
    ?g <- (Visita (dies ?dies) (tipus ?tipus) (hores ?hores) (coneixement ?coneixement));
	(sorted_recomanacions (recomanacions $?recs))
	(not (tour-dies))
	=>
    ; to minutes
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
		;   (bind ?a (send ?cont get-Altura))
      		(bind ?a (* (string_to_float (send ?cont get-Amplada)) (string_to_float (send ?cont get-Altura))))
            (if (eq ?tipus "Individu") then
                (if (> ?a 5000) then (bind ?t 12))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 10))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 6))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 4))
            )
            (if (eq ?tipus "Parella") then
                (if (> ?a 5000) then (bind ?t 13))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 11))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 7))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 5))

            )
            (if (eq ?tipus "Grup petit") then
                (if (> ?a 5000) then (bind ?t 14))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 12))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 8))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 6))

            )
            (if (eq ?tipus "Grup gran") then
                (if (> ?a 5000) then (bind ?t 16))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 14))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 10))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 8))
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
		(send ?dia put-recomanacions $?recs-dia)
        (bind ?i (+ ?i 1))
	)
    (assert (llista_dies (dies $?tour)))
    (printout t "Assignacio de dies al tour..." crlf)
)


(defrule resultats::passar-a-mostrar "Se pasa al modulo de presentacion"
    (llista_dies)
	=>
	(focus mostrar)
)

;;; ---------------- FUNCIONS MEVES -----------------------

(defrule mostrar::totsElsQuadres "Mostrar tots els quadres"
    (llista_dies (dies $?tour))
    (not (final))
    =>
    (printout t crlf)
	(format t "Esta es nuestra recomendacion de ruta para el grupo. Esperamos que la disfruteis.")
	(printout t crlf)
    (format t "%n")
    (printout t crlf)
    (printout t "============================================" crlf)
    (bind ?i 0)
	(progn$ (?curr-dia $?tour)
        (bind ?i(+ ?i 1))
        	(format t "Dia %d" ?i)
            (printout t crlf)
		(printout t (send ?curr-dia imprimir))
	)
	(assert (final))
)

; (defrule mostrar::totsElsQuadres "Mostrar tots els quadres"
;     =>
;     (bind ?llista_instancies (find-all-instances ((?instancia Quadre)) TRUE))
;     (progn$ (?i ?llista_instancies)
;         (send ?i imprimir))
; )

;(defrule mostrar::totsElsAutors "Mostrar tots els autors"
;    =>
;    ; (bind ?llista_instancies (find-all-instances ((?instancia Author)) TRUE))
;    (bind ?sexe (pregunta-sexe "Escull el sexe" male female))
;    (printout t crlf)
;    (bind ?llista_instancies (find-all-instances ((?instancia Author)) (eq ?instancia:Genere ?sexe)))

;    (progn$ (?i ?llista_instancies)
;        (send ?i imprimir))
;)


;(defrule mostrar::totsElsEstils "Mostrar tots els autors"
;    =>
;    (bind ?llista_instancies (find-all-instances ((?instancia Estil)) TRUE))

;    (progn$ (?i ?llista_instancies)
;        (send ?i imprimir))
;)

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
