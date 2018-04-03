% 1a) - writing a program with no iterators
SumOfList ([],0).
SumOfList ([Xhead | Xtail], Total):-
	SumOfList (Xtail, Sum1),
	Total is Xhead + Sum1.
	
%1b) - writing a program with an iterator from Ch. 7
SumOfList (List).
SumOfList ([Head | Tails]) :-
(	foreach(X, List) do 
	X is X + Head	
).

%2a) - writing a program with no iterators
MaximumOfList ([X], X) :- !, true.
MaximumOfList ([X | Xs], Max) :- MaximumOfList (Xs, Max), Max >=X.
MaximumOfList ([X | Xs], X) :- MaximumOfList (Xs, Max), X < Max.

%2b) - writing a program with iterators
MaximumOfList (Xs, Max) :- 
MaximumOfList ([Head | Tail], Max),
(	foreach (el, Tail), 
	fromto ( Head, In, Out, Max)  %what should we do initialize fromto
	do	
	%every iteration
	%in should carry the maximum we have seen so far
	%and then check it with El and
	%transform in to out such that
	%out will carry the new maximum after sealing El
)
.