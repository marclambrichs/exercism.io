-module(sum_of_multiples).
-compile([export_all]).

%% Experimenting with lazy list. Could have used lists:seq/2.
integers(X) ->
     [ X | fun() -> integers(X + 1) end].

seq(X,Y) -> seq2(integers(X), Y).
    
seq2([H|Tl], N) ->
    case H < N of
        true ->
            [H| seq2(Tl(), N)];
        false ->
            []
    end.

%% Again, lists:filter/2 is available as well.
filter(_, []) -> [];
filter(P, [H|Tl]) ->
    case P(H) of
        true ->
            [H|filter(P,Tl)];
        false ->
            filter(P,Tl)
    end.

multiples(L, X) ->
    filter(fun(Y) -> (Y rem X) =:= 0 end, L).

sumOfMultiples(L, A) ->
    L1 = lists:flatten(lists:map(fun(X) -> multiples(seq(1,A), X) end, L)),
    lists:sum(remove_duplicates(L1)).

remove_duplicates([]) ->
    [];
remove_duplicates([H|Tl]) -> [H | [X || X <- remove_duplicates(Tl), X /= H]].

