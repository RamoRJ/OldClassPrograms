% Think - then = knit

% Think - then = knit is the same as knit + then = think. 
% so I wrote it using addition as the operator for the words.
think(List):-                                 
    List = [K,N,I,T,H,E,K],                 
    List :: 0..9,                             
    diff_list(List),                     
				 1000*K + 100*N + 10*I + T
               + 1000*T + 100*H + 10*E + N   
    $= 10000*T + 1000*H + 100*I + 10*N + K,   
    K $\= 0,                                  
    T $\= 0,
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