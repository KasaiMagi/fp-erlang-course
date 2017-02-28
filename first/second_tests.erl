-module(second_tests). 
-include_lib("eunit/include/eunit.hrl").

hypotenuse_test() -> 
?assertEqual(0.0, second:hypotenuse(0, 0)),
?assertEqual(5.0, second:hypotenuse(3, 4)).

perimeter_test() -> 
?assertEqual(0.0, second:perimeter(0, 0)),
?assertEqual(12.0, second:perimeter(3, 4)).

area_test() -> 
?assertEqual(0.0, second:area(0, 0)),
?assertEqual(6.0, second:area(3, 4)).
