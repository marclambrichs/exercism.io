-module(atbash_cipher).
-export([decode/1, encode/1]).

-spec atbash_cipher:decode(string()) -> string().
decode(L) ->
    prepare(L).
    
-spec atbash_cipher:encode(string()) -> string().
encode(L) ->
    A1 = prepare(L),
    A2 = re:replace(A1, "\\w{5}", "& ",[global,{return,list}]),
    string:strip(A2).

-spec atbash_cipher:prepare(string()) -> string().
prepare(L) ->
    A1 = re:replace(L, "\\W", "",[global,{return,list}]),
    A2 = string:to_lower(A1),
    lists:map(fun translate/1, A2).

-spec atbash_cipher:translate(char()) -> char().
translate(C) when C >= $a andalso C =< $z ->
    $z-C+$a;
translate(N) when N >= $0 andalso N =< $9 ->
    N.
