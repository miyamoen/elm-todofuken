module Search exposing (..)

import Todofuken exposing (..)
import Expression exposing (..)
import Sample exposing (..)
import Test exposing (..)


code : Test
code =
    describe "fromCode"
        [ "tokyo"
            ==> Just tokyo
            === fromCode tokyo.code
        , "hokkaido"
            ==> Just hokkaido
            === fromCode hokkaido.code
        , "kyoto"
            ==> Just kyoto
            === fromCode kyoto.code
        , "aichi"
            ==> Just aichi
            === fromCode aichi.code
        , "no prefecture"
            ==> Nothing
            === fromCode 48
        ]


searchTest : Test
searchTest =
    describe "search"
        [ "ai" ==> contains aichi <| search "ai"
        , "ch" ==> contains aichi <| search "ch"
        , "愛" ==> contains aichi <| search "愛"
        , "アイ" ==> contains aichi <| search "アイ"
        ]


fromAreaTest : Test
fromAreaTest =
    describe "fromArea"
        [ "kanto" ==> contains tokyo <| fromArea kantoArea
        , "hokkaido/tohoku" ==> contains hokkaido <| fromArea hokkaidoTohokuArea
        , "chubu" ==> contains aichi <| fromArea chubuArea
        , "kinki" ==> contains kyoto <| fromArea kinkiArea
        ]
