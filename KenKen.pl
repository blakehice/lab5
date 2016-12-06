:- use_module(library(clpfd)).
solve :-
	
	% This is a verbose solution that will be improved upon.
	% Label each row as A..F.
	Puzzle = [A, B, C, D, E, F ],

	% Each row is made of 6 values.
	A = [A1, A2, A3, A4, A5, A6 ],
	B = [B1, B2, B3, B4, B5, B6 ],
	C = [C1, C2, C3, C4, C5, C6 ],
	D = [D1, D2, D3, D4, D5, D6 ],
	E = [E1, E2, E3, E4, E5, E6 ],
	F = [F1, F2, F3, F4, F5, F6 ],
	

	% Each column is also 6 values, using the variables from the rows.
	Co1 = [A1, B1, C1, D1, E1, F1 ],
	Co2 = [A2, B2, C2, D2, E2, F2 ],
	Co3 = [A3, B3, C3, D3, E3, F3 ],
	Co4 = [A4, B4, C4, D4, E4, F4 ],
	Co5 = [A5, B5, C5, D5, E5, F5 ],
	Co6 = [A6, B6, C6, D6, E6, F6 ],

	% "ins" forces each element of a list to be in a particular range.
	% It is part of "constraint logic programming".
	A ins 1..6,
	B ins 1..6,
	C ins 1..6,
	D ins 1..6,
	E ins 1..6,
	F ins 1..6,

	
	% All items in a row must be different.
	all_different(A),
	all_different(B),
	all_different(C),
	all_different(D),
	all_different(E),
	all_different(F),
	
	% All items in a column must be different.
	all_different(Co1),
	all_different(Co2),
	all_different(Co3),
	all_different(Co4),
	all_different(Co5),
	all_different(Co6),
	

	(A1 + B1 + B2 + B3 + C3 #= 24),
	(A2 - A3 #= 1 ; A3 - A2 #= 1),
	(A4 // A5 #= 2 ; A5 // A4 #= 2),
	(A6 * B6 * B5 * B4 * C4 #= 72),
	(C1 + D1 + D2 #= 14),
	(C2 #= 5),
	(C5 #= 2),
	(C6 * D6 * D5 #= 18),
	(D3 * D4 * E3 * E4 #= 60),
	(E1 * F1 #= 3),
	(E2 + F2 + F3 + F4 + F5 + E5 #= 22),
	(E6 - F6 #= 1 ; F6 - E6 #= 1),
	
	label(A),
	label(B),
	label(C),
	label(D),
	label(E),
	label(F),

	write(Puzzle).







