
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
