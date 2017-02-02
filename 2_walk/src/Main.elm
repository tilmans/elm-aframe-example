module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id)
import AFrame exposing (..)
import AFrame.Primitives exposing (..)
import AFrame.Primitives.Attributes exposing (..)
import ModelLoader exposing (..)
import AnimationFrame exposing (..)
import Time exposing (..)


type alias Model =
    { time : Time }


type Msg
    = TimeUpdate Time


models : List String
models =
    List.map (\n -> ("T-Rex-0" ++ (toString n) ++ ".ply")) (List.range 0 7)


init : ( Model, Cmd Msg )
init =
    ( Model 0, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TimeUpdate diff ->
            { model | time = model.time + diff } ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    AnimationFrame.diffs TimeUpdate


getModelSource : Model -> String
getModelSource model =
    let
        fps =
            6

        frames =
            List.length models

        time =
            round (model.time / second * fps)

        indexToTake =
            rem time frames
    in
        "dino" ++ (toString indexToTake)


getModels : List (Html Msg)
getModels =
    List.map2
        (\n f -> assetitem [ src f, id ("dino" ++ (toString n)) ] [])
        (List.range 0 (List.length models))
        models


view : Model -> Html Msg
view model =
    let
        modelsrc =
            "src: #" ++ (getModelSource model)
    in
        scene []
            [ assets [] ([] ++ getModels)
            , entity
                [ plymodel modelsrc
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
