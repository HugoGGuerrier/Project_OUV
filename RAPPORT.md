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


### Q1.6
complexité de gen_permutation2

## Exercice 2

### Q2.11
complexité pire cas (tout à droite de l'arbre et considérer la hauteur de l'arbre)

Nous sommes beaucoup revenus sur la fonction `recherche_valeur_comp`.
Premièrement car tous les tests avec a1_comp ne passaient pas, puis nous avons augmenté nos jeux de tests pour s'assurer que tout fonctionne bien avec des arbres plus complexes comme a2_comp. Cela a levé de nouvelles erreurs qui nous ont permis de corriger complètement notre fonction et d'être sûrs de son bon fonctionnement.
Nous utilisions également trop spécifiquement le match, en spécifiant les champs à chaque fois, ce qui était inutile et lourd, surtout syntaxiquement:
FROM
```
match cible with
    | Noeud_comp {taille_c = _ ; label_c = _ ; gauche_c = gc ; droite_c = _} ->
        parcours_labels gc labels (i + 1)
    | _ -> false
```
TO
```
match cible with
    | Noeud_comp noeud_cible ->
        parcours_labels noeud_cible.gauche_c labels (i + 1)
    | _ -> false
```



### Q2.12 (facultative)



## Exercice 3

### Q3.13
TODO

### Q2.14/15
TODO graphes etc




## Explications supplémentaires

Nous avons créé des jeux de tests plutôt fournis qui nous ont été très utiles.
a1 reprend l'ABR plutôt simple du sujet, avec 2 structures réutilisables et des pointeurs courts (hauteurs de 1 ou 2).
a2 est un ABR plus complexe, avec 3 structures réutilisables et des pointeurs longs (hauteurs de 1, 2 ou 3) et qui permettent d'explorer chacun des cas de la fonction `recherche_valeur_comp`.
