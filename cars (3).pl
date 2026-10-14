% ARTI 303 - Programming for AI
% Lab 6 - Task 1: Colour Matters
% Student submission - Cars and Trucks Suggestion System

% Facts: car/truck(Model, Price, Age, Colour, Mileage)
car(chrysler, 130000, 3, red, 12000).
car(ford, 90000, 4, gray, 25000).
car(datsun, 80000, 1, red, 30000).

truck(ford, 80000, 6, blue, 8000).
truck(datsun, 50000, 5, orange, 20000).
truck(toyota, 25000, 2, black, 25000).

% Original rules: suggest vehicles within the given budget.
% Kept unchanged so can_buy(Cost) still works.
can_buy(Cost) :-
    car(Model, C1, _, _, _),
    C1 < Cost,
    write('With '), write(C1),
    write(' you can purchase the car '), write(Model), nl.

can_buy(Cost) :-
    truck(Model, C2, _, _, _),
    C2 < Cost,
    write('With '), write(C2),
    write(' you can purchase the truck '), write(Model), nl.

% Task 1: suggest only cars or trucks matching BOTH budget and colour.
% New rule for cars.
can_buy(Cost, Colour) :-
    car(Model, Price, _, Colour, _),
    Price < Cost,
    write('With '), write(Price),
    write(' you can purchase the '), write(Colour),
    write(' car '), write(Model), nl.

% New rule for trucks.
can_buy(Cost, Colour) :-
    truck(Model, Price, _, Colour, _),
    Price < Cost,
    write('With '), write(Price),
    write(' you can purchase the '), write(Colour),
    write(' truck '), write(Model), nl.

% ------------------------------------------------------------
% Task 1 - Test queries and expected results
% Run each query at the SWI-Prolog prompt (not inside this file).
%
% ?- can_buy(100000, red).
% With 80000 you can purchase the red car datsun
%
% ?- can_buy(100000, blue).
% With 80000 you can purchase the blue truck ford
%
% ?- can_buy(200000, green).
% false.
%
% Optional: a higher budget shows both red cars.
% ?- can_buy(200000, red).
% With 130000 you can purchase the red car chrysler
% With 80000 you can purchase the red car datsun
%
% Check the original one-argument rule still works:
% ?- can_buy(100000).
% It can suggest ford and datsun cars and the three trucks.
% ------------------------------------------------------------
