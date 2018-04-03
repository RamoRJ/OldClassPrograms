:- lib(ic).

solve(Coins, Min) :-
	init_vars(Values, Coins),
	coin_cons(Values, Coins, Pockets),
	Min #= sum(Coins),
	minimize((labeling(Coins), check(Pockets)), Min).

init_vars(Values, Coins) :-
	Values = [1,2,3,6,12,25],
	length(Coins, 6),
	Coins :: 0..99.

coin_cons(Values, Coins, Pockets) :-
	( for(Price,1,99),
	foreach(CoinsforPrice,Pockets),
	param(Coins,Values)
  do
	price_cons(Price, Coins, Values, CoinsforPrice)
	).

price_cons(Price, Coins, Values, CoinsforPrice) :-
	( foreach(V,Values),
	foreach(C,CoinsforPrice),
	foreach(Coin,Coins),
	foreach(Prod,ProdList)
  do
	Prod = V*C,
	0 #=< C,
	C #=< Coin
	),
	Price #= sum(ProdList).

check(Pockets) :-
	( foreach(CoinsforPrice,Pockets)
  do
	once(labeling(CoinsforPrice))
	).