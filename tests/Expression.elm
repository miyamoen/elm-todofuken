module Expression exposing (..)

import Test exposing (Test)
import Expect exposing (Expectation)


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
