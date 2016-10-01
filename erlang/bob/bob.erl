-module(bob).
-export([response_for/1]).
-compile([export_all]).

response_for(String) -> 
    first_match(String, [{fun is_nothing/1, "Fine. Be that way!" },
                         {fun is_shouting/1, "Whoa, chill out!"},
                         {fun is_question/1, "Sure."},
                         {fun (_) -> true end, "Whatever."}]).

first_match(String, [{F, S}|T]) ->
    case F(String) of
        true ->
            S;
        false ->
            first_match(String, T)
    end.
                                          
match_re(Str, Regex) ->
    case re:run(Str, Regex) of
        {match, _} ->
            true;
        nomatch ->
            false
    end.          

is_question(String) ->
    match_re(String, "\\?$").

is_shouting(String) ->
    match_re(String, "[A-Z]+").

is_nothing(String) ->
    match_re(String, "^\\s*$").


