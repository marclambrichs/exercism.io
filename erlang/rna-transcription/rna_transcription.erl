-module(rna_transcription).
-export([to_rna/1]).

to_rna(S) ->
    lists:map(fun convert/1, S).
convert(C) ->
	case C of
	    $G -> $C;
	    $C -> $G;
	    $T -> $A;
	    $A -> $U
	end.
