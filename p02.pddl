(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (hero-no-key)

    ; Locationg <> Corridor Connections
    (cor-connected-to c1222 loc-1-2) (cor-connected-to c1222 loc-2-2)
    (cor-connected-to c2122 loc-2-1) (cor-connected-to c2122 loc-2-2)
    (cor-connected-to c2223 loc-2-2) (cor-connected-to c2223 loc-2-3)
    (cor-connected-to c2232 loc-2-2) (cor-connected-to c2232 loc-3-2)
    (cor-connected-to c3242 loc-3-2) (cor-connected-to c3242 loc-4-2)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-1-2)
    (key-at key3 loc-2-2)
    (key-at key4 loc-2-3)

    ; Locked corridors
    (cor-locked c1222)
    (cor-lock-colour c1222 yellow)
    (cor-locked c2122)
    (cor-lock-colour c2122 purple)
    (cor-locked c2223)
    (cor-lock-colour c2223 green)
    (cor-locked c2232)
    (cor-lock-colour c2232 yellow)
    (cor-locked c3242)
    (cor-lock-colour c3242 rainbow)

    ; Risky corridors

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 rainbow)
    (key-colour key3 purple)
    (key-colour key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (key-usable key1)
    (key-use-one key1)
    (key-usable key2)
    (key-use-one key2)
    (key-usable key3)
    (key-use-one key3)
    (key-usable key4)
    (key-use-two key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)
