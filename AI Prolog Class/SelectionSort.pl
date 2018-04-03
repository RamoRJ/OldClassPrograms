ss([], []).
ss([X|[Y]], [Small|[Sl]]):-
	small(Y,X,Small),
	remove([X|Y], Small, New),
	ss(New,Sl).


small([], Small, Small).
small([X,Y], CurrentSmall, Small):-	
	X < CurrentSmall, small(Y,X,Small).
small([_|Y], CurrentSmall, Small):-
	small(Y, CurrentSmall, Small).


remove([], _, []).
remove([X|Y], X, Y).
remove([X|Y], Number, [X|New]) :-
	remove(X,Number,New).