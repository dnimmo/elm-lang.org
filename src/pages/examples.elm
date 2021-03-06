import Html exposing (..)
import Html.Attributes exposing (..)

import Center
import Skeleton



main =
  Skeleton.skeleton
    "Elm - Examples"
    "examples"
    [ Center.markdown "600px" content
    , div
        (style "padding" "0 0.5em" :: Center.styles "600px")
        [ view "HTML" html
        , view "Core Language" fundamentals
        , view "Effects" effects
        , view "Functional Thinking" core
        ]
    ]


content = """

# Examples

Playing with small examples is a great way to get comfortable with Elm! Think of them as a supplement to resources like the [syntax reference](/docs/syntax) and [guide.elm-lang.org](https://guide.elm-lang.org/).

"""



-- VIEW EXAMPLES


view : String -> List Section -> Html msg
view title sections =
  div
    [ class "examples"
    , style "width" "300px"
    , style "display" "inline-block"
    , style "vertical-align" "top"
    ]
    [ h3 [] [text title]
    , ul [] (List.map viewSection sections)
    ]


viewSection : Section -> Html msg
viewSection (title, examples) =
  li []
    [ text title
    , ul [] (List.map viewExample examples)
    ]


viewExample : (String, String) -> Html msg
viewExample (name, fileName) =
  let
    url =
      "/examples/" ++ fileName
  in
    li [] [ a [href url] [text name] ]



-- EXAMPLES


type alias Section = (String, List (String, String))


fundamentals : List Section
fundamentals =
  [ ( "Primitives"
    , [ ("math", "math")
      , ("strings", "strings")
      , ("calling functions", "functions")
      , ("defining functions", "define-functions")
      ]
    )
  , ( "Syntax"
    , [ ("if", "if")
      , ("let", "let")
      , ("case", "case")
      , ("lambda", "lambda")
      , ("pipes", "pipes")
      , ("types", "types")
      ]
    )
  ]


core : List Section
core =
  [ ( "Recursion"
    , [ ("list length", "length")
      , ("zip", "zip")
      , ("quick sort", "quick-sort")
      , ("merge sort", "merge-sort")
      ]
    )
  , ( "Custom Types"
    , [ ("binary tree", "binary-tree")
      , ("boolean expressions", "boolean-expressions")
      ]
    )
  ]


html : List Section
html =
  [ ( "Basics"
    , [ ("hello world!", "hello-html")
      , ("unordered list", "unordered-list")
      , ("markdown", "markdown")
      ]
    )
  , ( "User Input"
    , [ ("buttons", "buttons")
      , ("field", "field")
      , ("form", "form")
      , ("checkboxes", "checkboxes")
      , ("radio buttons", "radio-buttons")
      ]
    )
  ]


effects : List Section
effects =
  [ ( "Commands"
    , [ ("random", "random")
      , ("http", "http")
      ]
    )
  , ( "Subscriptions"
    , [ ("time", "time")
      , ("mouse drags", "drag")
      ]
    )
  ]
