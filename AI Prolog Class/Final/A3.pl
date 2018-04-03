% Thank - then = gnar

% Thank - then = gnar is the same as gnar + then = thank. 
% so I wrote it using addition as the operator for the words.
gnar(List):-                                 
    List = [G,N,A,R,T,H,E,K],                 
    List :: 0..9,                             
    diff_list(List),                     
				 1000*G + 100*N + 10*A + R
               + 1000*T + 100*H + 10*E + N   
    $= 10000*T + 1000*H + 100*A + 10*N + K,   
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