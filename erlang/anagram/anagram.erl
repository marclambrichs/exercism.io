-module(anagram).
-export([find/2]).

find(_, []) ->
    [];
find(W,[H|T]) ->
    case is_anagram(W,H) of
        true -> [H] ++ find(W,T);
        false -> find(W,T)
    end.

is_anagram([], _) ->
    true;
is_anagram(L1, L2) ->
    S1 = string:to_lower(L1),
    S2 = string:to_lower(L2),
    length(L1) =:= length(L2) andalso
    S1 =/= S2 andalso
    partition(S1) =:= partition(S2).

partition([]) ->
    [];
partition([H|T]=L) ->
    lists:sort([ {H, occurrences(H, L)} ] ++ partition(delete_all(H,T))).
    
occurrences(_, []) -> 0;
occurrences(H, L) ->
    lists:foldl(fun(X, Sum) -> case X of
                                   H ->
                                       Sum + 1;
                                   _ ->
                                       Sum
                               end
                end,
                0,
                L).

delete_all(_, []) -> [];
delete_all(H, [H|T]) ->
    delete_all(H, T);
delete_all(X, [H|T]) ->
    [H] ++ delete_all(X, T).
