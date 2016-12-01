animal(grizzlybear).
animal(moose).
animal(seal).
animal(zebra).

place(circus).
place(rockband).
place(spaceship).
place(train).

solve :-
	animal(JoanneAnimal), animal(LouAnimal), animal(RalphAnimal), animal(WinnieAnimal),
	all_different([JoanneAnimal, LouAnimal, RalphAnimal, WinnieAnimal]),
	
	place(JoannePlace), place(LouPlace), place(RalphPlace), place(WinniePlace),
	all_different([JoannePlace, LouPlace, RalphPlace, WinniePlace]),

	Triples = [ [joanne, JoanneAnimal, JoannePlace],
		  [lou, LouAnimal, LouPlace],
		  [ralph, RalphAnimal, RalphPlace],
		  [winnie, WinnieAnimal, WinniePlace] ],
	% 1.
	\+ member([joanne, seal, _],Triples),
	\+ member([lou, seal, _],Triples),
	\+ member([_, seal, spaceship],Triples),
	\+ member([_, seal, train],Triples),

	% 2. 
	\+ member([joanne, grizzlybear, _],Triples),
	   member([joanne, _, circus],Triples),

	% 3.
	   member([winnie, zebra, _], Triples),

	% 4.
	\+ member([_, grizzlybear, spaceship],Triples),	

	tell(joanne, JoanneAnimal, JoannePlace),
	tell(lou, LouAnimal, LouPlace),
	tell(ralph, RalphAnimal, RalphPlace),
	tell(winnie, WinnieAnimal, WinniePlace).

	all_different([H | T]) :- member(H, T), !, fail.
	all_different([_ | T]) :- all_different(T).
	all_different([_]).

	tell(X, Y, Z) :-
    	  write(X), write(' took the '), write(Y),
    	  write(' to the '), write(Z), write('.'), nl.
