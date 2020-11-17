(* -------------------- *)
(* ----- Partie 1 ----- *)
(* -------------------- *)


(* --- Exercice 1.1 *)

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


(* --- Exercice 1.2 *)

(*** Q1.4 *)
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


(*** Q1.5 *)
let rec gen_permutation2 (p: int) (q: int) : int list =
  if p > q then []
  else if p = q then [p]
  else
    let moitie = (p + q) / 2 in
    intercale (gen_permutation2 p moitie) (gen_permutation2 (moitie + 1) q)


(* --- Exercice 1.3 *)

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
  let rec parcourir_liste lst arbre =
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


(*** Q2.8 : construction de la chaine de caractères liée à la structure de l'arbre (fonction "phi") *)
let rec str_struct_abr (arbre: abr) : string =
  match arbre with
  | Feuille -> ""
  | Noeud {label ; gauche ; droite} ->
    "(" ^ (str_struct_abr gauche) ^ ")" ^ (str_struct_abr droite)


(*** Q2.9 : construction d'un tableau des étiquettes de l'arbre rangées en ordre préfixe *)
let prefixe (arbre: abr) : int array =
  let rec prefixe_rec (arbre: abr) : int list =
    match arbre with 
    | Feuille -> []
    | Noeud {label ; gauche ; droite} ->
      label::(prefixe_rec gauche) @ (prefixe_rec droite)
  in
  Array.of_list (prefixe_rec arbre)


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