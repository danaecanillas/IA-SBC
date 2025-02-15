# IA-SBC

[![HitCount](http://hits.dwyl.io/danaecanillas/IA-SBC.svg)](http://hits.dwyl.io/danaecanillas/IA-SBC)  [![GitHub stars](https://img.shields.io/github/stars/danaecanillas/IA-SBC.svg)](https://GitHub.com/danaecanillas/IA-SBC/stargazers/)  [![GitHub forks](https://img.shields.io/github/forks/danaecanillas/IA-SBC.svg)](https://GitHub.com/ArnauSoler/IA/network/)  [![GitHub repo size in bytes](https://img.shields.io/github/repo-size/danaecanillas/IA-SBC.svg)](https://github.com/danaecanillas/IA-SBC)  [![GitHub contributors](https://img.shields.io/github/contributors/danaecanillas/IA-SBC.svg)](https://GitHub.com/danaecanillas/IA-SBC/graphs/contributors/)  

## Art museum visiting tours customization using knowledge-based systems.

**Authors**: Dànae Canillas, Miquel Escobar, Arnau Soler

*2020-2021 Q1 - Universitat Politècnica de Catalunya, UPC*

## Table of Contents

1. [Problem Description](#Problem-Description)
2. [Usage](#Usage)
   1. [Project files](#Project-files)
   2. [Execution steps](#Execution-steps)
3. [LICENSE](#LICENSE)

## Problem Description
In this project, we are asked to implement a recommendation system for the visitors of an artmuseum. The reason for this is that the amount of artworks to see in this museum is humongous,and thus the visitors must prioritize and decide which artworks will they want to see, and howmuch time will they want to spend on each of them. Obviously, each visitor or visiting group will have their own characteristics (demographics, nationality, age, group size, art knowledge,etc.) and consequently they will have a preferred route and artworks.

## Usage

### Project files
```
├─ experiments
│  ├─ Experiment_1.txt
│  ├─ Experiment_2.txt
│  ├─ Experiment_3.txt
│  ├─ Experiment_4.txt
│  ├─ Experiment_5.txt
│  ├─ Experiment_6.txt
│  └─ Experiment_6_Extra.txt
├─ data
│  ├─ artists.csv
│  ├─ artworks.csv
│  └─ sales.csv
├─ python
│  ├─ csv2owl.py
│  └─ generate-data.py
├─ ontology
│  ├─ ontology.clp
│  └─ ontology.owl
├─ SBC-20211q.pdf
├─ Report.pdf
├─ museum.clp
├─ LICENSE
└─ README.md
```
### Execution
```
CLIPS> (load "museum.clp")
CLIPS> (reset)
CLIPS> (run)
 _________________________ 
                           
   -   -   -   -   -   -   
 ( M | U | S | E | U | M ) 
   -   -   -   -   -   -   
 _________________________ 

Benvingut al nostre sistema de recomanacio de visites! 
Si us plau, contesti les preguntes que venen a continuacio per tal d'oferir-vos un tour pel nostre museu.
```
* <code>Input</code>: Answer the questions to personalize the museum tour

* <code>Output</code>: Tour suggestion.

## LICENCE
MIT © Dànae/Miquel/Arnau
