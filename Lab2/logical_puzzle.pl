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