in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

permutate(Alphabet, Length, Perm) :- permutate(Alphabet, Length, Length, [], Perm).
permutate(_, Length, 0, Perm, Perm) :- !.
permutate(Alphabet, Length, CurLength, CurPerm, Perm) :- in_list(Alphabet, El), NextLength is CurLength - 1,
    permutate(Alphabet, Length, NextLength, [El|CurPerm], Perm).

comb(0,_,[]).
comb(N,[X|T],[X|Comb]):-N>0,N1 is N - 1,comb(N1,T,Comb).
comb(N,[_|T],Comb):-N>0,comb(N,T,Comb).

make_3a_empty_word(K, K, _, []):-!.
make_3a_empty_word(K, CurIndex, [NewIndex|PosTail], [a|Tail]) :-
	NewIndex is CurIndex + 1, make_3a_empty_word(K, NewIndex, PosTail, Tail),!.
make_3a_empty_word(K, CurIndex, PosList, [_|Tail]) :-
	NewIndex is CurIndex + 1, make_3a_empty_word(K, NewIndex, PosList, Tail).

build_word([],[],_):-!.
build_word([a|WordTail],[X|WordEmpty3aTail],RestWord) :-
	nonvar(X),build_word(WordTail,WordEmpty3aTail,RestWord),!.
build_word([Y|WordTail],[X|WordEmpty3aTail],[Y|RestWordTail]) :-
	var(X),build_word(WordTail,WordEmpty3aTail,RestWordTail).

make_pos_list(K, K, []):-!.
make_pos_list(K, CurK, [NewPos|TailPos]) :- NewPos is CurK + 1, make_pos_list(K, NewPos, TailPos).

make_3a_words(Alphabet, K, Res) :- make_pos_list(K, 0, PosList),
comb(3, PosList, PosForA), make_3a_empty_word(K, 0, PosForA, EmptyAWord),
M is K - 3, Alphabet = [a|NewAlphabet], permutate(NewAlphabet, M, RestOfTheWord),
build_word(Res, EmptyAWord, RestOfTheWord).



