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

question(boot_failure) :-
    query('Does the computer show boot failure').

question(bad_sector) :-
    query('Does the computer show bad sector error').

question(cannot_read) :-
    query('Does the computer show cannot read from specified device').

question(long_beep) :-
    query('Is there a long beep during bootup').

question(short_beep) :-
    query('Is there a short beep during bootup').

question(two_long_beeps) :-
    query('Are there two long beeps during bootup').

question(two_short_beeps) :-
    query('Are there two short beeps during bootup').

question(blank_display) :-
    query('Is there a blank display during bootup').

question(repeating_short_beeps) :-
    query('Are there repeating short beeps during bootup').

question(continuous_beeps) :-
    query('Is there a continuous beep during bootup').

question(no_beep) :-
    query('Is there a beep during bootup').

question(not_printing) :-
    query('Is there a question with printing').

question(missing_dots) :-
    query('Is there a missing character during printing').

question(non_uniform_printing) :-
    query('Is there uniform printing').

question(spread_ink) :-
    query('Is there spreading of ink during printing').

question(paper_jam) :-
    query('Is there a paper jam during printing').

question(out_of_paper) :-
    query('Is there out-of- paper error during printing').

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

instrument(tuba) :-
    question(brass),
    question(jazz),
    question(large),
    question(curved),
    question(bass_clef),
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

query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.
