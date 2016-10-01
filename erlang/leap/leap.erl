-module(leap).
-export([leap_year/1]).

leap_year(N) ->
    if
        N rem 400 == 0 ->
            true;
        N rem 100 == 0 ->
            false;
        N rem 4 == 0 ->
            true;
        true ->
            false
    end.
