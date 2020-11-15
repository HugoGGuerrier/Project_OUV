
let extraction_alea l p = 
    match l with 
    | [] -> (l, p)
    | _ ->
        let rand = Random.int (List.length l) in
        let arr = Array.of_list l in
        let arr1 = Array.sub arr 0 rand in
        let arr2 = Array.sub arr (rand + 1) (List.length l - rand - 1) in
        let l_res = Array.to_list (Array.append arr1 arr2) in
        (l_res, (List.nth l rand)::p)

