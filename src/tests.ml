open Abr

(* a1 : Arbre de la question 1.7 du sujet *)
    let a1_n1 = Noeud {label = 1 ; gauche = Feuille ; droite = Feuille} ;;
    let a1_n3 = Noeud {label = 3 ; gauche = Feuille ; droite = Feuille} ;;
  let a1_n2 = Noeud {label = 2 ; gauche = a1_n1 ; droite = a1_n3} ;;
      let a1_n5 = Noeud {label = 5 ; gauche = Feuille ; droite = Feuille} ;;
      let a1_n7 = Noeud {label = 7 ; gauche = Feuille ; droite = Feuille} ;;
    let a1_n6 = Noeud {label = 6 ; gauche = a1_n5 ; droite = a1_n7} ;;
    let a1_n9 = Noeud {label = 9 ; gauche = Feuille ; droite = Feuille} ;;
  let a1_n8 = Noeud {label = 8 ; gauche = a1_n6 ; droite = a1_n9} ;;
let a1_n4 = Noeud {label = 4 ; gauche = a1_n2 ; droite = a1_n8} ;;

let a1 = a1_n4 ;;

let a1_str = "((())())((())())()" ;;

let a1_prefixe = [|4;2;1;3;8;6;5;7;9|] ;;


let test_extraction_alea () = 
  (* listes l et p banales *)
  let l10 = [1;2;3] and p10 = [] in
  let (fl10, fp10) = extraction_alea l10 p10 in
  assert (List.length fl10 = List.length l10 - 1) ;
  assert (List.length fp10 = List.length p10 + 1) ;
  
  let l11 = [1;2;3;4;5] and p11 = [10;20;30] in
  let (fl11, fp11) = extraction_alea l11 p11 in
  assert (List.length fl11 = List.length l11 - 1) ;
  assert (List.length fp11 = List.length p11 + 1) ;
  assert (List.nth fp11 1 = 10) ;
  assert (List.nth fp11 2 = 20) ;
  assert (List.nth fp11 3 = 30) ;
  
  let l12 = [1;2;3;4] and p12 = [10] in
  let (fl12, fp12) = extraction_alea l12 p12 in
  assert (List.length fl12 = List.length l12 - 1) ;
  assert (List.length fp12 = List.length p12 + 1) ;
  assert (List.nth fp12 1 = 10) ;
  
  let l13 = [1;2;3;4;5;6;7;8;9] and p13 = [10;20] in
  let (fl13, fp13) = extraction_alea l13 p13 in
  assert (List.length fl13 = List.length l13 - 1) ;
  assert (List.length fp13 = List.length p13 + 1) ;
  assert (List.nth fp13 1 = 10) ;
  assert (List.nth fp13 2 = 20) ;
  
  (* liste l vide *)
  let l2 = [] and p2 = [1;2] in
  let (fl2, fp2) = extraction_alea l2 p2 in
  assert (List.length fl2 = 0) ;
  assert (List.length fp2 = List.length p2) ;
  
  (* listes vides *)
  let l3 = [] and p3 = [] in
  let (fl3, fp3) = extraction_alea l3 p3 in
  assert (List.length fl3 = 0) ;
  assert (List.length fp3 = 0) ;
  ()


let test_gen_permutation () =
  (* n quelconque *)
  assert ((List.fold_left ( + ) 0 (gen_permutation 5)) = (1 + 2 + 3 + 4 + 5));
  assert ((List.fold_left ( + ) 0 (gen_permutation 3)) = (1 + 2 + 3));
  assert ((List.fold_left ( + ) 0 (gen_permutation 10)) = (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10));
  assert ((List.fold_left ( + ) 0 (gen_permutation 1)) = (1));

  (* n nul *)
  assert ((List.length (gen_permutation 0)) = 0);
  ()


let test_intercale () =
  let l0 = []
  and l1 = [0]
  and l2 = [1;2;3;4]
  and l3 = [5;6;7;8;9]
  and l4 = [10;11;12;13;14;15;16;17]
  and l5 = ["marmotte";"hiberne";"joufflue"]
  and l6 = ["la";"petite"]
  in
  let t1 = List.length l1
  and t2 = List.length l2
  and t3 = List.length l3
  and t4 = List.length l4
  and t5 = List.length l5
  and t6 = List.length l6
  in
  assert (intercale l0 l0 = []) ;
  assert (intercale l0 l1 = [0]) ;
  assert (intercale l1 l0 = [0]) ;
  assert (List.length (intercale l0 l2) = t2) ;
  assert (List.length (intercale l0 l3) = t3) ;
  assert (List.length (intercale l0 l4) = t4) ;
  assert (List.length (intercale l1 l2) = t1 + t2) ;
  assert (List.length (intercale l1 l3) = t1 + t3 ) ;
  assert (List.length (intercale l1 l4) = t1 + t4 ) ;
  assert (List.length (intercale l2 l2) = t2 + t2 ) ;
  assert (List.length (intercale l2 l3) = t2 + t3 ) ;
  assert (List.length (intercale l2 l4) = t2 + t4 ) ;
  assert (List.length (intercale l3 l4) = t3 + t4 ) ;
  assert (List.length (intercale l4 l3) = t4 + t3 ) ;
  assert (List.length (intercale l5 l6) = t5 + t6 ) ;
  assert (List.length (intercale l6 l5) = t6 + t5 ) ;
  ()


let test_str_struct_abr () =
  let str = str_struct_abr a1 in
  print_newline () ;
  print_string str ;
  print_newline () ;
  assert (str = a1_str) ;
  assert (str_struct_abr Feuille = "") ;
  assert (str_struct_abr a1_n1 = "()" ) ;
  assert (str_struct_abr a1_n2 = "(())()" ) ;
  ()


let test_prefixe () =
  let pref = prefixe a1 in
  assert (pref = a1_prefixe) ;
  assert (prefixe Feuille = Array.make 0 0) ;
  assert (prefixe a1_n2 = [|2;1;3|]) ;
  assert (prefixe a1_n1 = [|1|]) ;
  assert (prefixe a1_n3 = [|3|]) ;
  assert (prefixe a1_n8 = [|8;6;5;7;9|]) ;
  assert (prefixe a1_n6 = [|6;5;7|]) ;
  assert (prefixe a1_n9 = [|9|]) ;
  ()

(** Lancement et formatage des tests *)

let run_tests () =
  let liste_tests = [
      ("Q1.1 - Extraction aléatoire dans une liste", test_extraction_alea) ;
      ("Q1.2 - Génération d'une liste avec l’algorithme de shuffle de Fisher-Yates", test_gen_permutation) ;
      ("Q1.4 - Assemblage de deux listes en les intercallant aléatoirement", test_intercale) ;
      ("Q2.8 - Génération d'une chaine de caractères correspondant à la structure de l'ABR", test_str_struct_abr) ;
      ("Q2.9 - Génération du tableau d'un arbre lu en ordre préfixe", test_prefixe)
    ]
  in
  List.iteri
    (fun i (nom_test, f_test) ->
      Format.printf "--- Test #%d - %s:\t" (i + 1) nom_test ;
      try
        f_test () ;
        Format.printf "\027[32mOK\n\027[39m"
      with exn ->
        Format.printf "\027[31mErreur - %s\n\027[39m" (Printexc.to_string exn))
    liste_tests
    

(* Main *)
let () =
 	run_tests ()
