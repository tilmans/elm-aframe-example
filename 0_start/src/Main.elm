module Main exposing (..)

import Html exposing (..)
import AFrame exposing (..)


type alias Model =
    Int


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( 1, Cmd.none )


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
    scene [] []


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
