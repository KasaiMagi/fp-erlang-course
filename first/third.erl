-module(third).
-export([
    maxL/1]).

max2(A, []) ->
    A;
max2(A, B) ->
    max(A, maxL(B)).

maxL([Head|Tail]) ->
    max2(Head, Tail).