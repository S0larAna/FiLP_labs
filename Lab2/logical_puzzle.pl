girlfriends:-
    % Define possible colors
    member(AnyaDress, [white, green, blue]),
    member(AnyaShoes, [white, green, blue]),
    member(ValyaDress, [white, green, blue]),
    member(ValyaShoes, [white, green, blue]),
    member(NatashaDress, [white, green, blue]),
    member(NatashaShoes, [white, green, blue]),

    % Only Anna had the same color of dress and shoes
    AnyaDress = AnyaShoes,

    % Neither Valya's dress nor shoes were white
    ValyaDress \= white,
    ValyaShoes \= white,

    % Natasha had green shoes
    NatashaShoes = green,

    % Each girl has a different color of dress and shoes
    AnyaDress \= ValyaDress, AnyaDress \= NatashaDress,
    ValyaDress \= NatashaDress,
    AnyaShoes \= ValyaShoes, AnyaShoes \= NatashaShoes,
    ValyaShoes \= NatashaShoes,

    Girlfriends = [[anya, AnyaDress, AnyaShoes], [valya, ValyaDress, ValyaShoes, [natasha, NatashaDress, NatashaShoes]]],
    write(Girlfriends).

summer_camp :-
    % Определяем список городов
    Cities = [kharkiv, uman, poltava, slavyansk, kramatorsk],

    member(Alik, Cities),
    member(Borya, Cities),
    member(Vitya, Cities),
    member(Lena, Cities),
    member(Dasha, Cities),

    all_different([Alik, Borya, Vitya, Lena, Dasha]),

    % Условие 1: Если Алик не из Умани, то Боря из Краматорска
    (Alik \= uman ; Borya = kramatorsk),

    % Условие 2: Или Боря, или Витя приехали из Харькова
    (Borya = kharkiv ; Vitya = kharkiv),

    % Условие 3: Если Витя не из Славянска, то Лена приехала из Харькова
    (Vitya \= slavyansk ; Lena = kharkiv),

    % Условие 4: Или Даша приехала из Умани, или Лена из Краматорска
    (Dasha = uman ; Lena = kramatorsk),
    Camp = [[alik, Alik], [borya, Borya], [vitya, Vitya], [lena, Lena], [dasha, Dasha]],
    write(Camp).

all_different([]).
all_different([H|T]) :- member(H, T), !, fail.
all_different([_|T]) :- all_different(T).



