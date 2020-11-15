# Rapport du projet d'ouverture | M1 STL | 2020-2021

## Exercice 1

### Q1.1 
**extraction_alea (l:'a list) (p:'a list) : 'a list * 'a list**
Ici nous nous sommes posé la question de si l'on utilisait un `match l with [] -> (l, p) | _ -> ...` ou un `let len = List.length l in if len = 0 ...` pour s'occuper du cas où l'argument l est vide.
Nous avons opté pour le if car nous avons besoin de la longueur de l à deux autres reprises dans la fonction.

### Q1.2 
**gen_permutation (n:int) : int list**

### Q1.3
La complexité de la fonction `gen_permutation` en nombre d'appels au générateur d'entiers aléatoires est en O(n), n étant l'entier passé en entrée.
On peut justifier ce choix par le fait que le générateur est appelé une fois à chaque passage dans la fonction `extraction_alea`, or la fonction `melange` utilise n fois cette fonction.

Ensuite nous pouvons dire que la complexité de la fonction `gen_permutation` en nombre d'appels au filtrage par motif est en O(n).
Cette réponse vient du fait que la fonction récursive `melange` est la seule à utiliser le `match ... with`, et elle est appelée une fois sur chaque élément de la liste triée de taille n.
