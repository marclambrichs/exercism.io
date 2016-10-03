-module(phone).
-export([areacode/1,number/1,pretty_print/1]).

-spec phone:areacode(string()) -> string().
-spec phone:number(string()) -> string().
-spec phone:pretty_print(string()) -> string().

-define(ZEROS, "0000000000").
-define(REGEX, "^1?(\\d{3})(\\d{3})(\\d{4})$").

number(S) ->
    A1 = lists:filter(fun parse/1, S),
    check(A1).

check(N) ->
    case re:run(N, ?REGEX, [{capture,all_but_first,list}]) of
        nomatch ->
            ?ZEROS;
        {match, Captured} ->
            string:join(Captured,"")
    end.

areacode(N) ->
    re:replace(N, ?REGEX, "\\1", [global,{return,list}]).

pretty_print(N) ->
    re:replace(N, ?REGEX, "(\\1) \\2-\\3", [global,{return,list}]).

parse(C) -> C >= $0 andalso C =< $9.
