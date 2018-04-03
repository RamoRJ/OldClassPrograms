%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% magicSquare(SquareStruct, Number) :- The 2-dimensional array SquareStruct 
%     is a solution to the Number-magic square problem.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

magicSquare(SquareStruct, Number) :-
    dim(SquareStruct,[Number, Number]),
    ( multifor( [I, J],[1,1],[Number,Number]), 
      param(SquareStruct,Number)
    do
	N_Square is Number*Number,
      select_val(1, N_Square, Qij),
      subscript(SquareStruct, [I,J], Qij),
	( I =:= Number, J =:=Number ->
		(	writeln(SquareStruct),
			checkSqare(SquareStruct)
		);
		true
	)
    ).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% select_val(Min, Max, Val) :- 
%     Min, Max are gaes and Val is an integer 
%     between Min and Max inclusive.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

select_val(Min, Max, Val) :- Min =< Max, Val is Min. 
select_val(Min, Max, Val) :- 
    Min < Max, Min1 is Min+1, 
    select_val(Min1, Max, Val).





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% aToL(A, L):- A is a 1-dimensional array,
%     L is a list with the same elements in it.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aToL(A, L):- 
	(	param(A, L),
		foreachelem(X, A),
		fromto([],This, Next, L)
	do
		append(This, [X], Next)
	).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% checkSqare(SquareStruct):- Check whether the 2-dimensional array SquareStruct 
%     is a valid solution to the Number-magic square problem.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

checkSqare(SquareStruct):-
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%writeln(checkSquare),
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	

	dim(SquareStruct, [N,N]),


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%Flaten SquareStruct into a one-dimensional array 
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	dim(SquareStruct, [N,N]),
	N_Square is N*N,
	dim(FlatSquareStruct, [N_Square]),
	(
		foreachelem(X, SquareStruct),
		foreachelem(X, FlatSquareStruct)
	  do
		true
	),




	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%Convert the one-dimensional array into a list
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	aToL(FlatSquareStruct, FlatList),


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Check to make sure all the values in the flat list are different
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	checkAllDifferent(FlatList),
	writeln(FlatList),
	writeln(done:all_values_are_different),




	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% check to make sure each row sums up to N*(N*N+1)/2
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	checkRowSums(SquareStruct),
	writeln(done:all_rows_summed_up_correctly),


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Get the transpose of SquareStruct and ten check to rows of it
	% to make sure each original sums up to N*(N*N+1)/2
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	transpose(SquareStruct, TSquareStruct),
	checkRowSums(TSquareStruct),
	writeln(done:done:all_columns_summed_up_correctly),


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% check to make sure each diagonal sums up to N*(N*N+1)/2
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	checkDiagonalSums(SquareStruct).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% checkAllDifferent(X):- True if all in the list are different
% Sorting the lists becasue if duplicates, it will consolidate
% and shorten the length of the list. If the original and sorted are the same, 
% there are no duplicates.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
checkAllDifferent(X):- 
    sort(X, Sorted),
    length(X, OriginalLength),
    length(Sorted, SortedLength),
    OriginalLength == SortedLength.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% checkRowSums(SquareStruct):- check to make sure each row sums up to N*(N*N+1)/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
checkRowSums(SquareStruct):- checkRow(SquareStruct, 0).
checkRow([Row|R], Sum) :- 
	rowSum(Row, Sum), 
	checkRowSums(R, Sum).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% checkDiagonalSums(SquareStruct):-
% check to make sure each diagonal sums up to N*(N*N+1)/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
checkDiagonalSums(SquareStruct):- checkDiag(SquareStruct, _, _, []).
checkDiag([Row|R], Index, P, [X|ListDiag]) :-
	nth1(Index, Row, X),
	IndexL is Index+P,
	checkDiag(R, IndexL, P, ListDiag).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% transpose(Matrix, Transpose) :-
%     Transpose is a transpose of the matrix Matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
transpose(Matrix, Transpose) :-
    dim(Matrix,[R,C]),
    dim(Transpose,[C,R]),
    ( foreachelem(El,Matrix,[I,J]),
      param(Transpose)
    do
      subscript(Transpose,[J,I],El)
    ).
