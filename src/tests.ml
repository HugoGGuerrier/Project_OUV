open Abr


let test_extraction_alea () = 
    let l = [1;2;3]
    and p = []
    and (lf, pf) = extraction_alea [1;2;3] [] in
    assert (List.length lf = List.length l - 1) ;
    assert (List.length pf = List.length p + 1) ;
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
