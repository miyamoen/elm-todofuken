module Todofuken exposing (..)

{-| A searchable [ISO 3166-2:JP](https://en.wikipedia.org/wiki/ISO_3166-2:JP) based list of prefectures and areas.


# Types

@docs Prefecture, Unit, Area


# Find helpers

@docs fromCode, search, fromArea, fromAreaId


# toString

@docs Format, toString


# Data set

@docs allPrefectures, allAreas, areaPrefectures
@docs hokkaidoTohokuArea, kantoArea, chubuArea, kinkiArea, chugokuArea, shikokuArea,kyushuOkinawaArea

-}


{-| -}
type Unit
    = To
    | Do
    | Fu
    | Ken


{-| -}
type alias Prefecture =
    { code : Int
    , name : String
    , unit : Unit
    , kana : String
    , en : String
    , area : Area
    }


{-| -}
type Format
    = LongJa
    | ShortJa
    | LongKana
    | ShortKana
    | LongEn
    | ShortEn


{-| The areas group prefectures.
-}
type alias Area =
    { id : Int
    , name : String
    , kana : String
    , en : String
    }


{-|

    toString LongJa aichi -- 愛知県
    toString ShortJa aichi -- 愛知
    toString LongKana aichi -- アイチケン
    toString ShortKana aichi -- アイチ
    toString LongEn aichi -- aichiken
    toString ShortEn aichi -- aichi

-}
toString : Format -> Prefecture -> String
toString format { name, unit, kana, en } =
    case ( format, unit ) of
        ( LongJa, To ) ->
            name ++ "都"

        ( LongJa, Do ) ->
            name

        ( LongJa, Fu ) ->
            name ++ "府"

        ( LongJa, Ken ) ->
            name ++ "県"

        ( ShortJa, _ ) ->
            name

        ( LongKana, To ) ->
            kana ++ "ト"

        ( LongKana, Do ) ->
            kana

        ( LongKana, Fu ) ->
            kana ++ "フ"

        ( LongKana, Ken ) ->
            kana ++ "ケン"

        ( ShortKana, _ ) ->
            kana

        ( LongEn, To ) ->
            en ++ "to"

        ( LongEn, Do ) ->
            en

        ( LongEn, Fu ) ->
            en ++ "fu"

        ( LongEn, Ken ) ->
            en ++ "ken"

        ( ShortEn, _ ) ->
            en


{-| Find a prefecture by its [ISO 3166-2:JP](https://en.wikipedia.org/wiki/ISO_3166-2:JP).
-}
fromCode : Int -> Maybe Prefecture
fromCode code =
    allPrefectures
        |> List.filter (\prefecture -> prefecture.code == code)
        |> List.head


{-| Find a prefecture by area.
-}
fromArea : Area -> List Prefecture
fromArea area =
    fromAreaId area.id


{-| Find a prefecture by area id.
-}
fromAreaId : Int -> List Prefecture
fromAreaId id =
    allPrefectures
        |> List.filter (\prefecture -> prefecture.area.id == id)


{-| Search all Prefectures by case-insensitive string matching on name, kana and en.
-}
search : String -> List Prefecture
search query =
    allPrefectures
        |> List.filter
            (\{ name, kana, en } ->
                String.contains (String.toLower query) (name ++ kana ++ en)
            )


{-| The full list of all 7 Area records.
-}
allAreas : List Area
allAreas =
    [ hokkaidoTohokuArea
    , kantoArea
    , chubuArea
    , kinkiArea
    , chugokuArea
    , shikokuArea
    , kyushuOkinawaArea
    ]


{-| -}
hokkaidoTohokuArea : Area
hokkaidoTohokuArea =
    Area 1 "北海道・東北" "ホッカイドウ・トウホク" "hokkaido/tohoku"


{-| -}
kantoArea : Area
kantoArea =
    Area 2 "関東" "カントウ" "kanto"


{-| -}
chubuArea : Area
chubuArea =
    Area 3 "中部" "チュウブ" "chubu"


{-| -}
kinkiArea : Area
kinkiArea =
    Area 4 "近畿" "キンキ" "kinki"


{-| -}
chugokuArea : Area
chugokuArea =
    Area 5 "中国" "チュウゴク" "chugoku"


{-| -}
shikokuArea : Area
shikokuArea =
    Area 6 "四国" "シコク" "shikoku"


{-| -}
kyushuOkinawaArea : Area
kyushuOkinawaArea =
    Area 7 "九州・沖縄" "キュウシュウ・オキナワ" "kyushu/okinawa"


{-| The full list of all 47 Prefecture records.
-}
allPrefectures : List Prefecture
allPrefectures =
    [ ( 1, "北海道", Do, "ホッカイドウ", "hokkaido", hokkaidoTohokuArea )
    , ( 2, "青森", Ken, "アオモリ", "aomori", hokkaidoTohokuArea )
    , ( 3, "岩手", Ken, "イワテ", "iwate", hokkaidoTohokuArea )
    , ( 4, "宮城", Ken, "ミヤギ", "miyagi", hokkaidoTohokuArea )
    , ( 5, "秋田", Ken, "アキタ", "akita", hokkaidoTohokuArea )
    , ( 6, "山形", Ken, "ヤマガタ", "yamagata", hokkaidoTohokuArea )
    , ( 7, "福島", Ken, "フクシマ", "hukushima", hokkaidoTohokuArea )
    , ( 8, "茨城", Ken, "イバラキ", "ibaraki", kantoArea )
    , ( 9, "栃木", Ken, "トチギ", "tochigi", kantoArea )
    , ( 10, "群馬", Ken, "グンマ", "gumma", kantoArea )
    , ( 11, "埼玉", Ken, "サイタマ", "saitama", kantoArea )
    , ( 12, "千葉", Ken, "チバ", "chiba", kantoArea )
    , ( 13, "東京", To, "トウキョウ", "tokyo", kantoArea )
    , ( 14, "神奈川", Ken, "カナガワ", "kanagawa", kantoArea )
    , ( 15, "新潟", Ken, "ニイガタ", "nigata", chubuArea )
    , ( 16, "富山", Ken, "トヤマ", "toyama", chubuArea )
    , ( 17, "石川", Ken, "イシカワ", "ishikawa", chubuArea )
    , ( 18, "福井", Ken, "フクイ", "hukui", chubuArea )
    , ( 19, "山梨", Ken, "ヤマナシ", "yamanashi", chubuArea )
    , ( 20, "長野", Ken, "ナガノ", "nagano", chubuArea )
    , ( 21, "岐阜", Ken, "ギフ", "gifu", chubuArea )
    , ( 22, "静岡", Ken, "シズオカ", "shizuoka", chubuArea )
    , ( 23, "愛知", Ken, "アイチ", "aichi", chubuArea )
    , ( 24, "三重", Ken, "ミエ", "mie", kinkiArea )
    , ( 25, "滋賀", Ken, "シガ", "shiga", kinkiArea )
    , ( 26, "京都", Fu, "キョウト", "kyoto", kinkiArea )
    , ( 27, "大阪", Fu, "オオサカ", "osaka", kinkiArea )
    , ( 28, "兵庫", Ken, "ヒョウゴ", "hyogo", kinkiArea )
    , ( 29, "奈良", Ken, "ナラ", "nara", kinkiArea )
    , ( 30, "和歌山", Ken, "ワカヤマ", "wakayama", kinkiArea )
    , ( 31, "鳥取", Ken, "トットリ", "tottori", chugokuArea )
    , ( 32, "島根", Ken, "シマネ", "shimane", chugokuArea )
    , ( 33, "岡山", Ken, "オカヤマ", "okayama", chugokuArea )
    , ( 34, "広島", Ken, "ヒロシマ", "hiroshima", chugokuArea )
    , ( 35, "山口", Ken, "ヤマグチ", "yamaguchi", chugokuArea )
    , ( 36, "徳島", Ken, "トクシマ", "tokushima", shikokuArea )
    , ( 37, "香川", Ken, "カガワ", "kagawa", shikokuArea )
    , ( 38, "愛媛", Ken, "エヒメ", "ehime", shikokuArea )
    , ( 39, "高知", Ken, "コウチ", "kochi", shikokuArea )
    , ( 40, "福岡", Ken, "フクオカ", "hukuoka", kyushuOkinawaArea )
    , ( 41, "佐賀", Ken, "サガ", "saga", kyushuOkinawaArea )
    , ( 42, "長崎", Ken, "ナガサキ", "nagasaki", kyushuOkinawaArea )
    , ( 43, "熊本", Ken, "クマモト", "kumamoto", kyushuOkinawaArea )
    , ( 44, "大分", Ken, "オオイタ", "oita", kyushuOkinawaArea )
    , ( 45, "宮崎", Ken, "ミヤザキ", "miyazaki", kyushuOkinawaArea )
    , ( 46, "鹿児島", Ken, "カゴシマ", "kagoshima", kyushuOkinawaArea )
    , ( 47, "沖縄", Ken, "オキナワ", "okinawa", kyushuOkinawaArea )
    ]
        |> List.map
            (\( code, name, unit, kana, en, area ) ->
                Prefecture code name unit kana en area
            )


{-| List all areas having prefectures.
-}
areaPrefectures : List { area : Area, prefectures : List Prefecture }
areaPrefectures =
    allAreas
        |> List.map (\area -> { area = area, prefectures = fromArea area })
