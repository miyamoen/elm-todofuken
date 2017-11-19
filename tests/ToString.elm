module ToString exposing (..)

import Todofuken exposing (..)
import Expression exposing (..)
import Sample exposing (..)
import Test exposing (..)


to : Test
to =
    describe "To test"
        [ "LongJa"
            ==> "東京都"
            === Todofuken.toString LongJa tokyo
        , "ShortJa"
            ==> "東京"
            === Todofuken.toString ShortJa tokyo
        , "LongKana"
            ==> "トウキョウト"
            === Todofuken.toString LongKana tokyo
        , "ShortKana"
            ==> "トウキョウ"
            === Todofuken.toString ShortKana tokyo
        , "LongEn"
            ==> "tokyoto"
            === Todofuken.toString LongEn tokyo
        , "ShortEn"
            ==> "tokyo"
            === Todofuken.toString ShortEn tokyo
        ]


do : Test
do =
    describe "Do test"
        [ "LongJa"
            ==> "北海道"
            === Todofuken.toString LongJa hokkaido
        , "ShortJa"
            ==> "北海道"
            === Todofuken.toString ShortJa hokkaido
        , "LongKana"
            ==> "ホッカイドウ"
            === Todofuken.toString LongKana hokkaido
        , "ShortKana"
            ==> "ホッカイドウ"
            === Todofuken.toString ShortKana hokkaido
        , "LongEn"
            ==> "hokkaido"
            === Todofuken.toString LongEn hokkaido
        , "ShortEn"
            ==> "hokkaido"
            === Todofuken.toString ShortEn hokkaido
        ]


fu : Test
fu =
    describe "Fu test"
        [ "LongJa"
            ==> "京都府"
            === Todofuken.toString LongJa kyoto
        , "ShortJa"
            ==> "京都"
            === Todofuken.toString ShortJa kyoto
        , "LongKana"
            ==> "キョウトフ"
            === Todofuken.toString LongKana kyoto
        , "ShortKana"
            ==> "キョウト"
            === Todofuken.toString ShortKana kyoto
        , "LongEn"
            ==> "kyotofu"
            === Todofuken.toString LongEn kyoto
        , "ShortEn"
            ==> "kyoto"
            === Todofuken.toString ShortEn kyoto
        ]


ken : Test
ken =
    describe "Ken test"
        [ "LongJa"
            ==> "愛知県"
            === Todofuken.toString LongJa aichi
        , "ShortJa"
            ==> "愛知"
            === Todofuken.toString ShortJa aichi
        , "LongKana"
            ==> "アイチケン"
            === Todofuken.toString LongKana aichi
        , "ShortKana"
            ==> "アイチ"
            === Todofuken.toString ShortKana aichi
        , "LongEn"
            ==> "aichiken"
            === Todofuken.toString LongEn aichi
        , "ShortEn"
            ==> "aichi"
            === Todofuken.toString ShortEn aichi
        ]
