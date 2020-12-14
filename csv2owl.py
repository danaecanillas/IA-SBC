import csv

IRI = "###  http://www.semanticweb.org/05087/ontologies/2020/10/ontologia_museu#"
tipusAuthor = "rdf:type owl:NamedIndividual ,\n\t\t:Author ;\n"
tipusArtwork = "rdf:type owl:NamedIndividual ,\n\t\t:Quadre ;\n"
tipusSala = "rdf:type owl:NamedIndividual ,\n\t\t:Sala ;\n"
tipusEstil = "rdf:type owl:NamedIndividual ,\n\t\t:Estil ;\n"

global artistes, estils
artistes = {}
estils = {}

def crea_estil(nomEstil, nomQuadre, nomPintor):
    global estils
    if nomEstil in estils.keys():
        estils[nomEstil]['quadres'] += [nomQuadre]
        if nomPintor not in estils[nomEstil]['pintors']:
            estils[nomEstil]['pintors'] += [nomPintor]
        return estils[nomEstil]['nom']
    else:
        new_est = 'Estil' + str(len(estils.keys()) + 1)
        estils[nomEstil] = {'nom': new_est, 'quadres':[nomQuadre], 'pintors':[nomPintor]}
        return new_est

#ArtistID,Title,Date,Medium,Width (cm),Height (cm),style,room,relevance
f = open('quadres.txt', 'w')
with open('artworks_2.csv', encoding='utf-8') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        elif line_count < 200 :
            print(line_count)
            nom = f'Art{line_count}'
            nomAutor = f'Autor{row[0]}'
            f.write(IRI+f'Art{line_count}')
            f.write(f'\n:Art{line_count} '+tipusArtwork)
            f.write(f'\t:ArtistID {row[0]} ;\n\t:Nom \"{row[1]}\" ;\n\t:Data {row[2]} ;\n\t:Amplada {row[4]} ;\n\t:Altura {row[5]} ;\n')
            f.write(f'\t:Estil \"{row[6]}\" ;\n\t:Rellevancia {row[8]} ;\n')
            f.write(f'\t:Estil_Quadre :{crea_estil(row[6], nom, nomAutor)} ;\n')
            f.write(f'\t:Esta_En :Sala_{row[7]} ;\n')
            f.write(f'\t:Es_De :Autor{row[0]} .\n\n')
            artistes[row[0]] = artistes.get(row[0], []) + [f'Art{line_count}']
            
            line_count += 1
        else:
            break
f.close()

print(len(artistes.keys()), artistes.keys())

#ID,Name,Nationality,BeginDate,EndDate,Gender
f = open('autors.txt', 'w')
with open('artists.csv', encoding='utf-8') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        # elif line_count < 10:
        elif row[0] in artistes.keys():
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
f.close()


f = open('sales.txt', 'w')
with open('sales.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        else:
            print(line_count)
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

f = open('estils.txt', 'w')
for key in estils.keys():
    nom = estils[key]['nom']
    quadres = estils[key]['quadres']
    autors = estils[key]['pintors']
    f.write(IRI+nom)
    f.write(f'\n:{nom} '+tipusEstil)
    
    if(len(quadres) > 0):
        f.write('\t:Quadres_Estil\n')
        f.write(f'\t\t:{quadres[0]}')
        for quadre in quadres[1:]:
            f.write(f',\n\t\t:{quadre}')
        f.write(';\n')
    
    if(len(autors) > 0):
        f.write('\t:Pintors_Estil\n')
        f.write(f'\t\t:{autors[0]}')
        for autor in autors[1:]:
            f.write(f',\n\t\t:{autor}')
        f.write(';\n')

    f.write(f'\t:Nom \"{key}\" .\n')
    f.write('\n\n')
f.close()