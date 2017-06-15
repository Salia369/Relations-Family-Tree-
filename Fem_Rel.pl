/* relations */

parent(vlasis, blasius).
parent(vlasis, sverre).
parent(vlasis, shadric).
parent(vlasis, catrin).    

parent(loretta, blasius).
parent(loretta, sverre).
parent(loretta, shadric).
parent(loretta, catrin).

parent(tristian, astoria).
parent(tristian, leah).

parent(nadine, astoria).

parent(blasius, hazael).

parent(astoria, hazael).

parent(sverre, leon).
parent(sverre, darcia).
parent(sverre, jaques).

parent(alisha, leon).
parent(alisha, darcia).
parent(alisha, jaques).

parent(dainian, chariton).
parent(dainian, inkara).

parent(ercilia, chariton).
parent(ercilia, inkara).

male(vlasis).
male(blasius).
male(sverre).
male(shadric).
male(hazael).
male(leon).
male(jaques).
male(dainian).
male(chariton).
male(tristian).

female(ercilia).
female(inkara).
female(catrin).
female(darcia).
female(alisha).
female(astoria).
female(loretta).
female(leah).
female(nadine).


/* rules */

father(X, Y) :-
parent(X, Y),
male(X).

mother(X, Y) :-
parent(X, Y),
female(X).

child(X, Y) :-
parent(Y, X).

spouse(X, Y) :-
child(Z, X),
child(Z, Y),
X \= Y.

son(X, Y) :-
parent(Y, X),
male(X).

daughter(X, Y) :-
parent(Y, X),
female(X).

grandparent(X, Y) :-
parent(X, Z),
child(Y, Z).

grandfather(X, Y) :-
parent(X, Z),
child(Y, Z),
male(X).

grandmother(X, Y) :-
parent(X, Z),
child(Y, Z),
female(X).

grandchild(X, Y) :-
parent(Y, Z),
child(X, Z).

grandson(X, Y) :-
parent(Y, Z),
child(X, Z),
male(X).

granddaughter(X, Y) :-
parent(Y, Z),
child(X, Z),
female(X).

ancestor(X, Y) :-
parent(X, Y).

ancestor(X, Y) :-
parent(Z, Y),
ancestor(X, Z).

descendent(X, Y) :-
ancestor(Y, X).

relative(X, Y) :-
ancestor(Z, X),
ancestor(Z, Y).

sibling(X, Y) :-
parent(Z, X),
parent(Z, Y),
X \= Y.

sister(X, Y) :-
sibling(X, Y),
female(X),
X \= Y.

brother(X, Y) :-
sibling(X, Y),
male(X),
X \= Y.

cousin(X, Y) :-
parent(Z, X),
parent(A, Y),
sibling(A, Z).

