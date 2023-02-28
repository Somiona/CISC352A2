(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (hero-no-key)

    ; Locationg <> Corridor Connections
    (cor-connected-to c1213 loc-1-2) (cor-connected-to c1213 loc-1-3)
    (cor-connected-to c1222 loc-1-2) (cor-connected-to c2122 loc-2-2)
    (cor-connected-to c1223 loc-1-2) (cor-connected-to c1223 loc-2-3)
    (cor-connected-to c1323 loc-1-3) (cor-connected-to c1323 loc-2-3)
    (cor-connected-to c1314 loc-1-3) (cor-connected-to c1314 loc-1-4)
    (cor-connected-to c1424 loc-1-4) (cor-connected-to c1424 loc-2-4)
    (cor-connected-to c2122 loc-2-1) (cor-connected-to c2122 loc-2-2)
    (cor-connected-to c2223 loc-2-2) (cor-connected-to c2223 loc-2-3)
    (cor-connected-to c2232 loc-2-2) (cor-connected-to c2232 loc-3-2)
    (cor-connected-to c2314 loc-2-3) (cor-connected-to c2314 loc-1-4)
    (cor-connected-to c2324 loc-2-3) (cor-connected-to c2324 loc-2-4)
    (cor-connected-to c2333 loc-2-3) (cor-connected-to c2333 loc-3-3)
    (cor-connected-to c2334 loc-2-3) (cor-connected-to c2334 loc-3-4)
    (cor-connected-to c2425 loc-2-4) (cor-connected-to c2425 loc-2-5)
    (cor-connected-to c2434 loc-2-4) (cor-connected-to c2434 loc-3-4)
    (cor-connected-to c2535 loc-2-5) (cor-connected-to c2535 loc-3-5)
    (cor-connected-to c3223 loc-3-2) (cor-connected-to c3223 loc-2-3)
    (cor-connected-to c3233 loc-3-2) (cor-connected-to c3233 loc-3-3)
    (cor-connected-to c3334 loc-3-3) (cor-connected-to c3334 loc-3-4)
    (cor-connected-to c3545 loc-3-5) (cor-connected-to c3545 loc-4-5)
    (cor-connected-to c4443 loc-4-4) (cor-connected-to c4443 loc-4-3)
    (cor-connected-to c4544 loc-4-5) (cor-connected-to c4544 loc-4-4)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-2-3)
    (key-at key3 loc-2-3)
    (key-at key4 loc-2-3)
    (key-at key5 loc-2-3)
    (key-at key6 loc-4-4)

    ; Locked corridors
    (cor-locked c1223)
    (cor-lock-colour c1223 red)
    (cor-locked c1323)
    (cor-lock-colour c1323 red)
    (cor-locked c2314)
    (cor-lock-colour c2314 red)
    (cor-locked c2223)
    (cor-lock-colour c2223 red)
    (cor-locked c2324)
    (cor-lock-colour c2324 red)
    (cor-locked c3223)
    (cor-lock-colour c3223 red)
    (cor-locked c2333)
    (cor-lock-colour c2333 red)
    (cor-locked c2334)
    (cor-lock-colour c2334 red)
    (cor-locked c2425)
    (cor-lock-colour c2425 purple)
    (cor-locked c2535)
    (cor-lock-colour c2535 green)
    (cor-locked c3545)
    (cor-lock-colour c3545 purple)
    (cor-locked c4544)
    (cor-lock-colour c4544 green)
    (cor-locked c4443)
    (cor-lock-colour c4443 rainbow)

    ; Risky corridors
    (cor-risky c1223)
    (cor-risky c1323)
    (cor-risky c2314)
    (cor-risky c2223)
    (cor-risky c2324)
    (cor-risky c3223)
    (cor-risky c2333)
    (cor-risky c2334)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 green)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 purple)
    (key-colour key6 rainbow)

    ; Key usage properties (one use, two use, etc)
    (key-usable key1)
    (key-usable key2)
    (key-use-one key2)
    (key-usable key3)
    (key-use-one key3)
    (key-usable key4)
    (key-use-one key4)
    (key-usable key5)
    (key-use-one key5)
    (key-usable key6)
    (key-use-one key6)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-3)
    )
  )

)
