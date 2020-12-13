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
    ;;; Un autor pinta uns quadres
    (multislot Pinta
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot AnyNeixement
        (type INTEGER)
        (create-accessor read-write))
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
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
    (multislot Hores
        (type FLOAT)
        (create-accessor read-write))
    (multislot Tipus
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Nacionalitat
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
    ;;; Un quadre esta pintat per un Autor
    (single-slot Es_De
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (single-slot Esta_En
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Estil_Quadre
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
    (single-slot Estil
        (type STRING)
        (create-accessor read-write))
    (single-slot Amplada
        (type FLOAT)
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
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    (multislot Autors
        (type STRING)
        (create-accessor read-write))
)

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

(definstances instances
    ([Art74] of Quadre
         (Data  1958)
         (Es_De  [Autor8101])
         (Rellevancia  3)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil3])
         (Nom  "Helium Bridge Project")
         (ArtistID  8101)
         (Altura  "55.2")
         (Medi  "Silkscreen")
         (Estil  "Expresionismo")
         (Amplada  "150.2")
    )

    ([Estil7] of Estil
         (Pintors_Estil  [Autor5076] [Autor7607] [Autor7608])
         (Nom  "Arte Pop")
         (Quadres_Estil  [Art97] [Art99] [Art95] [Art11] [Art13])
    )

    ([Art57] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: section and two exterior elevations")
         (ArtistID  27)
         (Altura  "30.5")
         (Medi  "Graphite on tracing paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "83.5")
    )

    ([Art69] of Quadre
         (Data  1977)
         (Es_De  [Autor2702])
         (Rellevancia  1)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil3])
         (Nom  "Gymnasium-Bridge, project, New York City, New York, Perspective")
         (ArtistID  2702)
         (Altura  "33.3")
         (Medi  "Graphite on paper")
         (Estil  "Expresionismo")
         (Amplada  "30.2")
    )

    ([Estil3] of Estil
         (Pintors_Estil  [Autor8219] [Autor7056] [Autor2702] [Autor8101] [Autor7605])
         (Nom  "Expresionismo")
         (Quadres_Estil  [Art75] [Art21] [Art7] [Art14] [Art6] [Art3] [Art26] [Art90] [Art96] [Art70] [Art71] [Art92] [Art10] [Art74] [Art69] [Art91] [Art78] [Art76] [Art32] [Art4] [Art98])
    )

    ([Sala_1] of Sala
         (Nom  "Sala_1")
         (Connecta_Amb  [Sala_0] [Sala_4])
    )

    ([Sala_9] of Sala
         (Nom  "9")
    )

    ([Art52] of Quadre
         (Data  1933)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Public Library, Stockholm, Sweden, Section")
         (ArtistID  27)
         (Altura  "90.2")
         (Medi  "Ink on paper with paper backing")
         (Estil  "Arte Naif")
         (Amplada  "93.7")
    )

    ([Art99] of Quadre
         (Data  1958)
         (Es_De  [Autor5076])
         (Rellevancia  4)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil7])
         (Nom  "Yale University, Art and Architecture Building, New Haven, Connecticut, Elevation")
         (ArtistID  5076)
         (Altura  "69.2")
         (Medi  "Graphite and colored pencil on paper")
         (Estil  "Arte Pop")
         (Amplada  "87.0")
    )

    ([Art8] of Quadre
         (Data  1976)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 1: The Park")
         (ArtistID  7056)
         (Altura  "35.6")
         (Medi  "Gelatin silver photograph")
         (Estil  "Arte Naif")
         (Amplada  "45.7")
    )

    ([Art67] of Quadre
         (Data  1937)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Exterior elevation of loggia")
         (ArtistID  27)
         (Altura  "29.5")
         (Medi  "Graphite on tracing paper")
         (Estil  "Surrealismo")
         (Amplada  "83.8")
    )

    ([Art88] of Quadre
         (Data  1936)
         (Es_De  [Autor8219])
         (Rellevancia  1)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspective")
         (ArtistID  8219)
         (Altura  "21.9075")
         (Medi  "Colored pencil on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "40.6401")
    )

    ([Art10] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  5)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 2: The Street (Border Crossing)")
         (ArtistID  7056)
         (Altura  "50.8")
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Estil  "Expresionismo")
         (Amplada  "50.8")
    )

    ([Art30] of Quadre
         (Data  1984)
         (Es_De  [Autor7056])
         (Rellevancia  4)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "Parc de la Villette, Le Case Vide, Paris, France (Axonometric of folly)")
         (ArtistID  7056)
         (Altura  "94.4564")
         (Medi  "Pen, ink, gouache, and airbrush on paper")
         (Estil  "Arte Naif")
         (Amplada  "94.7739")
    )

    ([Art25] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block,")
         (ArtistID  7056)
         (Altura  "48.3")
         (Medi  "Ink and cut-and-pasted gelatin silver photographs on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "78.7")
    )

    ([Art35] of Quadre
         (Data  1978)
         (Es_De  [Autor2308])
         (Rellevancia  3)
         (Esta_En  [Sala_8])
         (Estil_Quadre  [Estil8])
         (Nom  "Vacation House Project, Aspen, Colorado, Elevations, interior and exterior perspectives and plan")
         (ArtistID  2308)
         (Altura  "59.7")
         (Medi  "Ink and graphite on paper")
         (Estil  "Surrealismo")
         (Amplada  "60.0")
    )

    ([Art62] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: Two sections")
         (ArtistID  27)
         (Altura  "30.5")
         (Medi  "Graphite on tracing paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "83.5")
    )

    ([Art14] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 3: The Tower (The Fall)")
         (ArtistID  7056)
         (Altura  "50.8")
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Estil  "Expresionismo")
         (Amplada  "50.8")
    )

    ([Sala_5] of Sala
         (Nom  "5")
    )

    ([Art59] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  5)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: exterior elevation")
         (ArtistID  27)
         (Altura  "30.8")
         (Medi  "Graphite on tracing paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "83.5")
    )

    ([Art51] of Quadre
         (Data  1927)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Public Library, Stockholm, Sweden, Elevation of west facade")
         (ArtistID  27)
         (Altura  "90.8")
         (Medi  "Ink on paper with paper backing")
         (Estil  "Arte Naif")
         (Amplada  "93.0")
    )

    ([Art90] of Quadre
         (Data  1924)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Residence of Salman Schocken, Jerusalem, Israel, Perspective and elevation")
         (ArtistID  8219)
         (Altura  "34.2901")
         (Medi  "Graphite and color pencil on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "28.7338")
    )

    ([Art70] of Quadre
         (Data  1977)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil3])
         (Nom  "Gymnasium-Bridge Project, New York, New York, Perspective")
         (ArtistID  2702)
         (Altura  "34.3")
         (Medi  "Ink and graphite on paper")
         (Estil  "Expresionismo")
         (Amplada  "55.9")
    )

    ([Art61] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  5)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: exterior elevation and section")
         (ArtistID  27)
         (Altura  "30.8")
         (Medi  "Graphite on tracing paper mounted on board")
         (Estil  "Arte Naif")
         (Amplada  "83.8")
    )

    ([Art95] of Quadre
         (Data  1989)
         (Es_De  [Autor5076])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil7])
         (Nom  "Residence for Herbert Green, Studies for an Unfolded Modular House, Cherry Hill, Pennsylvania, Perspective")
         (ArtistID  5076)
         (Altura  "37.1")
         (Medi  "Ink on tracing paper")
         (Estil  "Arte Pop")
         (Amplada  "164.5")
    )

    ([Art18] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  4)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (ArtistID  7056)
         (Altura  "121.9")
         (Medi  "Ink on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "61.0")
    )

    ([Autor7607] of Author
         (Nom  "Marcel Kammerer")
         (Genere  "male")
         (Pinta  [Art11])
         (AnyNeixement  1878)
         (AnyMort  1969)
         (Nacionalitat  "Austrian")
    )

    ([Art34] of Quadre
         (Data  1978)
         (Es_De  [Autor2308])
         (Rellevancia  4)
         (Esta_En  [Sala_8])
         (Estil_Quadre  [Estil8])
         (Nom  "Fargo-Moorhead Cultural Center Bridge, project, Fargo, North Dakota and Moorhead, Minnesota, South elevation")
         (ArtistID  2308)
         (Altura  "30.2")
         (Medi  "Graphite and crayon on yellow tracing paper")
         (Estil  "Surrealismo")
         (Amplada  "30.2")
    )

    ([Estil4] of Estil
         (Pintors_Estil  [Autor7605] [Autor2702])
         (Nom  "Cubismo")
         (Quadres_Estil  [Art87] [Art5] [Art72] [Art85] [Art89] [Art79] [Art93] [Art83] [Art77] [Art81])
    )

    ([Art40] of Quadre
         (Data  1917)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Villa Snellman, Djursholm, Sweden, Exterior elevation")
         (ArtistID  27)
         (Altura  "31.8")
         (Medi  "Ink on ozalid")
         (Estil  "Arte Naif")
         (Amplada  "61.6")
    )

    ([Autor2308] of Author
         (Nom  "Michael Graves")
         (Genere  "male")
         (Pinta  [Art35] [Art37] [Art36] [Art34])
         (AnyNeixement  1934)
         (AnyMort  2015)
         (Nacionalitat  "American")
    )

    ([Art31] of Quadre
         (Data  1979)
         (Es_De  [Autor1863])
         (Rellevancia  3)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil9])
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Developed plan and section elevations)")
         (ArtistID  1863)
         (Altura  "141.6053")
         (Medi  "Ink and pastel on paper")
         (Estil  "Fauvismo")
         (Amplada  "110.8077")
    )

    ([Art72] of Quadre
         (Data  1977)
         (Es_De  [Autor2702])
         (Rellevancia  4)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Gymnasium Bridge, project, New York City, New York, Plan, site plan, and exterior perspective")
         (ArtistID  2702)
         (Altura  "55.9")
         (Medi  "Graphite on paper")
         (Estil  "Cubismo")
         (Amplada  "75.6")
    )

    ([Art5] of Quadre
         (Data  1903)
         (Es_De  [Autor7605])
         (Rellevancia  3)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Villa, project, outside Vienna, Austria, Exterior perspective")
         (ArtistID  7605)
         (Altura  "38.4")
         (Medi  "Graphite, color pencil, ink, and gouache on tracing paper")
         (Estil  "Cubismo")
         (Amplada  "19.1")
    )

    ([Estil8] of Estil
         (Pintors_Estil  [Autor2308] [Autor7608] [Autor27])
         (Nom  "Surrealismo")
         (Quadres_Estil  [Art39] [Art67] [Art15] [Art62] [Art38] [Art34] [Art45] [Art68] [Art44] [Art60] [Art58] [Art35] [Art63] [Art64] [Art57] [Art43] [Art59] [Art50] [Art41])
    )

    ([Art60] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior elevation")
         (ArtistID  27)
         (Altura  "30.8")
         (Medi  "Graphite on tracing paper on board")
         (Estil  "Surrealismo")
         (Amplada  "83.3")
    )

    ([Art17] of Quadre
         (Data  1979)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (ArtistID  7056)
         (Altura  "121.9202")
         (Medi  "Ink and transfer on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "60.9601")
    )

    ([Art36] of Quadre
         (Data  1978)
         (Es_De  [Autor2308])
         (Rellevancia  1)
         (Esta_En  [Sala_8])
         (Estil_Quadre  [Estil1])
         (Nom  "French & Company, project, New York (Manhattan), New York, Facade study")
         (ArtistID  2308)
         (Altura  "27.6")
         (Medi  "Graphite, ink and crayon on paper")
         (Estil  "Clasicismo")
         (Amplada  "27.3")
    )

    ([Autor8100] of Author
         (Nom  "Hans Poelzig")
         (Genere  "male")
         (Pinta  [Art27])
         (AnyNeixement  1869)
         (AnyMort  1936)
         (Nacionalitat  "German")
    )

    ([Art38] of Quadre
         (Data  1917)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Villa Snellman, Djursholm, Sweden, Elevation of garden facade, sketch")
         (ArtistID  27)
         (Altura  "23.2")
         (Medi  "Graphite and crayon on tracing paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "34.9")
    )

    ([Art15] of Quadre
         (Data  1906)
         (Es_De  [Autor7608])
         (Rellevancia  3)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil8])
         (Nom  "Imperial Post Office, Teschen, Austria (Elevation)")
         (ArtistID  7608)
         (Altura  "29.6")
         (Medi  "Pencil, ink, colored pencil, and gouache on paper")
         (Estil  "Surrealismo")
         (Amplada  "35.8")
    )

    ([Art73] of Quadre
         (Data  1944)
         (Es_De  [Autor8219])
         (Rellevancia  5)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspective and plan")
         (ArtistID  8219)
         (Altura  "21.6")
         (Medi  "Graphite and color pencil on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "35.9")
    )

    ([Art92] of Quadre
         (Data  1936)
         (Es_De  [Autor8219])
         (Rellevancia  1)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Israel, Perspectives and elevation")
         (ArtistID  8219)
         (Altura  "35.2")
         (Medi  "Graphite and color pencil on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "24.1")
    )

    ([Art55] of Quadre
         (Data  1936)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Law Courts Annex, Gothenburg, Sweden, Exterior elevation")
         (ArtistID  27)
         (Altura  "30.5")
         (Medi  "Graphite on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "70.5")
    )

    ([Sala_3] of Sala
         (Nom  "Sala_3")
         (Connecta_Amb  [Sala_2])
    )

    ([Art97] of Quadre
         (Data  1949)
         (Es_De  [Autor5076])
         (Rellevancia  4)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil7])
         (Nom  "Finney Guest House Project, Siesta Key, Florida, Aerial perspective")
         (ArtistID  5076)
         (Altura  "64.8")
         (Medi  "Ink and printed polymer sheet on paper")
         (Estil  "Arte Pop")
         (Amplada  "47.9")
    )

    ([Art24] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (ArtistID  7056)
         (Altura  "48.3")
         (Medi  "Ink on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "78.7")
    )

    ([Art71] of Quadre
         (Data  1935)
         (Es_De  [Autor8219])
         (Rellevancia  4)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Interior perspectives")
         (ArtistID  8219)
         (Altura  "35.6")
         (Medi  "Graphite and color pencil on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "29.2")
    )

    ([Art44] of Quadre
         (Data  1923)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Elevation of front of auditorium")
         (ArtistID  27)
         (Altura  "56.8")
         (Medi  "Ink on paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "79.4")
    )

    ([Art65] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, First version: ground floor plan")
         (ArtistID  27)
         (Altura  "41.9")
         (Medi  "Graphite on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "41.9")
    )

    ([Estil5] of Estil
         (Pintors_Estil  [Autor7056] [Autor27] [Autor8219])
         (Nom  "Arte Naif")
         (Quadres_Estil  [Art42] [Art25] [Art30] [Art8] [Art51] [Art19] [Art17] [Art55] [Art82] [Art49] [Art24] [Art52] [Art88] [Art84] [Art47] [Art61] [Art65] [Art40] [Art16] [Art54] [Art46] [Art18] [Art22] [Art94] [Art12] [Art48] [Art73] [Art20] [Art56] [Art80] [Art53] [Art86] [Art23] [Art66])
    )

    ([Art96] of Quadre
         (Data  1938)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Gated Wall, Perspective and elevation")
         (ArtistID  8219)
         (Altura  "29.8")
         (Medi  "Graphite on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "37.5")
    )

    ([Art53] of Quadre
         (Data  1915)
         (Es_De  [Autor27])
         (Rellevancia  4)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Public Library, Stockholm, Sweden, Plan of first and second galleries")
         (ArtistID  27)
         (Altura  "90.8")
         (Medi  "Ink on paper")
         (Estil  "Arte Naif")
         (Amplada  "90.8")
    )

    ([Art63] of Quadre
         (Data  1891)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior perspective")
         (ArtistID  27)
         (Altura  "26.0")
         (Medi  "Graphite on tracing paper")
         (Estil  "Surrealismo")
         (Amplada  "62.9")
    )

    ([Estil1] of Estil
         (Pintors_Estil  [Autor2308] [Autor8100] [Autor6210])
         (Nom  "Clasicismo")
         (Quadres_Estil  [Art1] [Art27] [Art36] [Art37])
    )

    ([Art28] of Quadre
         (Data  1970)
         (Es_De  [Autor47])
         (Rellevancia  2)
         (Esta_En  [Sala_4])
         (Estil_Quadre  [Estil9])
         (Nom  "Earth-Cloud House, project")
         (ArtistID  47)
         (Altura  "87.3127")
         (Medi  "Graphite")
         (Estil  "Fauvismo")
         (Amplada  "135.8903")
    )

    ([Art45] of Quadre
         (Data  1923)
         (Es_De  [Autor27])
         (Rellevancia  5)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Elevation of rear of auditorium")
         (ArtistID  27)
         (Altura  "57.2")
         (Medi  "Ink on paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "79.1")
    )

    ([Sala_10] of Sala
         (Nom  "10")
    )

    ([Art39] of Quadre
         (Data  1917)
         (Es_De  [Autor27])
         (Rellevancia  2)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Villa Snellman, Djursholm, Sweden, Exterior elevation")
         (ArtistID  27)
         (Altura  "31.1")
         (Medi  "Ink on ozalid")
         (Estil  "Surrealismo")
         (Amplada  "61.9")
    )

    ([Art46] of Quadre
         (Data  1923)
         (Es_De  [Autor27])
         (Rellevancia  2)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Plan of ground floor")
         (ArtistID  27)
         (Altura  "47.9")
         (Medi  "Ink on paper mounted on board")
         (Estil  "Arte Naif")
         (Amplada  "55.2")
    )

    ([Sala_2] of Sala
         (Nom  "Sala_2")
         (Connecta_Amb  [Sala_3] [Sala_4] [Sala_0])
    )

    ([Art3] of Quadre
         (Data  1903)
         (Es_De  [Autor7605])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil3])
         (Nom  "Villa near Vienna Project, Outside Vienna, Austria, Elevation")
         (ArtistID  7605)
         (Altura  "34.3")
         (Medi  "Graphite, pen, color pencil, ink, and gouache on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "31.8")
    )

    ([Art27] of Quadre
         (Data  1918)
         (Es_De  [Autor8100])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil1])
         (Nom  "Concert Hall Project, Dresden, Germany (Interior perspective of preliminary scheme)")
         (ArtistID  8100)
         (Altura  "37.1")
         (Medi  "Colored pencil and graphite on tracing paper")
         (Estil  "Clasicismo")
         (Amplada  "41.0")
    )

    ([Art50] of Quadre
         (Data  1910)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Public Library, Stockholm, Sweden, Elevation of front facade")
         (ArtistID  27)
         (Altura  "91.4")
         (Medi  "Ink on paper")
         (Estil  "Surrealismo")
         (Amplada  "93.3")
    )

    ([Art20] of Quadre
         (Data  1979)
         (Es_De  [Autor7056])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (ArtistID  7056)
         (Altura  "121.9")
         (Medi  "Ink and photographic reproductions on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "61.0")
    )

    ([Art56] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Law Courts Annex, Gothenburg, Sweden, Plan of courtroom and section of desk")
         (ArtistID  27)
         (Altura  "39.4")
         (Medi  "Ink on paper")
         (Estil  "Arte Naif")
         (Amplada  "51.1")
    )

    ([Art81] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  1)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Porta Vittoria, project, Milan, Italy, View from court of four-sided pentagon, perspective, site plan")
         (ArtistID  2702)
         (Altura  "75.6")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Cubismo")
         (Amplada  "56.5")
    )

    ([Autor7605] of Author
         (Nom  "Emil Hoppe")
         (Genere  "male")
         (Pinta  [Art5] [Art3])
         (AnyNeixement  1876)
         (AnyMort  1957)
         (Nacionalitat  "Austrian")
    )

    ([Art85] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Porta Vittoria, project, Milan, Italy, New subway station opening onto elongated gap, perspective and plan")
         (ArtistID  2702)
         (Altura  "75.6")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Cubismo")
         (Amplada  "56.5")
    )

    ([Art32] of Quadre
         (Data  1986)
         (Es_De  [Autor7056])
         (Rellevancia  4)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "Parc de la Villette, Paris, France, Aerial perspective of follies")
         (ArtistID  7056)
         (Altura  "69.2151")
         (Medi  "Pen, ink, and gouache on paper")
         (Estil  "Expresionismo")
         (Amplada  "99.6952")
    )

    ([Autor47] of Author
         (Nom  "Raimund Abraham")
         (Genere  "male")
         (Pinta  [Art28])
         (AnyNeixement  1933)
         (AnyMort  2010)
         (Nacionalitat  "American")
    )

    ([Art37] of Quadre
         (Data  1978)
         (Es_De  [Autor2308])
         (Rellevancia  2)
         (Esta_En  [Sala_8])
         (Estil_Quadre  [Estil1])
         (Nom  "Vacation House, project, Aspen, Colorado, Fireplace")
         (ArtistID  2308)
         (Altura  "20.3")
         (Medi  "Graphite and Prismacolor crayon on tracing paper")
         (Estil  "Clasicismo")
         (Amplada  "20.3")
    )

    ([Art33] of Quadre
         (Data  1979)
         (Es_De  [Autor1863])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil9])
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Perspective)")
         (ArtistID  1863)
         (Altura  "112.7127")
         (Medi  "Pastel on paper")
         (Estil  "Fauvismo")
         (Amplada  "113.3477")
    )

    ([Art79] of Quadre
         (Data  1985)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Berkowitz House, Martha's Vineyard, Massachusetts, Exterior perspective")
         (ArtistID  2702)
         (Altura  "52.0701")
         (Medi  "Graphite and watercolor on paper")
         (Estil  "Cubismo")
         (Amplada  "107.9502")
    )

    ([Art21] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 4: The Block")
         (ArtistID  7056)
         (Altura  "50.8")
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Estil  "Expresionismo")
         (Amplada  "50.8")
    )

    ([Art82] of Quadre
         (Data  1936)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspective")
         (ArtistID  8219)
         (Altura  "27.3051")
         (Medi  "Colored pencil on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "35.8776")
    )

    ([Art83] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Porta Vittoria, project, Milan, Italy, Garden of Sounds, perspective and plan")
         (ArtistID  2702)
         (Altura  "75.6")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Cubismo")
         (Amplada  "56.8")
    )

    ([Art91] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil3])
         (Nom  "Porta Vittoria, project, Milan, Italy, Water basin, amphitheater, and jack-up rig, perspective and plan")
         (ArtistID  2702)
         (Altura  "75.6")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Expresionismo")
         (Amplada  "56.5")
    )

    ([Art68] of Quadre
         (Data  1937)
         (Es_De  [Autor27])
         (Rellevancia  4)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Exterior elevation, final version")
         (ArtistID  27)
         (Altura  "49.2")
         (Medi  "Ink and graphite on drafting cloth")
         (Estil  "Surrealismo")
         (Amplada  "158.8")
    )

    ([Autor7470] of Author
         (Nom  "Christian de Portzamparc")
         (Genere  "male")
         (Pinta  [Art2])
         (AnyNeixement  1944)
         (AnyMort  1976)
         (Nacionalitat  "French")
    )

    ([Art66] of Quadre
         (Data  1930)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Exterior-perspective study")
         (ArtistID  27)
         (Altura  "65.4")
         (Medi  "Graphite on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "101.6")
    )

    ([Estil2] of Estil
         (Pintors_Estil  [Autor7470])
         (Nom  "Abstractismo")
         (Quadres_Estil  [Art2])
    )

    ([Sala_0] of Sala
         (Nom  "Entrada")
         (Connecta_Amb  [Sala_1] [Sala_2])
    )

    ([Estil9] of Estil
         (Pintors_Estil  [Autor47] [Autor1863])
         (Nom  "Fauvismo")
         (Quadres_Estil  [Art31] [Art29] [Art28] [Art33])
    )

    ([Art16] of Quadre
         (Data  1979)
         (Es_De  [Autor7056])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (ArtistID  7056)
         (Altura  "121.9")
         (Medi  "Ink on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "61.0")
    )

    ([Art4] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 1: The Park")
         (ArtistID  7056)
         (Altura  "50.8")
         (Medi  "Photographic reproduction with colored synthetic laminate")
         (Estil  "Expresionismo")
         (Amplada  "50.8")
    )

    ([Art64] of Quadre
         (Data  1921)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, First version: exterior perspective")
         (ArtistID  27)
         (Altura  "19.7")
         (Medi  "Graphite on tracing paper")
         (Estil  "Surrealismo")
         (Amplada  "46.7")
    )

    ([Sala_6] of Sala
         (Nom  "6")
    )

    ([Autor6210] of Author
         (Nom  "Otto Wagner")
         (Genere  "male")
         (Pinta  [Art1])
         (AnyNeixement  1841)
         (AnyMort  1918)
         (Nacionalitat  "Austrian")
    )

    ([Art43] of Quadre
         (Data  1917)
         (Es_De  [Autor27])
         (Rellevancia  2)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Villa Snellman, Djursholm, Sweden, Second-floor plan")
         (ArtistID  27)
         (Altura  "56.5")
         (Medi  "Ink on ozalid")
         (Estil  "Surrealismo")
         (Amplada  "62.2")
    )

    ([Art13] of Quadre
         (Data  1905)
         (Es_De  [Autor7608])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil7])
         (Nom  "House in Krems, project, Krems, Austria, Elevation")
         (ArtistID  7608)
         (Altura  "30.5")
         (Medi  "Graphite, ink, watercolor, and metallic paint on paper")
         (Estil  "Arte Pop")
         (Amplada  "21.6")
    )

    ([Sala_4] of Sala
         (Nom  "Sortida")
         (Connecta_Amb  [Sala_2] [Sala_1])
    )

    ([Art94] of Quadre
         (Data  1933)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspectives and elevation")
         (ArtistID  8219)
         (Altura  "30.2")
         (Medi  "Graphite on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "36.8")
    )

    ([Art48] of Quadre
         (Data  1931)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Perspective of staircase")
         (ArtistID  27)
         (Altura  "33.0")
         (Medi  "Ink and graphite on tracing paper mounted on board")
         (Estil  "Arte Naif")
         (Amplada  "29.8")
    )

    ([Art75] of Quadre
         (Data  1980)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil3])
         (Nom  "Autonomous Artisans' House, project, Staten Island, New York, Perspective")
         (ArtistID  2702)
         (Altura  "8.3")
         (Medi  "Graphite and watercolor on paper")
         (Estil  "Expresionismo")
         (Amplada  "33.0")
    )

    ([Art93] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  5)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Porta Vittoria, project, Milan, Italy, Passage below water basin, perspective and plan")
         (ArtistID  2702)
         (Altura  "75.6")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Cubismo")
         (Amplada  "56.5")
    )

    ([Art7] of Quadre
         (Data  1976)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (ArtistID  7056)
         (Altura  "35.6")
         (Medi  "Gelatin silver photographs")
         (Estil  "Expresionismo")
         (Amplada  "45.7")
    )

    ([Art1] of Quadre
         (Data  1896)
         (Es_De  [Autor6210])
         (Rellevancia  4)
         (Esta_En  [Sala_10])
         (Estil_Quadre  [Estil1])
         (Nom  "Ferdinandsbr�cke Project, Vienna, Austria (Elevation, preliminary version)")
         (ArtistID  6210)
         (Altura  "48.6")
         (Medi  "Ink and cut-and-pasted painted pages on paper")
         (Estil  "Clasicismo")
         (Amplada  "168.9")
    )

    ([Art84] of Quadre
         (Data  1936)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Interior perspective and details of furniture")
         (ArtistID  8219)
         (Altura  "36.2")
         (Medi  "Graphite and color pencil on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "29.2")
    )

    ([Autor2964] of Author
         (Nom  "Louis I. Kahn")
         (Genere  "male")
         (Pinta  [Art9])
         (AnyNeixement  1901)
         (AnyMort  1974)
         (Nacionalitat  "American")
    )

    ([Art41] of Quadre
         (Data  1917)
         (Es_De  [Autor27])
         (Rellevancia  5)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Villa Snellman, Djursholm, Sweden, Site plan")
         (ArtistID  27)
         (Altura  "39.4")
         (Medi  "Graphite and crayon on tracing paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "34.0")
    )

    ([Sala_7] of Sala
         (Nom  "7")
    )

    ([Art78] of Quadre
         (Data  1914)
         (Es_De  [Autor8219])
         (Rellevancia  3)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspectives and elevation")
         (ArtistID  8219)
         (Altura  "34.9")
         (Medi  "Graphite on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "17.8")
    )

    ([Art47] of Quadre
         (Data  1923)
         (Es_De  [Autor27])
         (Rellevancia  2)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Floor plan of mezzanine")
         (ArtistID  27)
         (Altura  "47.9")
         (Medi  "Ink on paper mounted on board")
         (Estil  "Arte Naif")
         (Amplada  "55.5")
    )

    ([Art49] of Quadre
         (Data  1936)
         (Es_De  [Autor27])
         (Rellevancia  2)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Skandia Cinema, Stockholm, Sweden, Perspective of promenade")
         (ArtistID  27)
         (Altura  "21.0")
         (Medi  "Graphite on tracing paper mounted on board")
         (Estil  "Arte Naif")
         (Amplada  "26.7")
    )

    ([Sala_8] of Sala
         (Nom  "8")
    )

    ([Art77] of Quadre
         (Data  1984)
         (Es_De  [Autor2702])
         (Rellevancia  3)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Autonomous Artisans' House, project, New York (Staten Island), New York, Perspective")
         (ArtistID  2702)
         (Altura  "52.1")
         (Medi  "Graphite on vellum")
         (Estil  "Cubismo")
         (Amplada  "103.5")
    )

    ([Art42] of Quadre
         (Data  1917)
         (Es_De  [Autor27])
         (Rellevancia  3)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Villa Snellman, Djursholm, Sweden, Ground-floor plan")
         (ArtistID  27)
         (Altura  "57.2")
         (Medi  "Ink on ozalid")
         (Estil  "Arte Naif")
         (Amplada  "62.5")
    )

    ([Art98] of Quadre
         (Data  1923)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Gated Wall, Perspective and elevation")
         (ArtistID  8219)
         (Altura  "41.9")
         (Medi  "Graphite on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "29.2")
    )

    ([Art76] of Quadre
         (Data  1910)
         (Es_De  [Autor8219])
         (Rellevancia  3)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil3])
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Elevations")
         (ArtistID  8219)
         (Altura  "20.3")
         (Medi  "Graphite and color pencil on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "35.9")
    )

    ([Art54] of Quadre
         (Data  1930)
         (Es_De  [Autor27])
         (Rellevancia  1)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil5])
         (Nom  "Stockholm Exhibition, Stockholm, Sweden (Elevation of advertising tower)")
         (ArtistID  27)
         (Altura  "52.7")
         (Medi  "Gouache on board")
         (Estil  "Arte Naif")
         (Amplada  "33.0")
    )

    ([Art12] of Quadre
         (Data  1978)
         (Es_De  [Autor7056])
         (Rellevancia  2)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 2: The Street (Border Crossing)")
         (ArtistID  7056)
         (Altura  "60.9601")
         (Medi  "Ink, charcoal, graphite, cut-and-pasted photographic reproductions, Letraset type, and color pencil on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "817.8816")
    )

    ([Autor7056] of Author
         (Nom  "Bernard Tschumi")
         (Genere  "male")
         (Pinta  [Art7] [Art22] [Art6] [Art4] [Art24] [Art16] [Art18] [Art21] [Art10] [Art14] [Art12] [Art26] [Art20] [Art32] [Art17] [Art23] [Art8] [Art25] [Art30] [Art19])
         (AnyNeixement  1944)
         (AnyMort  1992)
         (Nacionalitat  "Georgian")
    )

    ([Art89] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  4)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Porta Vittoria, project, Milan, Italy, Subway station and shops, ticket-taker tower, perspective and plan")
         (ArtistID  2702)
         (Altura  "75.6")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Cubismo")
         (Amplada  "56.5")
    )

    ([Art19] of Quadre
         (Data  1979)
         (Es_De  [Autor7056])
         (Rellevancia  1)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall),")
         (ArtistID  7056)
         (Altura  "121.9")
         (Medi  "Ink on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "61.0")
    )

    ([Autor1863] of Author
         (Nom  "Roger C. Ferri")
         (Genere  "male")
         (Pinta  [Art29] [Art33] [Art31])
         (AnyNeixement  1949)
         (AnyMort  1991)
         (Nacionalitat  "American")
    )

    ([Art2] of Quadre
         (Data  1987)
         (Es_De  [Autor7470])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil2])
         (Nom  "City of Music, National Superior Conservatory of Music and Dance, Paris, France, View from interior courtyard")
         (ArtistID  7470)
         (Altura  "40.6401")
         (Medi  "Paint and colored pencil on print")
         (Estil  "Abstractismo")
         (Amplada  "29.8451")
    )

    ([Art9] of Quadre
         (Data  1968)
         (Es_De  [Autor2964])
         (Rellevancia  4)
         (Esta_En  [Sala_5])
         (Estil_Quadre  [Estil6])
         (Nom  "Memorial to the Six Million Jewish Martyrs, project, New York City, New York, Perspective of central pier")
         (ArtistID  2964)
         (Altura  "113.0")
         (Medi  "Charcoal and graphite on tracing paper")
         (Estil  "Romanticismo")
         (Amplada  "167.6")
    )

    ([Art87] of Quadre
         (Data  1986)
         (Es_De  [Autor2702])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil4])
         (Nom  "Porta Vittoria, project, Milan, Italy, View at elliptical passage, perspective and plan")
         (ArtistID  2702)
         (Altura  "76.2")
         (Medi  "Graphite, ink and ink wash on paper")
         (Estil  "Cubismo")
         (Amplada  "56.5")
    )

    ([Autor7608] of Author
         (Nom  "Otto Sch�nthal")
         (Genere  "male")
         (Pinta  [Art15] [Art13])
         (AnyNeixement  1878)
         (AnyMort  1961)
         (Nacionalitat  "Austrian")
    )

    ([Art11] of Quadre
         (Data  1900)
         (Es_De  [Autor7607])
         (Rellevancia  2)
         (Esta_En  [Sala_6])
         (Estil_Quadre  [Estil7])
         (Nom  "Royal Hunting Tent, project, Exterior perspective")
         (ArtistID  7607)
         (Altura  "47.9")
         (Medi  "Ink, graphite, watercolor, gouache, and airbrush on paper")
         (Estil  "Arte Pop")
         (Amplada  "31.4")
    )

    ([Art23] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  3)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (ArtistID  7056)
         (Altura  "48.2")
         (Medi  "Ink and photographs on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "78.7")
    )

    ([Art29] of Quadre
         (Data  1979)
         (Es_De  [Autor1863])
         (Rellevancia  4)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil9])
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Structural details)")
         (ArtistID  1863)
         (Altura  "141.6")
         (Medi  "Ink and pastel on paper")
         (Estil  "Fauvismo")
         (Amplada  "110.8")
    )

    ([Art86] of Quadre
         (Data  1936)
         (Es_De  [Autor8219])
         (Rellevancia  1)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspectives of the medical school and auditorium")
         (ArtistID  8219)
         (Altura  "36.8301")
         (Medi  "Graphite on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "29.2101")
    )

    ([Art6] of Quadre
         (Data  1976)
         (Es_De  [Autor7056])
         (Rellevancia  4)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (ArtistID  7056)
         (Altura  "35.6")
         (Medi  "Gelatin silver photograph")
         (Estil  "Expresionismo")
         (Amplada  "45.7")
    )

    ([Art22] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  3)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil5])
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (ArtistID  7056)
         (Altura  "48.3")
         (Medi  "Ink and cut-and-pasted gelatin silver photographs on tracing paper")
         (Estil  "Arte Naif")
         (Amplada  "78.7")
    )

    ([Art26] of Quadre
         (Data  1980)
         (Es_De  [Autor7056])
         (Rellevancia  3)
         (Esta_En  [Sala_9])
         (Estil_Quadre  [Estil3])
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 4: The Block")
         (ArtistID  7056)
         (Altura  "48.3")
         (Medi  "Ink and cut-and-pasted gelatin silver photographs on tracing paper")
         (Estil  "Expresionismo")
         (Amplada  "78.7")
    )

    ([Art58] of Quadre
         (Data  1935)
         (Es_De  [Autor27])
         (Rellevancia  2)
         (Esta_En  [Sala_2])
         (Estil_Quadre  [Estil8])
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior elevation")
         (ArtistID  27)
         (Altura  "30.8")
         (Medi  "Graphite on tracing paper mounted on board")
         (Estil  "Surrealismo")
         (Amplada  "83.8")
    )

    ([Art80] of Quadre
         (Data  1936)
         (Es_De  [Autor8219])
         (Rellevancia  2)
         (Esta_En  [Sala_3])
         (Estil_Quadre  [Estil5])
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspectives")
         (ArtistID  8219)
         (Altura  "21.59")
         (Medi  "Graphite on copy paper")
         (Estil  "Arte Naif")
         (Amplada  "13.6525")
    )

    ([Estil6] of Estil
         (Pintors_Estil  [Autor2964])
         (Nom  "Romanticismo")
         (Quadres_Estil  [Art9])
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
    (declare (salience 10))
 			?g <- (Visita (tipus ~"indefinit")(edat ?edat) (dies ?dies) (hores ?hores) (coneixement ?coneixement) (nacionalitat ~"indefinit"))
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
