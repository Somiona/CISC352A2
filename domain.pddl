(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        ; Hero related
        (hero-at ?loc - location)
        (hero-get-key ?k - key)
        (hero-no-key)
        ; Key related
        (key-at ?k - key ?loc - location)
        (key-colour ?k - key ?col - colour)
        (key-usable ?k - key)
        (key-use-one ?k - key)
        (key-use-two ?k - key)
        ; Corridor related
        (cor-connected-to ?cor - corridor ?loc - location)
        (cor-collapsed ?cor - corridor)
        (cor-locked ?cor - corridor) ; is a corridor locked?
        (cor-lock-colour ?cor - corridor ?col - colour) ; if a corridor is locked, how is it locked?
        (cor-risky ?cor - corridor)
        ; Room related
        (room-messy ?loc - location)
        (room-goal ?loc - location)

        ; IMPLEMENT ME
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?from)
            (cor-connected-to ?cor ?from)
            (cor-connected-to ?cor ?to)
            (not (cor-collapsed ?cor))
            (not (cor-locked ?cor))
        )

        :effect (and

            ; IMPLEMENT ME
            (hero-at ?to)
            (not (hero-at ?from))
            (when (cor-risky ?cor) (and (cor-collapsed ?cor)(room-messy ?to)))
        )

    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not room-messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?loc)
            (key-at ?k ?loc)
            (hero-no-key)
            (not(room-messy ?loc))
        )

        :effect (and

            ; IMPLEMENT ME
            (hero-get-key ?k)
            (not (hero-no-key))
            (not (key-at ?k ?loc))
        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (hero-get-key ?k)
            (hero-at ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            (not (hero-get-key ?k))
            (hero-no-key)
            (key-at ?k ?loc)
        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (hero-get-key ?k)
            (key-usable ?k)
            (cor-lock-colour ?cor ?col)
            (key-colour ?k ?col)
            (hero-at ?loc)
            (cor-connected-to ?cor ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            (not (cor-locked ?cor))

            (when (key-use-two ?k)
                (and
                    (not (key-use-two ?k))
                    (key-use-one ?k)
            ))
            (when (key-use-one ?k)
                (and
                    (not (key-use-one ?k))
                    (not (key-usable ?k))
            ))
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is room-messy
    ;Effect will be that the location is no longer room-messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?loc)
            (room-messy ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            (not (room-messy ?loc))
        )
    )

)