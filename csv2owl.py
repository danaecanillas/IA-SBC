import csv

IRI = "###  http://www.semanticweb.org/05087/ontologies/2020/10/ontologia_museu#"
tipusAuthor = "rdf:type owl:NamedIndividual ,\n\t\t:Author ;\n"
tipusArtwork = "rdf:type owl:NamedIndividual ,\n\t\t:Quadre ;\n"

artistes = {}

#ArtistID,Title,Date,Medium,Width (cm),Height (cm)
f = open('quadres.txt', 'w')
with open('artworks.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        elif line_count < 10:
            f.write(IRI+f'Art{line_count}')
            f.write(f'\n:Art{line_count} '+tipusArtwork)
            f.write(f'\t:ArtistID {row[0]} ;\n\t:Nom \"{row[1]}\" ;\n\t:Data {row[2]} ;\n\t:Medi \"{row[3]}\" ;\n\t:Amplada {row[4]} ;\n\t:Altura {row[5]} ;\n')
            f.write(f'\t:Esta_En :Sala_{1} ;\n')
            f.write(f'\t:Es_De :Autor{row[0]} .\n\n')
            artistes[row[0]] = artistes.get(row[0], []) + [f'Art{line_count}']
            
            line_count += 1
        else:
            break
f.close()

# print(artistes)

#ID,Name,Nationality,BeginDate,EndDate,Gender
f = open('autors.txt', 'w')
with open('artists.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        elif line_count < 10:
            f.write(IRI+"Autor"+row[0])
            
            f.write(f'\n:Autor{row[0]} '+tipusAuthor)
            
            if row[0] in artistes:
                f.write(f'\t:Pinta\n')
                f.write(f'\t\t:{artistes[row[0]][0]}')
                for quadre in artistes[row[0]][1:]:
                    f.write(f',\n\t\t:{quadre}')
                f.write(';\n')
            f.write(f'\t:ArtistID {row[0]} ;\n\t:Nom \"{row[1]}\" ;\n\t:Nacionalitat \"{row[2]}\" ;\n\t:AnyNeixement {row[3]} ;\n\t:AnyMort {row[4]} ;\n\t:Genere \"{row[5]}\" .\n\n')
            
            line_count += 1
        else:
            break
f.close()
