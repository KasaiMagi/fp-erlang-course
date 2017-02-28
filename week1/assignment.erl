-module(assignment).
-include_lib("eunit/include/eunit.hrl").
-export([
    area/1,
    perimeter/1,
    enclose/1,
    bitsD/1,
    bitsT/1
]).

% SHAPES
area(A,B,C) ->
    S = (A+B+C)/2,
    math:sqrt(S*(S-A)*(S-B)*(S-C)).

area({triangle, {X, Y}, A, B, C}) ->
    area(A, B, C).

perimeter({triangle, {X, Y}, A, B, C}) ->
    A+B+C.

enclose({circle, {X, Y}, R}) -> 
    {rectangle, {X, Y}, R*2, R*2};
enclose({rectangle, {X, Y}, H, W}) -> 
    {rectangle, {X, Y}, H, W}.

% SHAPES TESTS
% run eunit:test(assignment).
area_test() -> 
?assertEqual(6.0, assignment:area({triangle, {0,0}, 3, 4, 5})).

perimeter_test() -> 
?assertEqual(12, assignment:perimeter({triangle, {0,0}, 3, 4, 5})).

enclose_test() -> 
?assertEqual(
    {rectangle, {0,0}, 6, 6},
    assignment:enclose({circle, {0,0}, 3})
),
?assertEqual(
    {rectangle, {0,0}, 6, 6},
    assignment:enclose({rectangle, {0,0}, 6, 6})
).

% SUMMING
% Direct Recursion
bitsD(0) ->
    0;
bitsD(N) ->
    N rem 2 + bitsD(N div 2).

% Tail Recursion
bitsT(N) ->
    bitsT(N, 0).
bitsT(0, Y) ->
    Y;
bitsT(N, Y) ->
    bitsT(N div 2, Y + N rem 2).

% SUMMING TESTS
% Direct Recursion
bitsD_test() -> 
?assertEqual(0, assignment:bitsD(0)),
?assertEqual(2, assignment:bitsD(6)),
?assertEqual(3, assignment:bitsD(7)).

% Tail Recursion
bitsT_test() -> 
?assertEqual(0, assignment:bitsT(0)),
?assertEqual(2, assignment:bitsT(6)),
?assertEqual(3, assignment:bitsT(7)),
?assertEqual(1, assignment:bitsT(8)).

% I believe the direct recursion is ok because we dont recompute 
% the same values over and over. It is just as efficient as tail