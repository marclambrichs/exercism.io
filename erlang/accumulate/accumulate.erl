-module(accumulate).
-export([accumulate/2]).

accumulate(F, L) ->
    [ F(X) || X <- L ].
