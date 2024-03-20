%consult("C:\\Users\\bodya\\уник\\prolog\\FiLP_labs\\Lab1\\1.pl").

main :-
    retractall(asked(_,_)),
    instrument(Question),
    !,
    nl,
    write('My guess is '), write(Question), write(.), nl.
main :-
    nl,
    write('The musical instrument cannot be recognized.'), nl.

question(string) :-
    query('Is this a string instrument?').

question(bow) :-
    query('Do musicians generally use a bow to play this instrument?').

question(bass_clef) :-
    query('Is the music for this instrument generally written in the bass clef?').

question(small) :-
    query('Is it a small instrument?').

question(soprano) :-
    query('Is it a soprano instrument?').

question(pluck) :-
    query('Is this instrument plucked?').

question(african_origin) :-
    query('Does this instrument originate from Africa?').

question(hawaii_origin) :-
    query('Does this instrument originate from Hawaii?').

question(pick) :-
    query('Can you produce sound using a pick with this instrument?').

question(acoustic) :-
    query('Is this an acoustic instrument').

question(electric) :-
    query('Is this an electric instrument?').

question(low_pitch) :-
    query('Is it a low-pitched instrument?').

question(middle_ages) :-
    query('Was this instrument invented during Middle Ages?').

question(greek) :-
    query('Is this a Greek instrument?').

question(tenor_violin) :-
    query('Is this a tenor instrument?').

question(large) :-
    query('Is this a large instrument?').

question(woodwind) :-
    query('Is is a woodwind instrument?').

question(bag) :-
    query('Is this instrument placed in a bag?').

question(woodwind) :-
    query('Is is a woodwind instrument?').

question(brass) :-
    query('Is this a brass instrument?').

question(jazz) :-
    query('Is this instrument used in jazz music?').

question(curved) :-
    query('Is this a curved instrument?').

question(russian_origin) :-
    query('Does this instrument originate from russia').

question(folk) :-
    query('Is this instrument used to play folk music?').

question(triangular) :-
    query('Does this instrument have a triangular shape?').

question(single_reed) :-
    query('Does this instrument have a single reed?').

question(tubular) :-
    query('Does this instrument have a tubular shape?').

question(percussion) :-
    query('Is this a percussion instrument?').

question(cows) :-
    query('Is this instrument related to cows?').

question(keyboard) :-
    query('Does this instrument have a keyboard?').

question(mallets) :-
    query('Is this instrument played using mallets?').

question(round) :-
    query('Does this instrument have a round shape?').

question(drumsticks) :-
    query('Is this instrument played using drumsticks?').

question(high_pitch) :-
    query('Is this instrument high-pitched?').

question(jingles) :-
    query('Does this instrument have jingles?').

question(pedals) :-
    query('Does this instrument have pedals?').

question(collection) :-
    query('Is this a collection of instruments?').

instrument(tuba) :-
    question(brass),
    question(jazz),
    question(large),
    question(curved),
    question(bass_clef),
    question(single_reed).

instrument(cello) :-
    question(string),
    question(bow),
    question(bass_clef),
    question(violoncello).

instrument(violin) :-
    question(string),
    question(bow),
    question(small),
    question(sopano).

instrument(banjo) :-
    question(string),
    question(pluck),
    question(african_origin),
    question(country_music).

instrument(ukulele) :-
    question(string),
    question(hawaii_origin),
    question(pluck).

instrument(acoustic_guitar) :-
    question(string),
    question(pluck),
    question(pick),
    question(acoustic).

instrument(electric_guitar) :-
    question(string),
    question(pluck),
    question(pick),
    question(electric).

instrument(electric_bass_guitar) :-
    question(string),
    question(pluck),
    question(pick),
    question(electric),
    question(bass_clef).

instrument(lute) :-
    question(string),
    question(pluck),
    question(middle_ages).

instrument(lyre) :-
    question(string),
    question(pluck),
    question(greek).

instrument(viola) :-
    question(string),
    question(bow),
    question(tenor_violin).

instrument(double_bass) :-
    question(string),
    question(bow),
    question(bass_clef),
    question(large).

instrument(acoustic_bass_guitar) :-
    question(string),
    question(large),
    question(bass_clef),
    question(pick),
    question(pluck).

instrument(bagpipe) :-
    question(woodwind),
    question(bag).

instrument(horn) :-
    question(brass),
    question(jazz),
    question(curved).

instrument(bassoon) :-
    question(woodwind),
    question(bass_clef),
    question(curved).

instrument(bayan) :-
    question(button),
    question(folk),
    question(russian_origin).

instrument(balalaika) :-
    question(string),
    question(folk),
    question(triangular),
    question(russian_origin).

instrument(clarinet) :-
    question(woodwind),
    question(single_reed).

instrument(trumpet) :-
    question(brass),
    question(jazz).

instrument(french_horn) :-
    question(brass),
    question(curved).

instrument(pipe) :-
    question(woodwind),
    question(tubular).

instrument(saxophone) :-
    question(brass),
    question(jazz),
    question(curved),
    question(single_reed).

instrument(flute) :-
    question(woodwind),
    question(multiple_reeds).

instrument(cowbell) :-
    question(percussion),
    question(cows).

instrument(marimba) :-
    question(percussion),
    question(keyboard),
    question(mallets).

instrument(piano) :-
    question(keyboard),
    question(pedals).

instrument(tambourine) :-
    question(percussion),
    question(round),
    question(jingles).

instrument(triangle) :-
    question(percussion),
    question(triangular),
    question(stick).

instrument(xylophone) :-
    question(percussion),
    question(keyboard),
    question(high_pitch),
    question(mallets).

instrument(drum_kit) :-
    question(percussion),
    question(collection),
    question(drumsticks).

instrument(harp) :-
    question(string),
    question(pluck),
    question(large),
    question(triangular).

check_if_categorical(Prompt, Reply) :- ((Prompt == string, Reply==y) -> (asked(brass, n), asked(percussion, n), asked(woodwind, n))),
((Prompt==brass, Reply==y) -> (asked(string, n), asked(percussion, n), asked(woodwind, n))),
((Prompt == percussion, Reply==y) -> (asked(string, n), asked(brass, n), asked(woodwind, n))),
((Prompt==african_origin, Reply==y) -> (asked(hawaii_origin, n), asked(greek, n))),
((Prompt==hawaii_origin, Reply==y) -> (asked(greek, n)));true.

query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
        check_if_categorical(Prompt, Reply),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.
