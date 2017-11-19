# elm-todofuken

A searchable [ISO 3166-2:JP](https://en.wikipedia.org/wiki/ISO_3166-2:JP) based list of japanese prefectures and areas.

```elm
> import Todofuken
> Todofuken.fromCode 23
Just { code = 23, name = "愛知", unit = Ken, kana = "アイチ", en = "aichi", { id = 3, name = "中部", kana = "チュウブ", en = "chubu"} }
    : Maybe.Maybe Todofuken.Prefecture
```
