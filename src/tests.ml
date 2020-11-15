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
    
    let l12 = [1;2;3;4] and p12 = [10] in
    let (fl12, fp12) = extraction_alea l12 p12 in
    assert (List.length fl12 = List.length l12 - 1) ;
    assert (List.length fp12 = List.length p12 + 1) ;
    
    let l13 = [1;2;3;4;5;6;7;8;9] and p13 = [10;20] in
    let (fl13, fp13) = extraction_alea l13 p13 in
    assert (List.length fl13 = List.length l13 - 1) ;
    assert (List.length fp13 = List.length p13 + 1) ;
    
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


let run_tests () =
  let liste_tests = [
        ("Q1.1) Extraction aléatoire dans une liste", test_extraction_alea)
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
