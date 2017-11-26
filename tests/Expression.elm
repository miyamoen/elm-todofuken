module Expression exposing (..)

import Test exposing (Test)
import Expect exposing (Expectation)
import Set


infixr 0 ==>
(==>) : String -> (() -> Expectation) -> Test
(==>) =
    Test.test


infixr 0 ===
(===) : a -> a -> () -> Expectation
(===) a b _ =
    Expect.equal a b


infixr 0 /==
(/==) : a -> a -> () -> Expectation
(/==) a b _ =
    Expect.notEqual a b


contains : a -> List a -> () -> Expectation
contains item list _ =
    if List.member item list then
        Expect.pass
    else
        Expect.fail <|
            (toString list)
                ++ " dose not contain "
                ++ (toString item)


hasUniqueProperty : (a -> comparable) -> List a -> () -> Expectation
hasUniqueProperty toProperty list =
    List.length list
        === (list
                |> List.map toProperty
                |> Set.fromList
                |> Set.size
            )
