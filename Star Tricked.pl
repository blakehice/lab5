day(tuesday).
day(wednesday).
day(thursday).
day(friday).

object(balloon).
object(clothesline).
object(frisbee).
object(watertower).

before(tuesday,wednesday).
before(wednesday,thursday).
before(thursday,friday).
earlier(X,Y):- before(X,Y).
earlier(X,Z) :- before(X,Y), earlier(Y,Z).

solve :-

	day(BarradaDay),day(GortDay),day(KlatuDay),day(NiktoDay),
	all_different([BarradaDay, GortDay, KlatuDay, NiktoDay]),
	
	object(BarradaObj),object(GortObj),object(KlatuObj),object(NiktoObj),
	all_different([BarradaObj, GortObj, KlatuObj, NiktoObj]),


	Triples = [[barrada, BarradaDay, BarradaObj],
		   [gort, GortDay, GortObj],
		   [klatu, KlatuDay, KlatuObj],
		   [nikto, NiktoDay, NiktoObj]],

	% 1.
	\+ member([gort, _, frisbee],Triples),
	(member([_, X, balloon], Triples), earlier(KlatuDay,X)),
	(member([_,Y,frisbee],Triples), earlier(Y,KlatuDay)),
	   
	% 2.
	(member([_, friday, clothesline],Triples) ; 
	member([barrada, friday, _],Triples) ; 
	member([barrada, friday, clothesline], Triples)),
	
	% 3.
	\+ member([nikto, tuesday, _],Triples),
	
	% 4.
	\+ member([klatu, _, watertower],Triples),

	tell(barrada, BarradaDay, BarradaObj),
	tell(gort, GortDay, GortObj),
	tell(klatu, KlatuDay, KlatuObj),
	tell(nikto, NiktoDay, NiktoObj).
	
	



	all_different([H | T]) :- member(H, T), !, fail.
	all_different([_ | T]) :- all_different(T).
	all_different([_]).

	tell(X, Y, Z) :-
    	  write(X), write(' saw the '), write(Z),
    	  write(' on '), write(Y), write('.'), nl.