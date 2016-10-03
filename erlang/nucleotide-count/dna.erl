-module(dna).
-export([count/2, nucleotide_counts/1]).

count(Word, Nucleotide) ->
    validate(Nucleotide),
    lists:foldl(fun(X, Sum) ->
                        case [X] of
                            Nucleotide ->
                                Sum + 1;
                            _ ->
                                Sum
                        end
                end,
                0,
                Word).

validate(Nucleotide) ->
    case lists:member(Nucleotide, ["C","G","A","T"]) of
        true ->
            true;
        _ ->
            erlang:error("Invalid nucleotide")
    end.
                                
nucleotide_counts(Str) ->
    [{"A", count(Str, "A")},
     {"T", count(Str, "T")},
     {"C", count(Str, "C")},
     {"G", count(Str, "G")} ].


