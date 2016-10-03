-module(atbash_cipher).
-export([decode/1, encode/1]).

-define(ABC, "abcdefghijklmnopqrstuvwxyz").
-define(CBA, lists:reverse(?ABC)).

-spec atbash_cipher:decode(string()) -> string().
decode(L) ->
    encode(prepare(L), ?CBA, ?ABC).
    
-spec atbash_cipher:encode(string()) -> string().
encode(L) ->
    L1 = encode(prepare(L), ?ABC, ?CBA),
    string:strip(re:replace(L1, "\\w{5}", "& ",[global,{return,list}])).

-spec atbash_cipher:encode(string(), integer(), integer()) -> string().
encode(L, From, To) ->
    lists:map(fun(X) ->
                      case (X >= $a andalso X =< $z) of
                          true ->
                              lists:nth(string:str(From, [X]),To);
                          false ->
                              X
                      end
              end,
              L ).

-spec atbash_cipher:prepare(string()) -> string().
prepare(L) ->
    lists:filter(fun(X) -> (X >= $a andalso X =< $z) orelse
                           (X >= $0 andalso X =< $9) 
                 end, 
                 string:to_lower(L)).
