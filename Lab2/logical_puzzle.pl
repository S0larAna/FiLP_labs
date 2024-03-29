% Вариант № 2. Три подруги вышли в белом, зеленом и синем платьях и туфлях.
  %Известно, что только у Ани цвета платья и туфлей совпадали. Ни туфли, ни платье Вали не
  %были белыми. Наташа была в зеленых туфлях. Определить цвета платья и туфель на каждой
  %из подруг.

girlfriends:-
    member(AnyaDress, [white, green, blue]),
    member(AnyaShoes, [white, green, blue]),
    member(ValyaDress, [white, green, blue]),
    member(ValyaShoes, [white, green, blue]),
    member(NatashaDress, [white, green, blue]),
    member(NatashaShoes, [white, green, blue]),

    AnyaDress = AnyaShoes,

    ValyaDress \= white,
    ValyaShoes \= white,

    NatashaShoes = green,

    AnyaDress \= ValyaDress, AnyaDress \= NatashaDress,
    ValyaDress \= NatashaDress,
    AnyaShoes \= ValyaShoes, AnyaShoes \= NatashaShoes,
    ValyaShoes \= NatashaShoes,

    Girlfriends = [[anya, AnyaDress, AnyaShoes], [valya, ValyaDress, ValyaShoes, [natasha, NatashaDress, NatashaShoes]]],
    write(Girlfriends).

% Вариант 2. Пятеро детей Алик, Боря, Витя, Лена и Даша приехали в лагерь из 5
  %разных городов: Харькова, Умани, Полтавы, Славянска и Краматорска. Есть 4
  %высказывания: 1) Если Алик не из Умани, то Боря из Краматорска. 2) Или Боря, или Витя
  %приехали из Харькова. 3) Если Витя не из Славянска, то Лена приехала из Харькова. 4) Или
  %Даша приехала из Умани, или Лена из Краматорска. Кто откуда приехал?
summer_camp :-

    Cities = [kharkiv, uman, poltava, slavyansk, kramatorsk],

    member(Alik, Cities),
    member(Borya, Cities),
    member(Vitya, Cities),
    member(Lena, Cities),
    member(Dasha, Cities),

    all_different([Alik, Borya, Vitya, Lena, Dasha]),

    (Alik \= uman ; Borya = kramatorsk),

    (Borya = kharkiv ; Vitya = kharkiv),

    (Vitya \= slavyansk ; Lena = kharkiv),

    (Dasha = uman ; Lena = kramatorsk),
    Camp = [[alik, Alik], [borya, Borya], [vitya, Vitya], [lena, Lena], [dasha, Dasha]],
    write(Camp).

all_different([]).
all_different([H|T]) :- member(H, T), !, fail.
all_different([_|T]) :- all_different(T).



