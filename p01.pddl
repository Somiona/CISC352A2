(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    (hero-no-key)

    ; Locationg <> Corridor Connections
    (cor-connected-to c3132 loc-3-1) (cor-connected-to c3132 loc-3-2)
    (cor-connected-to c1222 loc-1-2) (cor-connected-to c1222 loc-2-2)
    (cor-connected-to c2232 loc-2-2) (cor-connected-to c2232 loc-3-2)
    (cor-connected-to c3242 loc-3-2) (cor-connected-to c3242 loc-4-2)
    (cor-connected-to c2223 loc-2-2) (cor-connected-to c2223 loc-2-3)
    (cor-connected-to c3233 loc-3-2) (cor-connected-to c3233 loc-3-3)
    (cor-connected-to c2333 loc-2-3) (cor-connected-to c2333 loc-3-3)
    (cor-connected-to c2324 loc-2-3) (cor-connected-to c2324 loc-2-4)
    (cor-connected-to c3334 loc-3-3) (cor-connected-to c3334 loc-3-4)
    (cor-connected-to c2434 loc-2-4) (cor-connected-to c2434 loc-3-4)
    (cor-connected-to c3444 loc-3-4) (cor-connected-to c3444 loc-4-4)

    ; Key locations
    (key-at key1 loc-2-2)
    (key-at key2 loc-2-4)
    (key-at key3 loc-4-2)
    (key-at key4 loc-4-4)

    ; Locked corridors
    (cor-locked c2324)
    (cor-lock-colour c2324 red)
    (cor-locked c2434)
    (cor-lock-colour c2434 red)
    (cor-locked c3132)
    (cor-lock-colour c3132 rainbow)
    (cor-locked c3242)
    (cor-lock-colour c3242 purple)
    (cor-locked c3444)
    (cor-lock-colour c3444 yellow)

    ; Risky corridors
    (cor-risky c2324)
    (cor-risky c2434)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 rainbow)
    (key-colour key4 purple)

    ; Key usage properties (one use, two use, etc)
    (key-usable key1)
    (key-usable key2)
    (key-use-two key2)
    (key-usable key3)
    (key-use-one key3)
    (key-usable key4)
    (key-use-one key4)
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
