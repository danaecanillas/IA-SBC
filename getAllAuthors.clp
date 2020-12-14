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

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
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
    (multislot Te
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Dies
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Estil
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (multislot Quadres_Estil
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Pintors_Estil
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
    (single-slot Data
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
    (single-slot ArtistID
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Altura
        (type FLOAT)
        (create-accessor read-write))
    ;;; Un quadre esta situat en una sala dins del museu
    (single-slot Esta_En
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Amplada
        (type FLOAT)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Medi
        (type STRING)
        (create-accessor read-write))
    ;;; Un quadre esta pintat per un Autor
    (single-slot Es_De
        (type SYMBOL)
        (create-accessor read-write))
    (single-slot Estil_Quadre
        (type SYMBOL)
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
    (single-slot AnyMort
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
)

(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Autors
        (type STRING)
        (create-accessor read-write))
    (single-slot Estil
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
    (single-slot Nom
        (type STRING)
        (create-accessor read-write))
    (single-slot Numero_Sala
        (type INTEGER)
        (create-accessor read-write))
    ;;; Una Sala pot estar connectada amb una altra sala
    (multislot Connecta_Amb
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
    ([Autor2702] of Author
         (Genere  "male")
         (Pinta  [Art72] [Art93] [Art85] [Art69] [Art81] [Art75] [Art91] [Art70] [Art89] [Art83] [Art77] [Art79] [Art87])
         (AnyNeixement  1947)
         (AnyMort  1984)
         (Nom  "Steven Holl")
         (Nacionalitat  "American")
    )

    ([Art70] of Quadre
         (Estil  "Expresionismo")
         (Data  1977)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "34.3")
         (Esta_En  [Sala_6])
         (Amplada  "55.9")
         (Nom  "Gymnasium-Bridge Project, New York, New York, Perspective")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil3])
    )

    ([Autor47] of Author
         (Genere  "male")
         (Pinta  [Art28])
         (AnyNeixement  1933)
         (AnyMort  2010)
         (Nom  "Raimund Abraham")
         (Nacionalitat  "American")
    )

    ([Art42] of Quadre
         (Estil  "Arte Naif")
         (Data  1917)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "57.2")
         (Esta_En  [Sala_2])
         (Amplada  "62.5")
         (Nom  "Villa Snellman, Djursholm, Sweden, Ground-floor plan")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art68] of Quadre
         (Estil  "Surrealismo")
         (Data  1937)
         (Rellevancia  4)
         (ArtistID  27)
         (Altura  "49.2")
         (Esta_En  [Sala_2])
         (Amplada  "158.8")
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Exterior elevation, final version")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art8] of Quadre
         (Estil  "Arte Naif")
         (Data  1976)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "35.6")
         (Esta_En  [Sala_9])
         (Amplada  "45.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 1: The Park")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Sala_8] of Sala
         (Nom  "Sala_8")
         (Numero_Sala  8)
         (Connecta_Amb  [Sala_7] [Sala_9])
    )

    ([Art53] of Quadre
         (Estil  "Arte Naif")
         (Data  1915)
         (Rellevancia  4)
         (ArtistID  27)
         (Altura  "90.8")
         (Esta_En  [Sala_2])
         (Amplada  "90.8")
         (Nom  "Public Library, Stockholm, Sweden, Plan of first and second galleries")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Sala_9] of Sala
         (Nom  "Sala_9")
         (Numero_Sala  9)
         (Connecta_Amb  [Sala_8] [Sala_10])
    )

    ([Art72] of Quadre
         (Estil  "Cubismo")
         (Data  1977)
         (Rellevancia  4)
         (ArtistID  2702)
         (Altura  "55.9")
         (Esta_En  [Sala_6])
         (Amplada  "75.6")
         (Nom  "Gymnasium Bridge, project, New York City, New York, Plan, site plan, and exterior perspective")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art22] of Quadre
         (Estil  "Arte Naif")
         (Data  1980)
         (Rellevancia  3)
         (ArtistID  7056)
         (Altura  "48.3")
         (Esta_En  [Sala_9])
         (Amplada  "78.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art54] of Quadre
         (Estil  "Arte Naif")
         (Data  1930)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "52.7")
         (Esta_En  [Sala_2])
         (Amplada  "33.0")
         (Nom  "Stockholm Exhibition, Stockholm, Sweden (Elevation of advertising tower)")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art65] of Quadre
         (Estil  "Arte Naif")
         (Data  1935)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "41.9")
         (Esta_En  [Sala_2])
         (Amplada  "41.9")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, First version: ground floor plan")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art86] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  1)
         (ArtistID  8219)
         (Altura  "36.8301")
         (Esta_En  [Sala_3])
         (Amplada  "29.2101")
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspectives of the medical school and auditorium")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Estil2] of Estil
         (Nom  "Abstractismo")
         (Quadres_Estil  [Art2])
         (Pintors_Estil  [Autor7470])
    )

    ([Autor8100] of Author
         (Genere  "male")
         (Pinta  [Art27])
         (AnyNeixement  1869)
         (AnyMort  1936)
         (Nom  "Hans Poelzig")
         (Nacionalitat  "German")
    )

    ([Art44] of Quadre
         (Estil  "Surrealismo")
         (Data  1923)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "56.8")
         (Esta_En  [Sala_2])
         (Amplada  "79.4")
         (Nom  "Skandia Cinema, Stockholm, Sweden, Elevation of front of auditorium")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Autor2964] of Author
         (Genere  "male")
         (Pinta  [Art9])
         (AnyNeixement  1901)
         (AnyMort  1974)
         (Nom  "Louis I. Kahn")
         (Nacionalitat  "American")
    )

    ([Art40] of Quadre
         (Estil  "Arte Naif")
         (Data  1917)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "31.8")
         (Esta_En  [Sala_2])
         (Amplada  "61.6")
         (Nom  "Villa Snellman, Djursholm, Sweden, Exterior elevation")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art52] of Quadre
         (Estil  "Arte Naif")
         (Data  1933)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "90.2")
         (Esta_En  [Sala_2])
         (Amplada  "93.7")
         (Nom  "Public Library, Stockholm, Sweden, Section")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art19] of Quadre
         (Estil  "Arte Naif")
         (Data  1979)
         (Rellevancia  1)
         (ArtistID  7056)
         (Altura  "121.9")
         (Esta_En  [Sala_9])
         (Amplada  "61.0")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall),")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art17] of Quadre
         (Estil  "Arte Naif")
         (Data  1979)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "121.9202")
         (Esta_En  [Sala_9])
         (Amplada  "60.9601")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art49] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  2)
         (ArtistID  27)
         (Altura  "21.0")
         (Esta_En  [Sala_2])
         (Amplada  "26.7")
         (Nom  "Skandia Cinema, Stockholm, Sweden, Perspective of promenade")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Autor7056] of Author
         (Genere  "male")
         (Pinta  [Art18] [Art17] [Art25] [Art19] [Art8] [Art26] [Art22] [Art21] [Art6] [Art23] [Art30] [Art20] [Art10] [Art16] [Art24] [Art14] [Art12] [Art32] [Art4] [Art7])
         (AnyNeixement  1944)
         (AnyMort  1992)
         (Nom  "Bernard Tschumi")
         (Nacionalitat  "Georgian")
    )

    ([Art9] of Quadre
         (Estil  "Romanticismo")
         (Data  1968)
         (Rellevancia  4)
         (ArtistID  2964)
         (Altura  "113.0")
         (Esta_En  [Sala_5])
         (Amplada  "167.6")
         (Nom  "Memorial to the Six Million Jewish Martyrs, project, New York City, New York, Perspective of central pier")
         (Es_De  [Autor2964])
         (Estil_Quadre  [Estil6])
    )

    ([Art64] of Quadre
         (Estil  "Surrealismo")
         (Data  1921)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "19.7")
         (Esta_En  [Sala_2])
         (Amplada  "46.7")
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, First version: exterior perspective")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art5] of Quadre
         (Estil  "Cubismo")
         (Data  1903)
         (Rellevancia  3)
         (ArtistID  7605)
         (Altura  "38.4")
         (Esta_En  [Sala_6])
         (Amplada  "19.1")
         (Nom  "Villa, project, outside Vienna, Austria, Exterior perspective")
         (Es_De  [Autor7605])
         (Estil_Quadre  [Estil4])
    )

    ([Art33] of Quadre
         (Estil  "Fauvismo")
         (Data  1979)
         (Rellevancia  1)
         (ArtistID  1863)
         (Altura  "112.7127")
         (Esta_En  [Sala_9])
         (Amplada  "113.3477")
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Perspective)")
         (Es_De  [Autor1863])
         (Estil_Quadre  [Estil9])
    )

    ([Art89] of Quadre
         (Estil  "Cubismo")
         (Data  1986)
         (Rellevancia  4)
         (ArtistID  2702)
         (Altura  "75.6")
         (Esta_En  [Sala_6])
         (Amplada  "56.5")
         (Nom  "Porta Vittoria, project, Milan, Italy, Subway station and shops, ticket-taker tower, perspective and plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art73] of Quadre
         (Estil  "Arte Naif")
         (Data  1944)
         (Rellevancia  5)
         (ArtistID  8219)
         (Altura  "21.6")
         (Esta_En  [Sala_3])
         (Amplada  "35.9")
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspective and plan")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Sala_0] of Sala
         (Nom  "Entrada")
         (Numero_Sala  0)
         (Connecta_Amb  [Sala_1])
    )

    ([Estil5] of Estil
         (Nom  "Arte Naif")
         (Quadres_Estil  [Art48] [Art88] [Art66] [Art73] [Art12] [Art61] [Art53] [Art56] [Art17] [Art23] [Art84] [Art80] [Art47] [Art54] [Art42] [Art55] [Art25] [Art49] [Art19] [Art8] [Art94] [Art86] [Art22] [Art46] [Art24] [Art30] [Art20] [Art52] [Art51] [Art40] [Art65] [Art82] [Art16] [Art18])
         (Pintors_Estil  [Autor27] [Autor7056] [Autor8219])
    )

    ([Art35] of Quadre
         (Estil  "Surrealismo")
         (Data  1978)
         (Rellevancia  3)
         (ArtistID  2308)
         (Altura  "59.7")
         (Esta_En  [Sala_8])
         (Amplada  "60.0")
         (Nom  "Vacation House Project, Aspen, Colorado, Elevations, interior and exterior perspectives and plan")
         (Es_De  [Autor2308])
         (Estil_Quadre  [Estil8])
    )

    ([Art32] of Quadre
         (Estil  "Expresionismo")
         (Data  1986)
         (Rellevancia  4)
         (ArtistID  7056)
         (Altura  "69.2151")
         (Esta_En  [Sala_9])
         (Amplada  "99.6952")
         (Nom  "Parc de la Villette, Paris, France, Aerial perspective of follies")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Sala_10] of Sala
         (Nom  "Sala_10")
         (Numero_Sala  10)
         (Connecta_Amb  [Sala_11] [Sala_9])
    )

    ([Sala_4] of Sala
         (Nom  "Sala_4")
         (Numero_Sala  4)
         (Connecta_Amb  [Sala_5] [Sala_3])
    )

    ([Art71] of Quadre
         (Estil  "Expresionismo")
         (Data  1935)
         (Rellevancia  4)
         (ArtistID  8219)
         (Altura  "35.6")
         (Esta_En  [Sala_3])
         (Amplada  "29.2")
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Interior perspectives")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art61] of Quadre
         (Estil  "Arte Naif")
         (Data  1935)
         (Rellevancia  5)
         (ArtistID  27)
         (Altura  "30.8")
         (Esta_En  [Sala_2])
         (Amplada  "83.8")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: exterior elevation and section")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art87] of Quadre
         (Estil  "Cubismo")
         (Data  1986)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "76.2")
         (Esta_En  [Sala_6])
         (Amplada  "56.5")
         (Nom  "Porta Vittoria, project, Milan, Italy, View at elliptical passage, perspective and plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Autor7605] of Author
         (Genere  "male")
         (Pinta  [Art5] [Art3])
         (AnyNeixement  1876)
         (AnyMort  1957)
         (Nom  "Emil Hoppe")
         (Nacionalitat  "Austrian")
    )

    ([Estil3] of Estil
         (Nom  "Expresionismo")
         (Quadres_Estil  [Art75] [Art90] [Art3] [Art10] [Art26] [Art92] [Art96] [Art70] [Art32] [Art74] [Art76] [Art91] [Art14] [Art98] [Art4] [Art78] [Art69] [Art7] [Art21] [Art71] [Art6])
         (Pintors_Estil  [Autor8101] [Autor7605] [Autor2702] [Autor7056] [Autor8219])
    )

    ([Autor8101] of Author
         (Genere  "male")
         (Pinta  [Art74])
         (AnyNeixement  1919)
         (AnyMort  2013)
         (Nom  "Paolo Soleri")
         (Nacionalitat  "American")
    )

    ([Art20] of Quadre
         (Estil  "Arte Naif")
         (Data  1979)
         (Rellevancia  1)
         (ArtistID  7056)
         (Altura  "121.9")
         (Esta_En  [Sala_9])
         (Amplada  "61.0")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art6] of Quadre
         (Estil  "Expresionismo")
         (Data  1976)
         (Rellevancia  4)
         (ArtistID  7056)
         (Altura  "35.6")
         (Esta_En  [Sala_9])
         (Amplada  "45.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Art41] of Quadre
         (Estil  "Surrealismo")
         (Data  1917)
         (Rellevancia  5)
         (ArtistID  27)
         (Altura  "39.4")
         (Esta_En  [Sala_2])
         (Amplada  "34.0")
         (Nom  "Villa Snellman, Djursholm, Sweden, Site plan")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art37] of Quadre
         (Estil  "Clasicismo")
         (Data  1978)
         (Rellevancia  2)
         (ArtistID  2308)
         (Altura  "20.3")
         (Esta_En  [Sala_8])
         (Amplada  "20.3")
         (Nom  "Vacation House, project, Aspen, Colorado, Fireplace")
         (Es_De  [Autor2308])
         (Estil_Quadre  [Estil1])
    )

    ([Art56] of Quadre
         (Estil  "Arte Naif")
         (Data  1935)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "39.4")
         (Esta_En  [Sala_2])
         (Amplada  "51.1")
         (Nom  "Law Courts Annex, Gothenburg, Sweden, Plan of courtroom and section of desk")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art92] of Quadre
         (Estil  "Expresionismo")
         (Data  1936)
         (Rellevancia  1)
         (ArtistID  8219)
         (Altura  "35.2")
         (Esta_En  [Sala_3])
         (Amplada  "24.1")
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Israel, Perspectives and elevation")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art83] of Quadre
         (Estil  "Cubismo")
         (Data  1986)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "75.6")
         (Esta_En  [Sala_6])
         (Amplada  "56.8")
         (Nom  "Porta Vittoria, project, Milan, Italy, Garden of Sounds, perspective and plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Autor8219] of Author
         (Genere  "male")
         (Pinta  [Art86] [Art84] [Art82] [Art73] [Art94] [Art92] [Art96] [Art98] [Art78] [Art76] [Art80] [Art90] [Art71] [Art88])
         (AnyNeixement  1887)
         (AnyMort  1953)
         (Nom  "Erich Mendelsohn")
         (Nacionalitat  "American")
    )

    ([Art29] of Quadre
         (Estil  "Fauvismo")
         (Data  1979)
         (Rellevancia  4)
         (ArtistID  1863)
         (Altura  "141.6")
         (Esta_En  [Sala_9])
         (Amplada  "110.8")
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Structural details)")
         (Es_De  [Autor1863])
         (Estil_Quadre  [Estil9])
    )

    ([Art4] of Quadre
         (Estil  "Expresionismo")
         (Data  1980)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "50.8")
         (Esta_En  [Sala_9])
         (Amplada  "50.8")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 1: The Park")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Art36] of Quadre
         (Estil  "Clasicismo")
         (Data  1978)
         (Rellevancia  1)
         (ArtistID  2308)
         (Altura  "27.6")
         (Esta_En  [Sala_8])
         (Amplada  "27.3")
         (Nom  "French & Company, project, New York (Manhattan), New York, Facade study")
         (Es_De  [Autor2308])
         (Estil_Quadre  [Estil1])
    )

    ([Sala_3] of Sala
         (Nom  "Sala_3")
         (Numero_Sala  3)
         (Connecta_Amb  [Sala_4] [Sala_2])
    )

    ([Sala_7] of Sala
         (Nom  "Sala_7")
         (Numero_Sala  7)
         (Connecta_Amb  [Sala_8] [Sala_6])
    )

    ([Art48] of Quadre
         (Estil  "Arte Naif")
         (Data  1931)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "33.0")
         (Esta_En  [Sala_2])
         (Amplada  "29.8")
         (Nom  "Skandia Cinema, Stockholm, Sweden, Perspective of staircase")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Autor5076] of Author
         (Genere  "male")
         (Pinta  [Art99] [Art95] [Art97])
         (AnyNeixement  1918)
         (AnyMort  1997)
         (Nom  "Paul Rudolph")
         (Nacionalitat  "American")
    )

    ([Art21] of Quadre
         (Estil  "Expresionismo")
         (Data  1980)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "50.8")
         (Esta_En  [Sala_9])
         (Amplada  "50.8")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 4: The Block")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Art82] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "27.3051")
         (Esta_En  [Sala_3])
         (Amplada  "35.8776")
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspective")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Art25] of Quadre
         (Estil  "Arte Naif")
         (Data  1980)
         (Rellevancia  1)
         (ArtistID  7056)
         (Altura  "48.3")
         (Esta_En  [Sala_9])
         (Amplada  "78.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block,")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Sala_1] of Sala
         (Nom  "Sala_1")
         (Numero_Sala  1)
         (Connecta_Amb  [Sala_2] [Sala_0])
    )

    ([Art34] of Quadre
         (Estil  "Surrealismo")
         (Data  1978)
         (Rellevancia  4)
         (ArtistID  2308)
         (Altura  "30.2")
         (Esta_En  [Sala_8])
         (Amplada  "30.2")
         (Nom  "Fargo-Moorhead Cultural Center Bridge, project, Fargo, North Dakota and Moorhead, Minnesota, South elevation")
         (Es_De  [Autor2308])
         (Estil_Quadre  [Estil8])
    )

    ([Art97] of Quadre
         (Estil  "Arte Pop")
         (Data  1949)
         (Rellevancia  4)
         (ArtistID  5076)
         (Altura  "64.8")
         (Esta_En  [Sala_6])
         (Amplada  "47.9")
         (Nom  "Finney Guest House Project, Siesta Key, Florida, Aerial perspective")
         (Es_De  [Autor5076])
         (Estil_Quadre  [Estil7])
    )

    ([Art16] of Quadre
         (Estil  "Arte Naif")
         (Data  1979)
         (Rellevancia  1)
         (ArtistID  7056)
         (Altura  "121.9")
         (Esta_En  [Sala_9])
         (Amplada  "61.0")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art46] of Quadre
         (Estil  "Arte Naif")
         (Data  1923)
         (Rellevancia  2)
         (ArtistID  27)
         (Altura  "47.9")
         (Esta_En  [Sala_2])
         (Amplada  "55.2")
         (Nom  "Skandia Cinema, Stockholm, Sweden, Plan of ground floor")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art88] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  1)
         (ArtistID  8219)
         (Altura  "21.9075")
         (Esta_En  [Sala_3])
         (Amplada  "40.6401")
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspective")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Art94] of Quadre
         (Estil  "Arte Naif")
         (Data  1933)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "30.2")
         (Esta_En  [Sala_3])
         (Amplada  "36.8")
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspectives and elevation")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Art2] of Quadre
         (Estil  "Abstractismo")
         (Data  1987)
         (Rellevancia  2)
         (ArtistID  7470)
         (Altura  "40.6401")
         (Esta_En  [Sala_3])
         (Amplada  "29.8451")
         (Nom  "City of Music, National Superior Conservatory of Music and Dance, Paris, France, View from interior courtyard")
         (Es_De  [Autor7470])
         (Estil_Quadre  [Estil2])
    )

    ([Art67] of Quadre
         (Estil  "Surrealismo")
         (Data  1937)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "29.5")
         (Esta_En  [Sala_2])
         (Amplada  "83.8")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Exterior elevation of loggia")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art98] of Quadre
         (Estil  "Expresionismo")
         (Data  1923)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "41.9")
         (Esta_En  [Sala_3])
         (Amplada  "29.2")
         (Nom  "Gated Wall, Perspective and elevation")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art15] of Quadre
         (Estil  "Surrealismo")
         (Data  1906)
         (Rellevancia  3)
         (ArtistID  7608)
         (Altura  "29.6")
         (Esta_En  [Sala_9])
         (Amplada  "35.8")
         (Nom  "Imperial Post Office, Teschen, Austria (Elevation)")
         (Es_De  [Autor7608])
         (Estil_Quadre  [Estil8])
    )

    ([Art57] of Quadre
         (Estil  "Surrealismo")
         (Data  1935)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "30.5")
         (Esta_En  [Sala_2])
         (Amplada  "83.5")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: section and two exterior elevations")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art91] of Quadre
         (Estil  "Expresionismo")
         (Data  1986)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "75.6")
         (Esta_En  [Sala_6])
         (Amplada  "56.5")
         (Nom  "Porta Vittoria, project, Milan, Italy, Water basin, amphitheater, and jack-up rig, perspective and plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil3])
    )

    ([Art23] of Quadre
         (Estil  "Arte Naif")
         (Data  1980)
         (Rellevancia  3)
         (ArtistID  7056)
         (Altura  "48.2")
         (Esta_En  [Sala_9])
         (Amplada  "78.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art55] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "30.5")
         (Esta_En  [Sala_2])
         (Amplada  "70.5")
         (Nom  "Law Courts Annex, Gothenburg, Sweden, Exterior elevation")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art28] of Quadre
         (Estil  "Fauvismo")
         (Data  1970)
         (Rellevancia  2)
         (ArtistID  47)
         (Altura  "87.3127")
         (Esta_En  [Sala_4])
         (Amplada  "135.8903")
         (Nom  "Earth-Cloud House, project")
         (Es_De  [Autor47])
         (Estil_Quadre  [Estil9])
    )

    ([Autor6210] of Author
         (Genere  "male")
         (Pinta  [Art1])
         (AnyNeixement  1841)
         (AnyMort  1918)
         (Nom  "Otto Wagner")
         (Nacionalitat  "Austrian")
    )

    ([Estil9] of Estil
         (Nom  "Fauvismo")
         (Quadres_Estil  [Art31] [Art29] [Art33] [Art28])
         (Pintors_Estil  [Autor1863] [Autor47])
    )

    ([Autor2308] of Author
         (Genere  "male")
         (Pinta  [Art34] [Art37] [Art35] [Art36])
         (AnyNeixement  1934)
         (AnyMort  2015)
         (Nom  "Michael Graves")
         (Nacionalitat  "American")
    )

    ([Autor27] of Author
         (Genere  "male")
         (Pinta  [Art46] [Art48] [Art41] [Art57] [Art52] [Art51] [Art44] [Art40] [Art65] [Art62] [Art43] [Art61] [Art45] [Art53] [Art59] [Art66] [Art58] [Art63] [Art56] [Art39] [Art60] [Art67] [Art47] [Art54] [Art42] [Art38] [Art50] [Art55] [Art64] [Art68] [Art49])
         (AnyNeixement  1885)
         (AnyMort  1940)
         (Nom  "Erik Gunnar Asplund")
         (Nacionalitat  "Swedish")
    )

    ([Art63] of Quadre
         (Estil  "Surrealismo")
         (Data  1891)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "26.0")
         (Esta_En  [Sala_2])
         (Amplada  "62.9")
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior perspective")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Autor7608] of Author
         (Genere  "male")
         (Pinta  [Art15] [Art13])
         (AnyNeixement  1878)
         (AnyMort  1961)
         (Nom  "Otto Schonthal")
         (Nacionalitat  "Austrian")
    )

    ([Estil8] of Estil
         (Nom  "Surrealismo")
         (Quadres_Estil  [Art58] [Art34] [Art15] [Art63] [Art39] [Art67] [Art38] [Art68] [Art41] [Art35] [Art57] [Art44] [Art62] [Art43] [Art45] [Art60] [Art59] [Art50] [Art64])
         (Pintors_Estil  [Autor7608] [Autor2308] [Autor27])
    )

    ([Art96] of Quadre
         (Estil  "Expresionismo")
         (Data  1938)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "29.8")
         (Esta_En  [Sala_3])
         (Amplada  "37.5")
         (Nom  "Gated Wall, Perspective and elevation")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art90] of Quadre
         (Estil  "Expresionismo")
         (Data  1924)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "34.2901")
         (Esta_En  [Sala_3])
         (Amplada  "28.7338")
         (Nom  "Residence of Salman Schocken, Jerusalem, Israel, Perspective and elevation")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art75] of Quadre
         (Estil  "Expresionismo")
         (Data  1980)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "8.3")
         (Esta_En  [Sala_6])
         (Amplada  "33.0")
         (Nom  "Autonomous Artisans' House, project, Staten Island, New York, Perspective")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil3])
    )

    ([Sala_2] of Sala
         (Nom  "Sala_2")
         (Numero_Sala  2)
         (Connecta_Amb  [Sala_1] [Sala_3])
    )

    ([Art51] of Quadre
         (Estil  "Arte Naif")
         (Data  1927)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "90.8")
         (Esta_En  [Sala_2])
         (Amplada  "93.0")
         (Nom  "Public Library, Stockholm, Sweden, Elevation of west facade")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art76] of Quadre
         (Estil  "Expresionismo")
         (Data  1910)
         (Rellevancia  3)
         (ArtistID  8219)
         (Altura  "20.3")
         (Esta_En  [Sala_3])
         (Amplada  "35.9")
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Elevations")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art12] of Quadre
         (Estil  "Arte Naif")
         (Data  1978)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "60.9601")
         (Esta_En  [Sala_9])
         (Amplada  "817.8816")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 2: The Street (Border Crossing)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art66] of Quadre
         (Estil  "Arte Naif")
         (Data  1930)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "65.4")
         (Esta_En  [Sala_2])
         (Amplada  "101.6")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Exterior-perspective study")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art11] of Quadre
         (Estil  "Arte Pop")
         (Data  1900)
         (Rellevancia  2)
         (ArtistID  7607)
         (Altura  "47.9")
         (Esta_En  [Sala_6])
         (Amplada  "31.4")
         (Nom  "Royal Hunting Tent, project, Exterior perspective")
         (Es_De  [Autor7607])
         (Estil_Quadre  [Estil7])
    )

    ([Autor7470] of Author
         (Genere  "male")
         (Pinta  [Art2])
         (AnyNeixement  1944)
         (AnyMort  1976)
         (Nom  "Christian de Portzamparc")
         (Nacionalitat  "French")
    )

    ([Art3] of Quadre
         (Estil  "Expresionismo")
         (Data  1903)
         (Rellevancia  2)
         (ArtistID  7605)
         (Altura  "34.3")
         (Esta_En  [Sala_6])
         (Amplada  "31.8")
         (Nom  "Villa near Vienna Project, Outside Vienna, Austria, Elevation")
         (Es_De  [Autor7605])
         (Estil_Quadre  [Estil3])
    )

    ([Art77] of Quadre
         (Estil  "Cubismo")
         (Data  1984)
         (Rellevancia  3)
         (ArtistID  2702)
         (Altura  "52.1")
         (Esta_En  [Sala_6])
         (Amplada  "103.5")
         (Nom  "Autonomous Artisans' House, project, New York (Staten Island), New York, Perspective")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art81] of Quadre
         (Estil  "Cubismo")
         (Data  1986)
         (Rellevancia  1)
         (ArtistID  2702)
         (Altura  "75.6")
         (Esta_En  [Sala_6])
         (Amplada  "56.5")
         (Nom  "Porta Vittoria, project, Milan, Italy, View from court of four-sided pentagon, perspective, site plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art43] of Quadre
         (Estil  "Surrealismo")
         (Data  1917)
         (Rellevancia  2)
         (ArtistID  27)
         (Altura  "56.5")
         (Esta_En  [Sala_2])
         (Amplada  "62.2")
         (Nom  "Villa Snellman, Djursholm, Sweden, Second-floor plan")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art39] of Quadre
         (Estil  "Surrealismo")
         (Data  1917)
         (Rellevancia  2)
         (ArtistID  27)
         (Altura  "31.1")
         (Esta_En  [Sala_2])
         (Amplada  "61.9")
         (Nom  "Villa Snellman, Djursholm, Sweden, Exterior elevation")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art62] of Quadre
         (Estil  "Surrealismo")
         (Data  1935)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "30.5")
         (Esta_En  [Sala_2])
         (Amplada  "83.5")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: Two sections")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art47] of Quadre
         (Estil  "Arte Naif")
         (Data  1923)
         (Rellevancia  2)
         (ArtistID  27)
         (Altura  "47.9")
         (Esta_En  [Sala_2])
         (Amplada  "55.5")
         (Nom  "Skandia Cinema, Stockholm, Sweden, Floor plan of mezzanine")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil5])
    )

    ([Art69] of Quadre
         (Estil  "Expresionismo")
         (Data  1977)
         (Rellevancia  1)
         (ArtistID  2702)
         (Altura  "33.3")
         (Esta_En  [Sala_6])
         (Amplada  "30.2")
         (Nom  "Gymnasium-Bridge, project, New York City, New York, Perspective")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil3])
    )

    ([Art45] of Quadre
         (Estil  "Surrealismo")
         (Data  1923)
         (Rellevancia  5)
         (ArtistID  27)
         (Altura  "57.2")
         (Esta_En  [Sala_2])
         (Amplada  "79.1")
         (Nom  "Skandia Cinema, Stockholm, Sweden, Elevation of rear of auditorium")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Estil4] of Estil
         (Nom  "Cubismo")
         (Quadres_Estil  [Art85] [Art5] [Art83] [Art89] [Art72] [Art77] [Art79] [Art87] [Art81] [Art93])
         (Pintors_Estil  [Autor2702] [Autor7605])
    )

    ([Sala_6] of Sala
         (Nom  "Sala_6")
         (Numero_Sala  6)
         (Connecta_Amb  [Sala_5] [Sala_7])
    )

    ([Art85] of Quadre
         (Estil  "Cubismo")
         (Data  1986)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "75.6")
         (Esta_En  [Sala_6])
         (Amplada  "56.5")
         (Nom  "Porta Vittoria, project, Milan, Italy, New subway station opening onto elongated gap, perspective and plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art60] of Quadre
         (Estil  "Surrealismo")
         (Data  1935)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "30.8")
         (Esta_En  [Sala_2])
         (Amplada  "83.3")
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior elevation")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art59] of Quadre
         (Estil  "Surrealismo")
         (Data  1935)
         (Rellevancia  5)
         (ArtistID  27)
         (Altura  "30.8")
         (Esta_En  [Sala_2])
         (Amplada  "83.5")
         (Nom  "Woodland Crematorium, Stockholm, Sweden, Second version: exterior elevation")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Autor7607] of Author
         (Genere  "male")
         (Pinta  [Art11])
         (AnyNeixement  1878)
         (AnyMort  1969)
         (Nom  "Marcel Kammerer")
         (Nacionalitat  "Austrian")
    )

    ([Art58] of Quadre
         (Estil  "Surrealismo")
         (Data  1935)
         (Rellevancia  2)
         (ArtistID  27)
         (Altura  "30.8")
         (Esta_En  [Sala_2])
         (Amplada  "83.8")
         (Nom  "Woodland Crematorium, Woodland Cemetery, Stockholm, Sweden, Second version: exterior elevation")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art99] of Quadre
         (Estil  "Arte Pop")
         (Data  1958)
         (Rellevancia  4)
         (ArtistID  5076)
         (Altura  "69.2")
         (Esta_En  [Sala_6])
         (Amplada  "87.0")
         (Nom  "Yale University, Art and Architecture Building, New Haven, Connecticut, Elevation")
         (Es_De  [Autor5076])
         (Estil_Quadre  [Estil7])
    )

    ([Autor1863] of Author
         (Genere  "male")
         (Pinta  [Art31] [Art29] [Art33])
         (AnyNeixement  1949)
         (AnyMort  1991)
         (Nom  "Roger C. Ferri")
         (Nacionalitat  "American")
    )

    ([Art7] of Quadre
         (Estil  "Expresionismo")
         (Data  1976)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "35.6")
         (Esta_En  [Sala_9])
         (Amplada  "45.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 1: The Park")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Art95] of Quadre
         (Estil  "Arte Pop")
         (Data  1989)
         (Rellevancia  2)
         (ArtistID  5076)
         (Altura  "37.1")
         (Esta_En  [Sala_6])
         (Amplada  "164.5")
         (Nom  "Residence for Herbert Green, Studies for an Unfolded Modular House, Cherry Hill, Pennsylvania, Perspective")
         (Es_De  [Autor5076])
         (Estil_Quadre  [Estil7])
    )

    ([Art27] of Quadre
         (Estil  "Clasicismo")
         (Data  1918)
         (Rellevancia  2)
         (ArtistID  8100)
         (Altura  "37.1")
         (Esta_En  [Sala_6])
         (Amplada  "41.0")
         (Nom  "Concert Hall Project, Dresden, Germany (Interior perspective of preliminary scheme)")
         (Es_De  [Autor8100])
         (Estil_Quadre  [Estil1])
    )

    ([Art24] of Quadre
         (Estil  "Arte Naif")
         (Data  1980)
         (Rellevancia  2)
         (ArtistID  7056)
         (Altura  "48.3")
         (Esta_En  [Sala_9])
         (Amplada  "78.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 4: The Block")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art78] of Quadre
         (Estil  "Expresionismo")
         (Data  1914)
         (Rellevancia  3)
         (ArtistID  8219)
         (Altura  "34.9")
         (Esta_En  [Sala_3])
         (Amplada  "17.8")
         (Nom  "Library and Office Building of Salman Schocken, Jerusalem, Israel, Perspectives and elevation")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil3])
    )

    ([Art10] of Quadre
         (Estil  "Expresionismo")
         (Data  1980)
         (Rellevancia  5)
         (ArtistID  7056)
         (Altura  "50.8")
         (Esta_En  [Sala_9])
         (Amplada  "50.8")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 2: The Street (Border Crossing)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Estil1] of Estil
         (Nom  "Clasicismo")
         (Quadres_Estil  [Art1] [Art36] [Art37] [Art27])
         (Pintors_Estil  [Autor2308] [Autor6210] [Autor8100])
    )

    ([Art80] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "21.59")
         (Esta_En  [Sala_3])
         (Amplada  "13.6525")
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Perspectives")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Sala_5] of Sala
         (Nom  "Sala_5")
         (Numero_Sala  5)
         (Connecta_Amb  [Sala_6] [Sala_4])
    )

    ([Art31] of Quadre
         (Estil  "Fauvismo")
         (Data  1979)
         (Rellevancia  3)
         (ArtistID  1863)
         (Altura  "141.6053")
         (Esta_En  [Sala_9])
         (Amplada  "110.8077")
         (Nom  "Pedestrian City project, Hypostyle Courtyard (Developed plan and section elevations)")
         (Es_De  [Autor1863])
         (Estil_Quadre  [Estil9])
    )

    ([Art18] of Quadre
         (Estil  "Arte Naif")
         (Data  1980)
         (Rellevancia  4)
         (ArtistID  7056)
         (Altura  "121.9")
         (Esta_En  [Sala_9])
         (Amplada  "61.0")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Episode 3: The Tower (The Fall)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art26] of Quadre
         (Estil  "Expresionismo")
         (Data  1980)
         (Rellevancia  3)
         (ArtistID  7056)
         (Altura  "48.3")
         (Esta_En  [Sala_9])
         (Amplada  "78.7")
         (Nom  "The Manhattan Transcripts Project, New York, New York , Episode 4: The Block")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Estil7] of Estil
         (Nom  "Arte Pop")
         (Quadres_Estil  [Art95] [Art97] [Art99] [Art11] [Art13])
         (Pintors_Estil  [Autor7608] [Autor7607] [Autor5076])
    )

    ([Art1] of Quadre
         (Estil  "Clasicismo")
         (Data  1896)
         (Rellevancia  4)
         (ArtistID  6210)
         (Altura  "48.6")
         (Esta_En  [Sala_10])
         (Amplada  "168.9")
         (Nom  "Ferdinandsbrucke Project, Vienna, Austria (Elevation, preliminary version)")
         (Es_De  [Autor6210])
         (Estil_Quadre  [Estil1])
    )

    ([Art74] of Quadre
         (Estil  "Expresionismo")
         (Data  1958)
         (Rellevancia  3)
         (ArtistID  8101)
         (Altura  "55.2")
         (Esta_En  [Sala_6])
         (Amplada  "150.2")
         (Nom  "Helium Bridge Project")
         (Es_De  [Autor8101])
         (Estil_Quadre  [Estil3])
    )

    ([Art79] of Quadre
         (Estil  "Cubismo")
         (Data  1985)
         (Rellevancia  2)
         (ArtistID  2702)
         (Altura  "52.0701")
         (Esta_En  [Sala_6])
         (Amplada  "107.9502")
         (Nom  "Berkowitz House, Martha's Vineyard, Massachusetts, Exterior perspective")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art93] of Quadre
         (Estil  "Cubismo")
         (Data  1986)
         (Rellevancia  5)
         (ArtistID  2702)
         (Altura  "75.6")
         (Esta_En  [Sala_6])
         (Amplada  "56.5")
         (Nom  "Porta Vittoria, project, Milan, Italy, Passage below water basin, perspective and plan")
         (Es_De  [Autor2702])
         (Estil_Quadre  [Estil4])
    )

    ([Art30] of Quadre
         (Estil  "Arte Naif")
         (Data  1984)
         (Rellevancia  4)
         (ArtistID  7056)
         (Altura  "94.4564")
         (Esta_En  [Sala_9])
         (Amplada  "94.7739")
         (Nom  "Parc de la Villette, Le Case Vide, Paris, France (Axonometric of folly)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil5])
    )

    ([Art50] of Quadre
         (Estil  "Surrealismo")
         (Data  1910)
         (Rellevancia  1)
         (ArtistID  27)
         (Altura  "91.4")
         (Esta_En  [Sala_2])
         (Amplada  "93.3")
         (Nom  "Public Library, Stockholm, Sweden, Elevation of front facade")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art14] of Quadre
         (Estil  "Expresionismo")
         (Data  1980)
         (Rellevancia  1)
         (ArtistID  7056)
         (Altura  "50.8")
         (Esta_En  [Sala_9])
         (Amplada  "50.8")
         (Nom  "The Manhattan Transcripts Project, New York, New York, Introductory panel to Episode 3: The Tower (The Fall)")
         (Es_De  [Autor7056])
         (Estil_Quadre  [Estil3])
    )

    ([Art38] of Quadre
         (Estil  "Surrealismo")
         (Data  1917)
         (Rellevancia  3)
         (ArtistID  27)
         (Altura  "23.2")
         (Esta_En  [Sala_2])
         (Amplada  "34.9")
         (Nom  "Villa Snellman, Djursholm, Sweden, Elevation of garden facade, sketch")
         (Es_De  [Autor27])
         (Estil_Quadre  [Estil8])
    )

    ([Art84] of Quadre
         (Estil  "Arte Naif")
         (Data  1936)
         (Rellevancia  2)
         (ArtistID  8219)
         (Altura  "36.2")
         (Esta_En  [Sala_3])
         (Amplada  "29.2")
         (Nom  "Hadassah University Medical Center, Mount Scopus, Jerusalem, Interior perspective and details of furniture")
         (Es_De  [Autor8219])
         (Estil_Quadre  [Estil5])
    )

    ([Sala_11] of Sala
         (Nom  "Sortida")
         (Numero_Sala  11)
         (Connecta_Amb  [Sala_10])
    )

    ([Estil6] of Estil
         (Nom  "Romanticismo")
         (Quadres_Estil  [Art9])
         (Pintors_Estil  [Autor2964])
    )

    ([Art13] of Quadre
         (Estil  "Arte Pop")
         (Data  1905)
         (Rellevancia  1)
         (ArtistID  7608)
         (Altura  "30.5")
         (Esta_En  [Sala_9])
         (Amplada  "21.6")
         (Nom  "House in Krems, project, Krems, Austria, Elevation")
         (Es_De  [Autor7608])
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


(deftemplate MAIN::dies_ordenats_sala
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
    (bind ?resposta (pregunta-numerica "Esculli una opcio:" 1 (length$ ?valores-posibles)))
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
    (format t "%s" "Indica els numeros separats per un espai: ")
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

(deffunction ordenar-sala ($?tour)
     (bind ?minimo 10)
     (bind ?elemento nil)
     (progn$ (?curr-rec $?tour)
          (bind ?curr-quadre (send ?curr-rec get-nom_quadre))
          (bind ?ins-sala (send ?curr-quadre get-Esta_En))
          (bind ?curr-sala (send ?ins-sala  get-Numero_Sala))
          (if (<= ?curr-sala ?minimo)
               then
               (bind ?minimo ?curr-sala)
               (bind ?elemento ?curr-rec)
          )
     )
     ?elemento
)

;;; ----------------------- Fi declaracio de funcions --------------------------

;;; ----------------------- Declaracio de regles y fet -------------------------

(defrule MAIN::initialRule "Regla inicial"
	(declare (salience 10))
	=>
  (printout t " _________________________ " crlf)
  (printout t "                           " crlf)
  (printout t "   -   -   -   -   -   -   " crlf)
  (printout t " ( M | U | S | E | U | M ) " crlf)
  (printout t "   -   -   -   -   -   -   " crlf)
  (printout t " _________________________ " crlf)
  (printout t crlf)
	(printout t "Benvingut al nostre sistema de recomanacio de visites! " crlf)
	(printout t "Si us plau, contesti les preguntes que venen a continuacio " crlf)
  (printout t "per tal d'oferir-vos un tour pel nostre museu." crlf)
	(printout t crlf)
	(focus dades-visita)
)

(defrule dades-visita::definicio_tipus "Tipus de Visita"
	(not (Visita))
	=>
	(bind ?t (pregunta-numerica "Quanta gent son? " 1 50))
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

    (bind ?var (create$ "Una placa de toros" "Un bombardeig"))
    (bind ?resposta (pregunta-index "Que representa el quadre de Guernica de Pablo Picasso?" ?var))
        (if (= ?resposta 2) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "Impressionisme" "Surrealisme" "Dadaisme" "K-Pop"))
    (bind ?resposta (pregunta-index "Claude Monet va ser un dels creadors d'aquest moviment artistic:" ?var))
        (if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "Risto Mejide" "Zaha Hadid" "Diego Velazquez" "Frank O. Gehry"))
    (bind ?resposta (pregunta-index "El Museu Guggenheim Bilbao va ser dissenyat per:" ?var))
        (if (= ?resposta 4) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "AC DC" "Alfa i Omega"))
    (bind ?resposta (pregunta-index "En l'art medieval ¿quines dues lletres s'associen a Crist?" ?var))
        (if (= ?resposta 2) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "Sandro Botticelli" "Papa Francesc" "Miguel Angel" "Pinturillo"))
    (bind ?resposta (pregunta-index "El Judici Final va ser pintat per:" ?var))
        (if (= ?resposta 3) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "El Moulin de la Galette" "Razzmatazz" "El Parc de la Ciutadella"))
    (bind ?resposta (pregunta-index "Quin era l'espai d'esbarjo que acostumaven a frequentar els artistes bohemis l'any 1900?" ?var))
        (if (= ?resposta 1) then (bind ?score (+ 1 ?score)))

    (bind ?var (create$ "Ratafia" "Absenta" "Carajillo" "Vodka Naranja"))
    (bind ?resposta (pregunta-index "Moltes obres d'inicis de segle XX mostren personatges en estat d'embriaguesa. Quina beguda provocava aquests efectes?" ?var))
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

(defrule processat_dades::valorar-coneixement-alt "Millorar puntuacio dels quadres"
	(Visita (coneixement ?coneixement))
	(test (> ?coneixement 4))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <-(object (is-a Quadre) (Rellevancia ?relevancia))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valoracio ?cont ?coneixement))
	=>
    (if (> ?relevancia 3) then
        (bind ?p (+ ?p 70))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Te una rellevancia alta acord al coneixement del visitant -> +70"))
	)
	(send ?rec put-puntuacio ?p)
    (send ?rec put-justificacions $?just)
    (assert (valoracio ?cont ?coneixement))
    (printout t "Valorant coneixement del grup..." crlf)
)

(defrule processat_dades::valorar-coneixement-baix "Millorar puntuacio dels quadres"
	(Visita (coneixement ?coneixement))
	(test (<= ?coneixement 4))
	?rec <- (object (is-a Recomanacio) (nom_quadre ?conta) (puntuacio ?p) (justificacions $?just))
	?cont <-(object (is-a Quadre) (Rellevancia ?relevancia))
	(test (eq (instance-name ?cont) (instance-name ?conta)))
	(not (valoracio ?cont ?coneixement))
	=>
    (if (< ?relevancia 4) then
        (bind ?p (+ ?p 40))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Te una rellevancia mitjana/baixa acord al coneixement del visitant -> +40"))
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
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Te una altura suficient per un grup -> +20"))
	)
    (if (> (string_to_float ?w) 40.0) then
        (bind ?p (+ ?p 20))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Te una amplada suficient per un grup -> +20"))
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
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Te una altura suficient per un grup gran -> +30"))
	)
    (if (> (string_to_float ?w) 80.0) then
        (bind ?p (+ ?p 30))
		(bind $?just (insert$ $?just (+ (length$ $?just) 1) "Te una amplada suficient per un grup gran -> +30"))
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

(defrule processat_dades::valorar-estils-preferits "Es millora la puntuacio de quadres amb estils preferits"
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
		(bind ?asignats 0)
    ;;
        (bind ?j 1)
		(while (and(and(< ?t-ocu ?t-max) (< ?try 4)) (> (length$ $?recs) 0) (<= ?j (length$ ?recs))) do
			(bind ?rec (nth$ ?j $?recs))
			(bind ?cont (send ?rec get-nom_quadre))
		;   (bind ?a (send ?cont get-Altura))
      		(bind ?a (* (string_to_float (send ?cont get-Amplada)) (string_to_float (send ?cont get-Altura))))
            (if (eq ?tipus "Individu") then
                (if (> ?a 5000) then (bind ?t 14))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 12))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 8))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 6))
            )
            (if (eq ?tipus "Parella") then
                (if (> ?a 5000) then (bind ?t 15))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 13))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 9))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 7))

            )
            (if (eq ?tipus "Grup petit") then
                (if (> ?a 5000) then (bind ?t 16))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 14))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 10))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 8))

            )
            (if (eq ?tipus "Grup gran") then
                (if (> ?a 5000) then (bind ?t 18))
                (if (and (> ?a 1500) (< ?a 5000)) then (bind ?t 16))
                (if (and (> ?a 500) (< ?a 1500)) then (bind ?t 12))
                (if (and (> ?a 0) (< ?a 500)) then (bind ?t 10))
            )
      ;;
			(if (< (+ ?t-ocu ?t) ?t-max)
				then
					(bind ?t-ocu (+ ?t-ocu ?t))
					(bind ?try 1)
					(bind ?asignats (+ ?asignats 1))
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

(defrule resultats::ordena-por-salas "Ordena cada dia por salas."
    (llista_dies (dies $?tour))
    =>
    (progn$ (?curr-dia $?tour)
        (bind $?resultado (create$ ))

        (bind $?recs (send ?curr-dia get-recomanacions))
        (while (not (eq (length$ $?recs) 0))  do
            (bind ?curr-rec (ordenar-sala $?recs))
            (bind $?recs (delete-member$ $?recs ?curr-rec))
            (bind $?resultado (insert$ $?resultado (+ (length$ $?resultado) 1) ?curr-rec))
        )
        (send ?curr-dia put-recomanacions $?resultado)
       
    )
    (assert (dies_ordenats_sala (dies $?tour))) 
)


(defrule resultats::passar-a-mostrar "Mostrar resultats"
    (dies_ordenats_sala)
	=>
	(focus mostrar)
)

;;; ---------------- FUNCIONS MEVES -----------------------

(defrule mostrar::totsElsQuadres "Mostrar tots els quadres"
    (dies_ordenats_sala (dies $?tour))
    (not (final))
    =>
    (printout t crlf)
	(format t "El vostre tour per el museu:")
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
