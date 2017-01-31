module Main exposing (..)

import Html exposing (..)
import AFrame exposing (..)
import AFrame.Primitives.Attributes exposing (..)
import ModelLoader exposing (..)


type alias Model =
    Int


type Msg
    = NoOp


models : List String
models =
    List.map (\n -> ("T-Rex-0" ++ n ++ ".ply")) (List.range 0 7)


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    let
        modelsrc =
            getModelSource model
    in
        scene []
            [ entity
                [ plymodel "src: url(/" ++ modelsrc ++ ")"
                , scale 0.5 0.5 0.5
                , position 0 -6 -13
                , rotation -90 0 0
                ]
                []
            ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
