(* ----- Exercice 1 ----- *)

(* Q1.1 : Choisit aléatoirement un élément de l et le déplace en tête de p : O(n), n taille de l *)
let extraction_alea l p = 
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


(* Q1.2 : Génère une liste d'entiers de 1 à n aléatoirement placés dans une liste (shuffle de Fisher-Yates) : O(n^2) *)
let gen_permutation n =

  (* Fonction pour générer la liste d'entier de 1 à n de manière récursive : O(n) *)
  let rec gen_liste lst courrant n = 
    if courrant > n then
      List.rev lst
    else
      gen_liste (courrant :: lst) (courrant + 1) n
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
