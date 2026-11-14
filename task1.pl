% ARTI 401 - Session 10: Prolog Operators Part II
% Task 1: Calculate the area and the perimeter of the square,
%         rectangle and triangle.

% ---------- Square (side S) ----------
square_area(S, Area) :-
    Area is S * S.

square_perimeter(S, Perimeter) :-
    Perimeter is 4 * S.

% ---------- Rectangle (length L, width W) ----------
rectangle_area(L, W, Area) :-
    Area is L * W.

rectangle_perimeter(L, W, Perimeter) :-
    Perimeter is 2 * (L + W).

% ---------- Triangle ----------
% Area from base B and height H
triangle_area(B, H, Area) :-
    Area is 0.5 * B * H.

% Perimeter from the three sides A, B, C
triangle_perimeter(A, B, C, Perimeter) :-
    Perimeter is A + B + C.

% ---------- Interactive version ----------
% Run:  ?- start.
% Enter every value followed by a full stop, e.g.  5.
start :-
    write('Choose a shape (square / rectangle / triangle): '),
    read(Shape),
    calculate(Shape).

calculate(square) :-
    write('Enter the side: '), read(S),
    square_area(S, A),
    square_perimeter(S, P),
    write('Area = '), write(A), nl,
    write('Perimeter = '), write(P), nl.

calculate(rectangle) :-
    write('Enter the length: '), read(L),
    write('Enter the width: '), read(W),
    rectangle_area(L, W, A),
    rectangle_perimeter(L, W, P),
    write('Area = '), write(A), nl,
    write('Perimeter = '), write(P), nl.

calculate(triangle) :-
    write('Enter the base: '), read(B),
    write('Enter the height: '), read(H),
    write('Enter side 1: '), read(S1),
    write('Enter side 2: '), read(S2),
    write('Enter side 3: '), read(S3),
    triangle_area(B, H, A),
    triangle_perimeter(S1, S2, S3, P),
    write('Area = '), write(A), nl,
    write('Perimeter = '), write(P), nl.

% ---------- Sample queries ----------
% ?- square_area(4, A).                 A = 16.
% ?- square_perimeter(4, P).            P = 16.
% ?- rectangle_area(5, 3, A).           A = 15.
% ?- rectangle_perimeter(5, 3, P).      P = 16.
% ?- triangle_area(6, 4, A).            A = 12.0.
% ?- triangle_perimeter(3, 4, 5, P).    P = 12.
