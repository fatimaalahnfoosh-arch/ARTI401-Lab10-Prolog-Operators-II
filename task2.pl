% ARTI 401 - Session 10: Prolog Operators Part II
% Task 2: Login page that checks the username and password from
%         the dataset, with a maximum of 3 attempts (1 + 2 more).

% ---------- Dataset: user(Username, Password) ----------
user(fatima, pass123).
user(sara,   sara2026).
user(noura,  ai401).
user(admin,  admin99).

% Maximum number of attempts allowed
max_attempts(3).

% ---------- Login ----------
% Run:  ?- login.
% End every input with a full stop, e.g.  fatima.  then  pass123.
login :-
    attempt(1).

% Attempts exceeded the maximum
attempt(N) :-
    max_attempts(Max),
    N > Max, !,
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

% Correct username and password
attempt(_) :-
    write('Username: '), read(U),
    write('Password: '), read(P),
    atom(U), atom(P),          % reject empty/variable input (e.g. Capitalised words)
    user(U, P), !,
    write('Login Successful'), nl.

% Wrong username or password -> try again
attempt(N) :-
    write('Login Unsuccessful'), nl,
    max_attempts(Max),
    Left is Max - N,
    ( Left > 0 ->
        write('You have '), write(Left), write(' attempt(s) left.'), nl
    ;   true
    ),
    N1 is N + 1,
    attempt(N1).
