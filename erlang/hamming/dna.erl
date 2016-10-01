-module(dna).
-export([hamming_distance/2]).

hamming_distance(X, Y) ->
    hamming_distance(X, Y, 0).

hamming_distance([],[],Acc) -> Acc;
hamming_distance([H1|Tl1], [H2|Tl2], Acc) ->
    case H1 == H2 of
        true ->
            hamming_distance(Tl1, Tl2, Acc);
        false ->
            hamming_distance(Tl1, Tl2, Acc + 1)
    end.
