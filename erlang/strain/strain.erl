-module(strain).
-export([keep/2, discard/2]).

keep(_, []) -> [];
keep(P, [H|T]) ->
    case P(H) of
        true ->
            [H| keep(P, T)];
        false ->
            keep(P, T)
    end.

discard(P, L) -> keep( fun(X) -> not P(X) end, L ).
    
