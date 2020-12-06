open Abr

(** Données *)

(* a1 : ABR de la question 1.7 du sujet *)

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

    let a1_n1_c = Noeud_comp {taille_c = 1 ; label_c = 1 ; gauche_c = Feuille_comp ; droite_c = Feuille_comp} ;;
    let a1_n3_c = Pointeur_comp {cible_c = a1_n1_c ; labels_c = [|3|]} ;;
  let a1_n2_c = Noeud_comp {taille_c = 3 ; label_c = 2 ; gauche_c = a1_n1_c ; droite_c = a1_n3_c} ;;
    let a1_n6_c = Pointeur_comp {cible_c = a1_n2_c ; labels_c = [|6;5;7|]} ;;
    let a1_n9_c = Pointeur_comp {cible_c = a1_n1_c ; labels_c = [|9|]} ;;
  let a1_n8_c = Noeud_comp {taille_c = 5 ; label_c = 8 ; gauche_c = a1_n6_c ; droite_c = a1_n9_c} ;;
let a1_n4_c = Noeud_comp {taille_c = 9 ; label_c = 4 ; gauche_c = a1_n2_c ; droite_c = a1_n8_c} ;;

let a1_comp = a1_n4_c ;;


(* a2 : ABR plus complet, visuels à retrouver dans le rapport *)

        let a2_n2 = Noeud {label = 2 ; gauche = Feuille ; droite = Feuille} ;;
      let a2_n1 = Noeud {label = 1 ; gauche = Feuille ; droite = a2_n2} ;;
        let a2_n4 = Noeud {label = 4 ; gauche = Feuille ; droite = Feuille} ;;
        let a2_n6 = Noeud {label = 6 ; gauche = Feuille ; droite = Feuille} ;;
      let a2_n5 = Noeud {label = 5 ; gauche = a2_n4 ; droite = a2_n6} ;;
    let a2_n3 = Noeud {label = 3 ; gauche = a2_n1 ; droite = a2_n5} ;;
      let a2_n8 = Noeud {label = 8 ; gauche = Feuille ; droite = Feuille} ;;
        let a2_n10 = Noeud {label = 10 ; gauche = Feuille ; droite = Feuille} ;;
        let a2_n12 = Noeud {label = 12 ; gauche = Feuille ; droite = Feuille} ;;
      let a2_n11 = Noeud {label = 11 ; gauche = a2_n10 ; droite = a2_n12} ;;
    let a2_n9 = Noeud {label = 9 ; gauche = a2_n8 ; droite = a2_n11} ;;
  let a2_n7 = Noeud {label = 7 ; gauche = a2_n3 ; droite = a2_n9} ;;
      let a2_n15 = Noeud {label = 15 ; gauche = Feuille ; droite = Feuille} ;;
    let a2_n14 = Noeud {label = 14 ; gauche = Feuille ; droite = a2_n15} ;;
      let a2_n17 = Noeud {label = 17 ; gauche = Feuille ; droite = Feuille} ;;
      let a2_n19 = Noeud {label = 19 ; gauche = Feuille ; droite = Feuille} ;;
    let a2_n18 = Noeud {label = 18 ; gauche = a2_n17 ; droite = a2_n19} ;;
  let a2_n16 = Noeud {label = 16 ; gauche = a2_n14 ; droite = a2_n18} ;;
let a2_n13 = Noeud {label = 13 ; gauche = a2_n7 ; droite = a2_n16} ;;

let a2 = a2_n13 ;;

let a2_str = "(((()())(())())(())(())())(()())(())()" ;;

let a2_prefixe = [|13;7;3;1;2;5;4;6;9;8;11;10;12;16;14;15;18;17;19|] ;;

        let a2_n2_c = Noeud_comp {taille_c = 1 ; label_c = 2 ; gauche_c = Feuille_comp ; droite_c = Feuille_comp} ;;
      let a2_n1_c = Noeud_comp {taille_c = 2 ; label_c = 1 ; gauche_c = Feuille_comp ; droite_c = a2_n2_c} ;;
        let a2_n4_c = Pointeur_comp {cible_c = a2_n2_c ; labels_c = [|4|]} ;;
        let a2_n6_c = Pointeur_comp {cible_c = a2_n2_c ; labels_c = [|6|]} ;;
      let a2_n5_c = Noeud_comp {taille_c = 3 ; label_c = 5 ; gauche_c = a2_n4_c ; droite_c = a2_n6_c} ;;
    let a2_n3_c = Noeud_comp {taille_c = 6 ; label_c = 3 ; gauche_c = a2_n1_c ; droite_c = a2_n5_c} ;;
      let a2_n8_c = Pointeur_comp {cible_c = a2_n2_c ; labels_c = [|8|]} ;;
      let a2_n11_c = Pointeur_comp {cible_c = a2_n5_c ; labels_c = [|11;10;12|]} ;;
    let a2_n9_c = Noeud_comp {taille_c = 5 ; label_c = 9 ; gauche_c = a2_n8_c ; droite_c = a2_n11_c} ;;
  let a2_n7_c = Noeud_comp {taille_c = 12 ; label_c = 7 ; gauche_c = a2_n3_c ; droite_c = a2_n9_c} ;;
  let a2_n16_c = Pointeur_comp {cible_c = a2_n3_c ; labels_c = [|16;14;15;18;17;19|]} ;;
let a2_n13_c = Noeud_comp {taille_c = 19 ; label_c = 13 ; gauche_c = a2_n7_c ; droite_c = a2_n16_c} ;;

let a2_comp = a2_n13_c ;;



(** Tests *)

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
  assert ((List.fold_left ( + ) 0 (gen_permutation 5)) = (1 + 2 + 3 + 4 + 5)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation 3)) = (1 + 2 + 3)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation 10)) = (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation 1)) = (1)) ;
  (* n <= 0 *)
  assert (gen_permutation 0 = []) ;
  assert (gen_permutation (-3) = []) ;
  ()

let test_gen_permutation2 () =
  (* (p = 1) < q *)
  assert ((List.fold_left ( + ) 0 (gen_permutation2 1 5)) = (1 + 2 + 3 + 4 + 5)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation2 1 3)) = (1 + 2 + 3)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation2 1 10)) = (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation2 1 1)) = 1) ;
  (* p < q *)
  assert ((List.fold_left ( + ) 0 (gen_permutation2 2 5)) = (2 + 3 + 4 + 5)) ;
  assert ((List.fold_left ( + ) 0 (gen_permutation2 6 10)) = (6 + 7 + 8 + 9 + 10)) ;
  assert (gen_permutation2 (-2) 10 = []) ;
  assert (gen_permutation2 (-2) (-1) = []) ;
  (* p = q *)
  assert (gen_permutation2 0 0 = [0]);
  assert (gen_permutation2 2 2 = [2]);
  assert (gen_permutation2 (-3) (-3) = []);
  (* p > q *)
  assert (gen_permutation2 5 1 = []) ;
  assert (gen_permutation2 1 0 = []) ;
  assert (gen_permutation2 1 (-6) = []) ;
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


let test_creer_abr () = 
  assert (creer_abr [] = Feuille) ;
  assert (creer_abr [1] = a1_n1) ;
  assert (creer_abr [2;3;1] = a1_n2) ;
  assert (creer_abr [2;1;3] = a1_n2) ;
  assert (creer_abr [4;2;3;8;1;9;6;5;7] = a1) ;
  assert (creer_abr [4;2;1;8;3;9;6;7;5] = a1) ;
  assert (creer_abr [7;3;9;1;5;8;11;2;4;6;10;12] = a2_n7) ;
  assert (creer_abr [13;7;16;3;9;14;18;1;5;8;11;15;17;19;2;4;6;10;12] = a2) ;
  assert (creer_abr [13;7;16;3;9;14;18;5;1;8;11;15;17;19;2;4;6;12;10] = a2) ;
  ()


let test_str_struct_abr () =
  assert (str_struct_abr Feuille = "") ;
  assert (str_struct_abr a1_n1 = "()" ) ;
  assert (str_struct_abr a1_n2 = "(())()" ) ;
  assert (str_struct_abr a1 = a1_str) ;
  assert (str_struct_abr a2 = a2_str) ;
  ()


let test_prefixe () =
  assert (prefixe a1 = a1_prefixe) ;
  assert (prefixe a2 = a2_prefixe) ;
  assert (prefixe Feuille = [||]) ;
  assert (prefixe a1_n2 = [|2;1;3|]) ;
  assert (prefixe a1_n1 = [|1|]) ;
  assert (prefixe a1_n3 = [|3|]) ;
  assert (prefixe a1_n8 = [|8;6;5;7;9|]) ;
  assert (prefixe a1_n6 = [|6;5;7|]) ;
  assert (prefixe a1_n9 = [|9|]) ;
  ()

let test_chercher_structure () = 
  assert (chercher_structure a1 a1_str = a1) ;
  assert (chercher_structure a2 a2_str = a2) ;
  assert (chercher_structure a1 (str_struct_abr a1_n6) = a1_n2) ;
  assert (chercher_structure a1 (str_struct_abr a1_n9) = a1_n1) ;
  assert (chercher_structure a2 (str_struct_abr a2_n16) = a2_n3) ;
  assert (chercher_structure a2 (str_struct_abr a2_n11) = a2_n5) ;
  assert (chercher_structure a2 (str_struct_abr a2_n8) = a2_n2) ;
  assert (chercher_structure a1 "(()(((" = Feuille) ;
  assert (chercher_structure Feuille "(()(" = Feuille) ;
  assert (chercher_structure Feuille "" = Feuille) ;
  assert (chercher_structure Feuille "()" = Feuille) ;
  ()


let test_compresser_abr () = 
  assert (compresser_abr a1_n1 = a1_n1_c) ;
  assert (compresser_abr a1_n2 = a1_n2_c) ;
  assert (compresser_abr a1 = a1_comp) ;
  assert (compresser_abr a2 = a2_comp) ;
  ()


let test_recherche_valeur_comp () =
  (* a1_comp *)
  assert (recherche_valeur_comp a1_comp 1 = true) ;
  assert (recherche_valeur_comp a1_comp 2 = true) ;
  assert (recherche_valeur_comp a1_comp 3 = true) ;
  assert (recherche_valeur_comp a1_comp 4 = true) ;
  assert (recherche_valeur_comp a1_comp 5 = true) ;
  assert (recherche_valeur_comp a1_comp 6 = true) ;
  assert (recherche_valeur_comp a1_comp 7 = true) ;
  assert (recherche_valeur_comp a1_comp 8 = true) ;
  assert (recherche_valeur_comp a1_comp 9 = true) ;
  assert (recherche_valeur_comp a1_comp 0 = false) ;
  assert (recherche_valeur_comp a1_comp 10 = false) ;
  assert (recherche_valeur_comp a1_comp 11 = false) ;
  (* a2_comp *)
  assert (recherche_valeur_comp a2_comp 1 = true) ;
  assert (recherche_valeur_comp a2_comp 2 = true) ;
  assert (recherche_valeur_comp a2_comp 3 = true) ;
  assert (recherche_valeur_comp a2_comp 4 = true) ;
  assert (recherche_valeur_comp a2_comp 5 = true) ;
  assert (recherche_valeur_comp a2_comp 6 = true) ;
  assert (recherche_valeur_comp a2_comp 7 = true) ;
  assert (recherche_valeur_comp a2_comp 8 = true) ;
  assert (recherche_valeur_comp a2_comp 9 = true) ;
  assert (recherche_valeur_comp a2_comp 10 = true) ;
  assert (recherche_valeur_comp a2_comp 11 = true) ;
  assert (recherche_valeur_comp a2_comp 12 = true) ;
  assert (recherche_valeur_comp a2_comp 13 = true) ;
  assert (recherche_valeur_comp a2_comp 14 = true) ;
  assert (recherche_valeur_comp a2_comp 15 = true) ;
  assert (recherche_valeur_comp a2_comp 16 = true) ;
  assert (recherche_valeur_comp a2_comp 17 = true) ;
  assert (recherche_valeur_comp a2_comp 18 = true) ;
  assert (recherche_valeur_comp a2_comp 19 = true) ;
  assert (recherche_valeur_comp a2_comp 0 = false) ;
  assert (recherche_valeur_comp a2_comp 20 = false) ;
  assert (recherche_valeur_comp a2_comp 21 = false) ;
  ()


let size_list = [10; 50; 100; 200; 500; 1000; 2500; 5000; 7500; 10000] ;;
let nb_recherche = 20000

(** Fonction pour étudier le temps des fonctions de recherche *)
let etude_recherche () =
  let rec recherche_normal_rec (arbre: abr) (taille: int) (cpt: int) : unit =
    if cpt <= 0 then ()
    else (
      let valeur = (Random.int taille) + 1 in
      let _ = recherche_valeur arbre valeur in
      recherche_normal_rec arbre taille (cpt - 1)
    )
  in

  let rec recherche_comp_rec (arbre: abr_comp) (taille: int) (cpt: int) : unit =
    if cpt <= 0 then ()
    else (
      let valeur = (Random.int taille) + 1 in
      let _ = recherche_valeur_comp arbre valeur in
      recherche_comp_rec arbre taille (cpt - 1)
    )
  in

  print_newline () ;
  Format.printf "\027[1m Nb Noeuds\027[0m\t|\027[1m Tmps. comp.\027[0m\t|\027[1m %d Rech.\027[0m\t|\027[1m %d Rech. comp.\027[0m\t|\027[1m Taille\027[0m\t|\027[1m Taille comp.\027[0m\n" nb_recherche nb_recherche ;
  List.iter (
    fun size ->
      Format.printf " %d\t\t|" size ;
      let arbre = creer_abr (gen_permutation size) in

      let start_c = Sys.time () in
      let arbre_comp = compresser_abr arbre in
      let comp_time = Sys.time () -. start_c in

      let start_standard = Sys.time () in
      recherche_normal_rec arbre size nb_recherche ;
      let temps = Sys.time () -. start_standard in

      let start_comp = Sys.time () in
      recherche_comp_rec arbre_comp size nb_recherche ;
      let temps_comp = Sys.time () -. start_comp in
      
      Format.printf " %fs\t| %fs\t| %fs\t\t| %d\t\t| %d\n" comp_time temps temps_comp (sizeof arbre) (sizeof arbre_comp) ;
  ) size_list ;
  ()


(** Lancement et formatage des tests *)

let run_tests () =
  let liste_tests = [
      ("Q1.1 - Extraction aléatoire dans une liste", test_extraction_alea) ;
      ("Q1.2 - Génération d'une liste d'entiers aléatoires avec le shuffle de Fisher-Yates (méthode 1)", test_gen_permutation) ;
      ("Q1.4 - Assemblage de deux listes en les intercallant aléatoirement", test_intercale) ;
      ("Q1.5 - Génération d'une liste d'entiers aléatoires (méthode 2)", test_gen_permutation2) ;
      ("Q1.7 - Génération d'un ABR à partir d'une liste d'entiers", test_creer_abr) ;
      ("Q2.8 - Génération d'une chaine de caractères correspondant à la structure de l'ABR", test_str_struct_abr) ;
      ("Q2.9 - Génération du tableau de l'ABR lu en ordre préfixe", test_prefixe) ;
      ("Q2.10 - Recherche d'une structure dans un ABR", test_chercher_structure) ;
      ("Q2.10 - Compression d'un ABR", test_compresser_abr) ;
      ("Q2.11 - Présence d'une valeur dans un ABR compressé", test_recherche_valeur_comp) ;
      ("Q3.14 - Etude de la complexité en temps des fonctions de recherche dans un ABR et de leur taille", etude_recherche) ;
    ]
  in
  List.iteri
    (fun i (nom_test, f_test) ->
      Format.printf "--- Test #%d - %s : " (i + 1) nom_test ;
      try
        f_test () ;
        Format.printf "\027[32mOK\n\027[39m"
      with exn ->
        Format.printf "\027[31mErreur - %s\n\027[39m" (Printexc.to_string exn)
    ) liste_tests
    

(* Main *)
let () =
 	run_tests ()
