unico(L,U) :- append(Pref,[U|Suf],L), not(member(U,Pref)), not(member(U,Suf)).

%hayUnRepetido(+L)
hayUnRepetido(L) :- member(U,L), not(unico(L,U)).

sinRepetidos(L) :- not(hayUnRepetido(L)).

formula(VS,F) :- desde(1,N), formulasDeTamano(VS,F,N).

%formulasDeTamano(+VS,-F,+N)
formulasDeTamano(VS,F,1) :- member(F,VS).
formulasDeTamano(VS,neg(F),N) :- N > 1, N1 is N-1, formulasDeTamano(VS,F,N1).
formulasDeTamano(VS,imp(FP,FQ),N) :- N > 2, N1 is N-1,
    between(1,N1,NP), NQ is N1-NP, 
    formulasDeTamano(VS,FP,NP), formulasDeTamano(VS,FQ,NQ).

formula/2 no es reversible en F porque desde/2 nunca deja de generar nuevos valores
para N. Por lo tanto, si bien eventualmente se instancia el tamaño de F en N y se tiene
éxito en formulasDeTamano/3, el predicado jamás termina.