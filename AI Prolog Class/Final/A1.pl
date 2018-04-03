% Shine - than = knit is the same as knit + than = shine. 
% so I wrote it using addition as the operator for the words.
shine(List):-                                 
    List = [S,H,I,N,E,T,A,K],                 
    List :: 0..9,                             
    diff_list(List),                     
				 1000*K + 100*N + 10*I + T
               + 1000*T + 100*H + 10*A + N   
    $= 10000*S + 1000*H + 100*I + 10*N + E,                                  
    T $\= 0,
	K $\= 0,
    shallow_backtrack(List).

shallow_backtrack(List) :- 
    ( foreach(Var,List) do once(indomain(Var)) ).

% diff_list(List) :- 
%     List is a list of different variables.

diff_list(List) :-
    ( fromto(List,[X|Tail],Tail,[]) 
    do
      ( foreach(Y, Tail), 
        param(X) 
      do
        X $\= Y
      )
    ).

	
	

