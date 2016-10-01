-module(grains).
-export([square/1,total/0]).

square(1) -> 1;
square(N) -> round(math:pow(2, N-1)).

total() ->
    total(64).

total(1) -> 1;
total(N) -> square(N) + total(N-1).
