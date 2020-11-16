open Abr


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


(** Lancement et formatage des tests *)

let run_tests () =
  let liste_tests = [
      ("Q1.1 - Extraction aléatoire dans une liste", test_extraction_alea);
      ("Q1.2 - Génération d'une liste avec l’algorithme de shuffle de Fisher-Yates", test_gen_permutation);
      ("Q1.4 - Assemblage de deux listes en les intercallant aléatoirement", test_intercale)
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
