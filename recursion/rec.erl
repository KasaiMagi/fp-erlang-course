-module(rec).
-include_lib("eunit/include/eunit.hrl").
-export([
    fib/1]).

fib(X) ->
    fib(X-1, 0, 1).
fib(X, Y, _) when X =< 0 ->
    Y;
fib(X, Y, Z) when X > 0 ->
    fib(X-1, Z, Y+Z).

fib_test() -> 
?assertEqual(0, rec:fib(0)),
?assertEqual(0, rec:fib(1)),
?assertEqual(1, rec:fib(2)),
?assertEqual(1, rec:fib(3)),
?assertEqual(2, rec:fib(4)).