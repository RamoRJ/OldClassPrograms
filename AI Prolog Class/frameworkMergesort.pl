%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ms(Xs, Ys) :- 
%     Ys is an =<-ordered permutation of the list Xs.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ms([], []).
ms([X|[]], [X|[]]).
ms(Xs, Ys) :- 
	part(Xs, Ls, Us),
	ms(Ls, S1),
	ms(Us, S2),
	merged(S1, S2, Ys).
   % part Xs into two parts
   % ms either part
   % merge both parts into Ys.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% part(Xs, Ls, Us) :- 
%	
%     Ls is a list of elements of Xs in the first half of Xs
%     Us is a list of elements of Xs in the second half of Xs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
part([], [], []).
part([X | [] ], [], [X | [] ]).
part([S|Y], [S|Ls], Us) :- part(Y, Ls, Us).





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% merge(Ls, Us, MergedLUs) :- 
%	
%     Ls is a list of sorted elements
%     Us is a list of sorted elements
%     MergedLUs is the sorted list of all elements in Ls & Us
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
merged([], Us, Us).
merged(Ls, [], Ls).
merged([L|Ls], [U|Us], [L | MergedLsUs]) :-
	L =< U, merged(Ls, [U|Us], MergedLsUs).
merged([L|Ls], [U|Us], [U | MergedLsUs]):-
	L > U, merged([L|Ls], Us, MergedLsUs).





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% app(Xs, Ys, Zs) :- Zs is the result of 
%     concatenating the lists Xs and Ys. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
app([], Ys, Ys).
app([X | Xs], Ys, [X | Zs]) :- app(Xs, Ys, Zs).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% len(List, N) :- N is the length of the list List.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len([], 0).
len([_ | Ts], N) :- len(Ts, M), N is M+1.

