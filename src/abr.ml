(* -------------------------- *)
(* -------- Partie 1 -------- *)
(* -------------------------- *)


(* ===== Q1.1 : Choisit aléatoirement un élément de l et le déplace en tête de p : O(n), n taille de l ===== *)

let extraction_alea (l: 'a list) (p: 'a list) : 'a list * 'a list = 
  let len = List.length l in
  if len = 0 then (l, p)
  else (
    let rand = Random.int len in
    let arr = Array.of_list l in
    let arr1 = Array.sub arr 0 rand in
    let arr2 = Array.sub arr (rand + 1) (len - rand - 1) in
    let l_res = Array.to_list (Array.append arr1 arr2) in
    (l_res, (List.nth l rand)::p)
  )


(* ===== Q1.2 : Génère une liste d'entiers de 1 à n aléatoirement placés dans une liste (shuffle de Fisher-Yates) : O(n^2) ===== *)

let gen_permutation (n: int) : int list =

  (* Fonction interne pour générer la liste d'entier de 1 à n de manière récursive : O(n) *)
  let rec gen_liste (lst: int list) (courant: int) (n: int) : int list = 
    if courant > n then
      List.rev lst
    else
      gen_liste (courant :: lst) (courant + 1) n
  in

  (* Fonction interne pour insérer les éléments de src dans dst dans un ordre aléatoire : O(n^2), n taille de src *)
  let rec melange (src: 'a list) (dst: 'a list) : 'a list = 
    match src with
    | [] -> dst
    | _ ->
      let (srcp, dstp) = extraction_alea src dst in
      melange srcp dstp
  in

  (* On appel la création d'un liste de 1 à n puis on la mélange *)
  if n < 1 then
    []
  else
    let liste_base = gen_liste [] 1 n in
    melange liste_base []


(* ===== Q1.4 : Génère une liste intercalant les éléments de l1 et l2 de façon aléatoire ===== *)

let intercale (l1: 'a list) (l2: 'a list) : 'a list =
  let rec intercale_rec l1 l2 n1 n2 =
    match (l1, l2) with
    | ([], _) -> l2
    | (_, []) -> l1
    | (h1 :: t1, h2 :: t2) -> 
      let rand = Random.int (n1 + n2) in
      if (rand < n1) then
        h1::(intercale_rec t1 l2 (n1 - 1) n2)
      else
        h2::(intercale_rec l1 t2 n1 (n2 - 1))
  in
  intercale_rec l1 l2 (List.length l1) (List.length l2)


(* ===== Q1.5 : Génère une liste des entiers de l'intervalle [p;q] permutés aléatoirement. p et q entiers naturels ===== *)

let rec gen_permutation2 (p: int) (q: int) : int list =
  if p < 0 || q < 0 then []
  else if p > q then []
  else if p = q then [p]
  else
    let moitie = (p + q) / 2 in
    intercale (gen_permutation2 p moitie) (gen_permutation2 (moitie + 1) q)


(* ===== Q1.7 : Création d'un ABR à partier d'une liste d'entiers ===== *)

(* Définition du type pour construire un ABR *)
type abr = 
  | Feuille
  | Noeud of contenu

and contenu = {
  label : int ;
  gauche : abr ;
  droite : abr ;
}


(* Fonction pour insérer un noeud dans un arbre binaire de recherche *)
let inserer_abr (noeud: abr) (arbre: abr) : abr = 
    (* On défini une fonction interne récusive pour éviter d'appeler le premier match plusieurs fois *)
    let rec insertion_rec (noeud: contenu) (arbre: abr) : abr = 
      match arbre with
      | Feuille -> Noeud {label = noeud.label ; gauche = noeud.gauche ; droite = noeud.droite}
      | Noeud proch ->
        if noeud.label > proch.label then
          Noeud {label = proch.label ; gauche = proch.gauche ; droite = (insertion_rec noeud proch.droite)}
        else
          Noeud {label = proch.label ; gauche = (insertion_rec noeud proch.gauche) ; droite = proch.droite}
    in

    (* On vérifie que le noeud à insérer est bien un noeud et non une feuille *)
    match noeud with
    | Feuille -> arbre
    | Noeud a_inserer ->
      (* On appel la fonction d'insertion du noeud dans l'arbre *)
      insertion_rec a_inserer arbre


(* Fonction de construction d'un ABR à partir d'une liste d'entiers *)
let creer_abr (lst: int list) : abr = 
  (* Définition d'une fonction interne pour parcourir la liste et créer l'abr *)
  let rec parcourir_liste (lst: int list) (arbre: abr) : abr =
    match lst with
    | [] -> arbre
    | h :: t -> 
      let nouv_noeud = Noeud {label = h ; gauche = Feuille ; droite = Feuille} in
      parcourir_liste t (inserer_abr nouv_noeud arbre)
  in

  (* On appelle la fonction de parcours sur la liste et un arbre vide *)
  parcourir_liste lst Feuille


(* Fonction pour rechercher dans un ABR *)
let rec recherche_valeur (arbre: abr) (valeur: int) : bool = 
  match arbre with
  | Feuille -> false
  | Noeud noeud ->
    if noeud.label = valeur then
      true
    else if noeud.label > valeur then
      recherche_valeur noeud.gauche valeur
    else
      recherche_valeur noeud.droite valeur


(* -------------------------- *)
(* -------- Partie 2 -------- *)
(* -------------------------- *)


(* ===== Q2.8 : Construction de la chaine de caractères liée à la structure de l'arbre (fonction "phi") ===== *)

let rec str_struct_abr (arbre: abr) : string =
  match arbre with
  | Feuille -> ""
  | Noeud n ->
    "(" ^ (str_struct_abr n.gauche) ^ ")" ^ (str_struct_abr n.droite)


(* ===== Q2.9 : Construction d'un tableau des étiquettes de l'arbre rangées en ordre préfixe ===== *)

let prefixe (arbre: abr) : int array =
  let rec prefixe_rec (arbre: abr) : int list =
    match arbre with 
    | Feuille -> []
    | Noeud n ->
      n.label::(prefixe_rec n.gauche) @ (prefixe_rec n.droite)
  in
  Array.of_list (prefixe_rec arbre)


(* ===== Q2.10 : Compression d'un ABR en utilisant la méthode des pointeurs ===== *)

(* Définition du type pour construire un ABR compressé *)

type abr_comp = 
  | Feuille_comp
  | Noeud_comp of contenu_comp
  | Pointeur_comp of pointeur_comp

and contenu_comp = {
  taille_c : int ;
  label_c : int ;
  gauche_c : abr_comp ;
  droite_c : abr_comp ;
}

and pointeur_comp = {
  cible_c : abr_comp ;
  labels_c : int array ;
}

(* Fonction pour rechercher une structure donnée dans un ABR *)

let rec chercher_structure (arbre: abr) (structure: string) : abr =
  match arbre with
  | Feuille -> arbre
  | Noeud n ->
    let struct_arbre = str_struct_abr arbre in
    if struct_arbre = structure then
      arbre
    else
      match chercher_structure n.gauche structure with
      | Feuille -> chercher_structure n.droite structure
      | result_gauche -> result_gauche

(* Fonction pour rechercher un noeud par label dans un ABR compressé (sans prendre en compte les pointeurs) *)

let rec chercher_label_comp (arbre: abr_comp) (lab: int) : abr_comp =
  match arbre with
  | Feuille_comp -> arbre
  | Pointeur_comp _ -> Feuille_comp
  | Noeud_comp n ->
    if n.label_c = lab then
      arbre
    else if lab > n.label_c then 
      chercher_label_comp n.droite_c lab 
    else 
      chercher_label_comp n.gauche_c lab

(* Fonction pour insérer un noeud dans un arbre compressé *)

let rec inserer_abr_comp (noeud: abr_comp) (arbre: abr_comp) : abr_comp =
  match noeud with
  | Feuille_comp -> arbre

  | Noeud_comp n -> (
      match arbre with
      | Feuille_comp -> noeud
      | Pointeur_comp _ -> arbre
      | Noeud_comp n_a -> 
        if n.label_c > n_a.label_c then
          Noeud_comp {taille_c = (n_a.taille_c + 1) ; label_c = n_a.label_c ; gauche_c = n_a.gauche_c ; droite_c = (inserer_abr_comp noeud n_a.droite_c)}
        else
          Noeud_comp {taille_c = (n_a.taille_c + 1) ; label_c = n_a.label_c ; gauche_c = (inserer_abr_comp noeud n_a.gauche_c) ; droite_c = n_a.droite_c}
    )

  | Pointeur_comp p -> (
      match arbre with
      | Feuille_comp -> noeud
      | Pointeur_comp _ -> arbre
      | Noeud_comp n_a -> 
        if p.labels_c.(0) > n_a.label_c then
          Noeud_comp {taille_c = (n_a.taille_c + (Array.length p.labels_c)) ; label_c = n_a.label_c ; gauche_c = n_a.gauche_c ; droite_c = (inserer_abr_comp noeud n_a.droite_c)}
        else
          Noeud_comp {taille_c = (n_a.taille_c + (Array.length p.labels_c)) ; label_c = n_a.label_c ; gauche_c = (inserer_abr_comp noeud n_a.gauche_c) ; droite_c = n_a.droite_c}
    )

(* Fonction pour compresser un ABR :-) *)

let compresser_abr (src: abr) : abr_comp = 
  let rec parcourir_arbre (noeud: abr) (compresse: abr_comp) : abr_comp = 
    match noeud with
    | Feuille -> compresse
    | Noeud n ->
      let n_str = str_struct_abr noeud in
      match chercher_structure src n_str with
      | Noeud found ->
        if found.label = n.label then 
          let new_comp = inserer_abr_comp (Noeud_comp {taille_c = 1 ; label_c = n.label ; gauche_c = Feuille_comp ; droite_c = Feuille_comp}) compresse in
          parcourir_arbre n.droite (parcourir_arbre n.gauche new_comp)
        else
          inserer_abr_comp (Pointeur_comp {cible_c = (chercher_label_comp compresse found.label) ; labels_c = (prefixe noeud)}) compresse
      | Feuille -> Feuille_comp
  in

  parcourir_arbre src Feuille_comp


(* ===== Q2.11 : Cherche si la valeur est présente dans l'arbre compressé et renvoie par conséquent true ou false ===== *)

let rec recherche_valeur_comp (arbre: abr_comp) (valeur: int) : bool =
  match arbre with 
  | Feuille_comp -> false
  | Noeud_comp {taille_c = _ ; label_c ; gauche_c ; droite_c} ->

    if label_c = valeur then true
    else if valeur > label_c then
      recherche_valeur_comp droite_c valeur
    else
      recherche_valeur_comp gauche_c valeur

  | Pointeur_comp {cible_c ; labels_c} ->

    (* Il faut parcourir intelligemment son tableau *)
    let rec parcours_labels (cible: abr_comp) (labels: int array) (i: int) : bool = (
      if i >= Array.length labels then false

      else if valeur = labels.(i) then true

      else if valeur < labels.(i) then (

        (* on veut aller à gauche *)
        match cible with
          | Noeud_comp noeud_cible ->
            parcours_labels noeud_cible.gauche_c labels (i + 1)
          | _ -> false

      ) else (

        (* On veut aller à droite : nécessite saut dans le tableau *)
        match cible with

          (* Cast de la cible (forcément un noeud) pour avoir accès ses fils *)
          | Noeud_comp noeud_cible -> (

            (* Calcul de la taille du fils gauche pour aller au fils droit dans le tableau *)
            match noeud_cible.gauche_c with
            | Noeud_comp gauche_cible ->
              parcours_labels noeud_cible.droite_c labels (i + 1 + gauche_cible.taille_c)
            | Pointeur_comp gauche_cible ->
              parcours_labels noeud_cible.droite_c labels (i + 1 + (Array.length gauche_cible.labels_c))
            | Feuille_comp -> 
              parcours_labels noeud_cible.droite_c labels (i + 1)

          )

          | _ -> false

      )
    ) in parcours_labels cible_c labels_c 0



(* -------------------------- *)
(* -------- Partie 3 -------- *)
(* -------------------------- *)

(* ===== Q3.13 : Trouver une fonction permettant de mesurer le temps d'exécution d'une autre fonction sur une donnée ===== *)

let chrono fonction arg1 arg2 : float =
  let start_time = Sys.time () in
  fonction arg1 arg2 ;
  Sys.time () -. start_time

(* Fonction pour récupérer la taille de l'espace mémoire occupé par une structure *)
let sizeof (x: 'a) : int = Obj.reachable_words (Obj.repr x)

(* ----------------------------- *)
(* --- Fonctions utilitaires --- *)
(* ----------------------------- *)


(* Afficher un abr dans le terminal (utile pour le debug) *)
let rec afficher_abr (arbre: abr) : unit =
  match arbre with
  | Feuille -> print_string "x" ; ()
  | Noeud {label ; gauche ; droite} ->
    print_string "(" ;
    afficher_abr gauche ;
    print_string ("-" ^ (string_of_int label) ^ "-") ;
    afficher_abr droite ;
    print_string ")" ;
    ()