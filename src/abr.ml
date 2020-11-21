(* -------------------- *)
(* ----- Partie 1 ----- *)
(* -------------------- *)


(*** Q1.1 : Choisit aléatoirement un élément de l et le déplace en tête de p : O(n), n taille de l *)

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


(*** Q1.2 : Génère une liste d'entiers de 1 à n aléatoirement placés dans une liste (shuffle de Fisher-Yates) : O(n^2) *)

let gen_permutation (n: int) : int list =

  (* Fonction pour générer la liste d'entier de 1 à n de manière récursive : O(n) *)
  let rec gen_liste lst courant n = 
    if courant > n then
      List.rev lst
    else
      gen_liste (courant :: lst) (courant + 1) n
  in

  (* Fonction pour insérer les éléments de src dans dst dans un ordre aléatoire : O(n^2), n taille de src *)
  let rec melange src dst = 
    match src with
    | [] -> dst
    | _ ->
      let (srcp, dstp) = extraction_alea src dst in
      melange srcp dstp
  in

  if n < 1 then
    []
  else
    let liste_base = gen_liste [] 1 n in
    melange liste_base []


(*** Q1.4 : TODO *)

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


(*** Q1.5 : TODO *)

let rec gen_permutation2 (p: int) (q: int) : int list =
  if p > q then []
  else if p = q then [p]
  else
    let moitie = (p + q) / 2 in
    intercale (gen_permutation2 p moitie) (gen_permutation2 (moitie + 1) q)


(*** Q1.7 : Création d'un ABR à partier d'une liste d'entiers *)

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
let rec inserer_abr (noeud: abr) (arbre: abr) : abr = 
    match noeud with
    | Feuille -> arbre
    | Noeud nv ->
      match arbre with
      | Feuille -> noeud
      | Noeud {label ; gauche ; droite} -> 
        if nv.label > label then
          Noeud {label = label ; gauche = gauche ; droite = (inserer_abr noeud droite)}
        else
          Noeud {label = label ; gauche = (inserer_abr noeud gauche) ; droite = droite}


(* Fonction de construction d'un ABR à partir d'une liste d'entiers *)
let creer_abr lst = 
  let rec parcourir_liste (lst: int list) (arbre: abr) : abr =
    match lst with
    | [] -> arbre
    | h :: t -> 
      let nouv_noeud = Noeud {label = h ; gauche = Feuille ; droite = Feuille} in
      parcourir_liste t (inserer_abr nouv_noeud arbre)
  in
  parcourir_liste lst Feuille



(* -------------------- *)
(* ----- Partie 2 ----- *)
(* -------------------- *)


(*** Q2.8 : Construction de la chaine de caractères liée à la structure de l'arbre (fonction "phi") *)

let rec str_struct_abr (arbre: abr) : string =
  match arbre with
  | Feuille -> ""
  | Noeud {label ; gauche ; droite} ->
    "(" ^ (str_struct_abr gauche) ^ ")" ^ (str_struct_abr droite)


(*** Q2.9 : Construction d'un tableau des étiquettes de l'arbre rangées en ordre préfixe *)

let prefixe (arbre: abr) : int array =
  let rec prefixe_rec (arbre: abr) : int list =
    match arbre with 
    | Feuille -> []
    | Noeud {label ; gauche ; droite} ->
      label::(prefixe_rec gauche) @ (prefixe_rec droite)
  in
  Array.of_list (prefixe_rec arbre)


(*** Q2.10 : Compression d'un ABR en utilisant la méthode des pointeurs *)

(*** Définition du type pour construire un ABR compressé *)

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

(*** Fonction pour rechercher une structure donnée dans un ABR *)

let rec chercher_structure (arbre: abr) (structure: string) : abr =
  match arbre with
  | Feuille -> arbre
  | Noeud {label ; gauche ; droite} ->
    let struct_arbre = str_struct_abr arbre in
    if struct_arbre = structure then
      arbre
    else
      match chercher_structure gauche structure with
      | Feuille -> chercher_structure droite structure
      | result_gauche -> result_gauche

(*** Fonction pour rechercher un noeud par label dans un ABR compressé (sans prendre en compte les pointeurs) *)

let rec chercher_label_comp (arbre: abr_comp) (lab: int) : abr_comp =
  match arbre with
  | Feuille_comp -> arbre
  | Pointeur_comp _ -> Feuille_comp
  | Noeud_comp {taille_c = _ ; label_c = lc ; gauche_c = gc ; droite_c = dc} ->
    if lc = lab then
      arbre
    else if lab > lc then 
      chercher_label_comp dc lab 
    else 
      chercher_label_comp gc lab

(*** Fonction pour insérer noaud dans un arbre compressé *)

let rec inserer_abr_comp (noeud: abr_comp) (arbre: abr_comp) : abr_comp =
  match noeud with
  | Feuille_comp -> arbre

  | Noeud_comp {taille_c = taille ; label_c = label ; gauche_c = gauche ; droite_c = droite} ->
    (
      match arbre with
      | Feuille_comp -> noeud
      | Pointeur_comp _ -> arbre
      | Noeud_comp {taille_c = taille_a ; label_c = label_a ; gauche_c = gauche_a ; droite_c = droite_a} -> 
        if label > label_a then
          Noeud_comp {taille_c = (taille_a + 1) ; label_c = label_a ; gauche_c = gauche_a ; droite_c = (inserer_abr_comp noeud droite_a)}
        else
          Noeud_comp {taille_c = (taille_a + 1) ; label_c = label_a ; gauche_c = (inserer_abr_comp noeud gauche_a) ; droite_c = droite_a}
    )

  | Pointeur_comp {cible_c = cible ; labels_c = labels} ->
    (
      match arbre with
      | Feuille_comp -> noeud
      | Pointeur_comp _ -> arbre
      | Noeud_comp {taille_c = taille_a ; label_c = label_a ; gauche_c = gauche_a ; droite_c = droite_a} -> 
        if labels.(0) > label_a then
          Noeud_comp {taille_c = (taille_a + 1) ; label_c = label_a ; gauche_c = gauche_a ; droite_c = (inserer_abr_comp noeud droite_a)}
        else
          Noeud_comp {taille_c = (taille_a + 1) ; label_c = label_a ; gauche_c = (inserer_abr_comp noeud gauche_a) ; droite_c = droite_a}
    )

(*** Fonction pour compresser un ABR :-) *)

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
          let new_comp = inserer_abr_comp (Pointeur_comp {cible_c = (chercher_label_comp compresse found.label) ; labels_c = (prefixe noeud)}) compresse in
          parcourir_arbre n.droite (parcourir_arbre n.gauche new_comp)
      | Feuille _ -> Feuille_comp
  in

  parcourir_arbre src Feuille_comp


let rec recherche_valeur_comp (arbre: abr_comp) (valeur: int) : bool =
  match arbre with 
  | Feuille_comp -> false
  | Noeud_comp {taille_c ; label_c ; gauche_c ; droite_c} ->
    if label_c = valeur then true
    else if valeur > label_c then
      recherche_valeur_comp droite_c valeur
    else
      recherche_valeur_comp gauche_c valeur

  | Pointeur_comp {cible_c ; labels_c} ->
    let rec parcours_labels (labels: int array) (i: int) : bool = (
      if i >= Array.length labels_c then false
      else if labels_c.(i) = valeur then true
      else if labels_c.(i) < valeur then
        parcours_labels labels (i + 1)
      else (
        match cible_c with
        | Noeud_comp {taille_c ; label_c ; gauche_c ; droite_c} ->
        (
          match gauche_c with 
          | Noeud_comp {taille_c ; label_c ; gauche_c ; droite_c} -> 
            parcours_labels labels_c (i + 1 + taille_c)          
          | _ -> false 
        )
        | _ -> false
      )
    ) in parcours_labels labels_c 0



(* ----------------------------- *)
(* --- Fonctions utilitaires --- *)
(* ----------------------------- *)


(* Afficher un abr dans le terminal (uniquement utile pour le debug) *)
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