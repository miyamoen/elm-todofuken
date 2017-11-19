module Consistency exposing (..)

import Expect exposing (Expectation)
import Expression exposing (..)
import Sample exposing (..)
import Set
import Test exposing (..)
import Todofuken exposing (..)


consistency : Test
consistency =
    describe "consistency"
        [ "count prefectures" ==> 47 === List.length allPrefectures
        , "count areas" ==> 7 === List.length allAreas
        , "count hokkaido/tohoku area" ==> 7 === List.length <| fromArea hokkaidoTohokuArea
        , "count kanto area" ==> 7 === List.length <| fromArea kantoArea
        , "count chubu area" ==> 9 === List.length <| fromArea chubuArea
        , "count kinki area" ==> 7 === List.length <| fromArea kinkiArea
        , "count chugoku area" ==> 5 === List.length <| fromArea chugokuArea
        , "count shikoku area" ==> 4 === List.length <| fromArea shikokuArea
        , "count kyushu/okinawa area" ==> 8 === List.length <| fromArea kyushuOkinawaArea
        , "count allAreaPrefectures" ==> 47 === List.length <| List.concatMap .prefectures areaPrefectures
        , "prefecture.code is unique" ==> hasUniqueProperty .code allPrefectures
        , "prefecture.name is unique" ==> hasUniqueProperty .name allPrefectures
        , "prefecture.kana is unique" ==> hasUniqueProperty .kana allPrefectures
        , "prefecture.en is unique" ==> hasUniqueProperty .en allPrefectures
        , "area.id is unique" ==> hasUniqueProperty .id allAreas
        , "area.name is unique" ==> hasUniqueProperty .name allAreas
        , "area.kana is unique" ==> hasUniqueProperty .kana allAreas
        , "area.en is unique" ==> hasUniqueProperty .en allAreas
        ]


hasUniqueProperty : (a -> comparable) -> List a -> () -> Expectation
hasUniqueProperty toProperty list =
    List.length list
        === (list
                |> List.map toProperty
                |> Set.fromList
                |> Set.size
            )
