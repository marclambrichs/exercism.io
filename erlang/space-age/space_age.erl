-module(space_age).
-export([ageOn/2]).

-define(Earth, 365.25 * 24 * 60 * 60).

ageOn(Planet, Seconds) ->
    Seconds / secondsInAYear(Planet).

secondsInAYear(Planet) ->
    case Planet of
        earth ->
            ?Earth;
        mercury ->
            0.2408467 * ?Earth;
        venus ->
            0.61519726 * ?Earth;
        mars ->
            1.8808158 * ?Earth;
        jupiter ->
            11.862615 * ?Earth;
        saturn ->
            29.447498 * ?Earth;
        uranus ->
            84.016846 * ?Earth;
        neptune ->
            164.79132 * ?Earth
    end.
