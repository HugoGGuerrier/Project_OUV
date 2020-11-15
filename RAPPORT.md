# Rapport du projet d'ouverture | M1 STL | 2020-2021

## Exercice 1

### Q1.1
parler de pq pas match et plutot if (reutilisation de len)

### Q1.2

### Q1.3
La complexité de la fonction ```gen_permutation``` en nombre d'appels au générateur d'entiers aléatoires est en O(n), n étant l'entier passé en entré.
On peut justifier ce choix par le fait que le générateur est appelé une fois à chaque passage dans la fonction ```extraction_alea```, or la fonction ```melange``` utilise n fois cette fonction.

Ensuite nous pouvons dire que la complexité de la fonction ```gen_permutation``` en nombre d'appel au filtrage par motif est en O(n).
Cette réponse vient du fait que la fonction récursive ```melange``` est la seule à utiliser le ```matc ... with```, et elle est appelé une fois sur chaque élément de la liste triée de taille n.