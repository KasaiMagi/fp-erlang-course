-module(first_tests). 
-include_lib("eunit/include/eunit.hrl").

square_test() -> 
?assertEqual(1, first:square(1)), 
?assertEqual(4, first:square(2)), 
?assertEqual(9, first:square(3)).

treble_test() -> 
?assertEqual(0, first:treble(0)), 
?assertEqual(6, first:treble(2)), 
?assertEqual(9, first:treble(3)).