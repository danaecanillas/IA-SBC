import csv

IRI = "###  http://www.semanticweb.org/05087/ontologies/2020/10/ontologia_museu#"
tipusAuthor = "rdf:type owl:NamedIndividual ,\n\t\t:Author ;\n"
tipusArtwork = "rdf:type owl:NamedIndividual ,\n\t\t:Quadre ;\n"
tipusSala = "rdf:type owl:NamedIndividual ,\n\t\t:Sala ;\n"

artistes = {}

#ArtistID,Title,Date,Medium,Width (cm),Height (cm),style,room,relevance
f = open('quadres.txt', 'w')
with open('artworks_2.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        elif line_count < 10:
            f.write(IRI+f'Art{line_count}')
            f.write(f'\n:Art{line_count} '+tipusArtwork)
            f.write(f'\t:ArtistID {row[0]} ;\n\t:Nom \"{row[1]}\" ;\n\t:Data {row[2]} ;\n\t:Medi \"{row[3]}\" ;\n\t:Amplada {row[4]} ;\n\t:Altura {row[5]} ;\n')
            f.write(f'\t:Estil \"{row[6]}\" ;\n\t:Rellevancia {row[8]} ;\n')
            f.write(f'\t:Esta_En :Sala_{row[7]} ;\n')
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


f = open('sales.txt', 'w')
with open('sales.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        else:
            f.write(IRI+"Sala_"+row[0])
            f.write(f'\n:Sala_{row[0]} '+tipusSala)
            if(len(row[2]) > 0):
                f.write('\t:Connecta_Amb\n')
                f.write(f'\t\t:Sala_{row[2].split()[0]}')
                for sala in row[2].split()[1:]:
                    f.write(f',\n\t\t:Sala_{sala}')
                f.write(';\n')
            f.write(f'\t:Nom \"{row[1]}\" .\n')
            f.write('\n\n')
            line_count += 1
f.close()