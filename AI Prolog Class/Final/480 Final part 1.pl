%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Recursive versions of 1 - 3.%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%#1%%%%%%%%

notMemberOfList(Item, Xs).
notMemberOfList(Item,[Item|_]) :- !, fail.
notMemberOfList(Item,[_|Tail]) :- !, notMemberOfList(Item,Tail).
notMemberOfList(_,[]).

%%%%%%%%#2%%%%%%%%

disjoint(Xs, Ys) :- not (member(X,Xs), member(X, Ys)).

%%%%%%%%#3%%%%%%%%
%using the built in memberchk to see if an element is part of a list.
setIntersection([], _, []).
setIntersection([H|L1t], L2, L3) :- 
	memberchk(H, L2), !, L3 = [H|L3t], setIntersection(L1t, L2, L3t).
setIntersection([_|L1t], L2, L3) :- setIntersection(L1t, L2, L3).

