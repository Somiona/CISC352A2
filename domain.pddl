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
        (hero-at ?loc - location)
        (hero-get-key ?k - key)
        (hero-no-key)

        (key-at ?k - key ?loc - location)
        (key-color ?k - key ?col - colour)
        (key-usable ?k - key)
        (one-use-key ?k - key)
        (two-use-key ?k - key)

        (path ?cor - corridor ?room1 - location ?room2 - location)
        (cor-connected-to ?cor - corridor ?loc - location)
        (is-locked ?cor - corridor) ; is a corridor locked?
        (how-cor-locked ?cor - corridor ?col - colour) ; if a corridor is locked, how is it locked?
        (risky ?cor - corridor)

        (messy ?loc - location)


        (goal ?loc - location)

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
            (not (and
                (not (path ?cor ?to ?from))
                (not (path ?cor ?from ?to))
            ))
            (not (is-locked ?cor))

        )

        :effect (and

            ; IMPLEMENT ME
            (hero-at ?to)
            (not (hero-at ?from))
            (when (how-cor-locked ?cor red) (and (not (path ?cor ?from ?to))(messy ?to)))
        )

    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and


            ; IMPLEMENT ME
            (hero-at ?loc)
            (key-at ?k ?loc)
            (hero-no-key)
            (not(messy ?loc))

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
            (how-cor-locked ?cor ?col)
            (key-col ?k ?col)
            (hero-at ?loc)
            (cor-connected-to ?cor ?loc)

        )

        :effect (and

            ; IMPLEMENT ME
            (not (is-locked ?cor))

            (when (two-use-key ?k)
            (and (not (two-use-key ?k)) (one-use-key ?k)))
            (when (one-use-key ?k)
            (and (not (one-use-key ?k)) (not (key-usable ?k)))
            )
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?loc)
            (messy ?loc)

        )

        :effect (and

            ; IMPLEMENT ME
            (not (messy ?loc))

        )
    )

)