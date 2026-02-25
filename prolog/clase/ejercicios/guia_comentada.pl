% =============================================================================
% GUÍA DE PROLOG - COMENTADA
% =============================================================================

% -----------------------------------------------------------------------------
% NATURALES EN NOTACIÓN DE PEANO
% -----------------------------------------------------------------------------

natural(0).                           % Caso base: 0 es natural
natural(suc(X)) :- natural(X).        % Inductivo: suc(X) es natural si X lo es

% -----------------------------------------------------------------------------
% EJ 3: MENOR O IGUAL (versión reversible)
% -----------------------------------------------------------------------------

% VERSIÓN INCORRECTA (no reversible en Y):
% menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).  % Regla recursiva primero → loop
% menorOIgual(X,X) :- natural(X).               % Caso base después → nunca llega

% VERSIÓN CORRECTA (reversible):
menorOIgual(X,X) :- natural(X).               % Caso base PRIMERO: X ≤ X
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).  % Recursivo: X ≤ suc(Y) si X ≤ Y

% CLAVE: El caso base debe ir PRIMERO para generar soluciones antes de recursar

% -----------------------------------------------------------------------------
% EJ 4: JUNTAR (append casero)
% -----------------------------------------------------------------------------

juntar([],L,L).                               % [] ++ L = L
juntar([H1|T1],L,[H1|T2]) :- juntar(T1,L,T2). % [H|T] ++ L = [H | (T ++ L)]

% -----------------------------------------------------------------------------
% EJ 5: OPERACIONES CON LISTAS
% -----------------------------------------------------------------------------

% i. LAST - último elemento de la lista
last([X], X).                                 % Caso base: lista de 1 elemento
last(L, X) :- append(H,XS,L),                 % Dividir L en H y XS
              length(H,1),                    % H tiene 1 elemento (el primero)
              last(XS, X).                    % Buscar último en XS

% ii. REVERSE - invertir lista
reverse([], []).                              % Caso base: [] invertido es []
reverse(XS, YS) :-
      length(H,1),                            % H es lista de 1 elemento
      append(H,L1,XS),                        % XS = H ++ L1 (separar cabeza)
      reverse(L1, L2),                        % L2 = reverse(L1)
      append(L2,H,YS).                        % YS = L2 ++ H (cabeza al final)

% CLAVE: reverse(L1,L2) ANTES de append(L2,H,YS) para instanciar L2

% vi. PERTENECE - member casero
pertenece(X, [X]).                            % X está en [X]
pertenece(X, XS) :- append([X],_,XS).         % X está al principio de XS
pertenece(X, XS) :- length(H,1),              % H es lista de 1 elemento
                    append(H,L,XS),           % XS = H ++ L (instancia H)
                    H \= [X],                 % H no es [X] (X no es primero)
                    pertenece(X, L).          % Buscar X en L

% CLAVE: append(H,L,XS) ANTES de H \= [X] para instanciar H

% -----------------------------------------------------------------------------
% EJ 6: APLANAR - convertir lista anidada en plana
% -----------------------------------------------------------------------------

aplanar([], []).                              % Lista vacía → vacía
aplanar([[]], []).                            % Lista con lista vacía → vacía
aplanar([X], [X]) :- X \= [], X \= [_|_].     % X es átomo (no lista) → [X]
aplanar([[H|T]], L) :- aplanar([H|T], L).     % [[...]] → quitar un nivel de anidamiento
aplanar(XS, L) :-
    length(XS, Z), Z > 1,                     % XS tiene más de 1 elemento
    append(H,T,XS),                           % XS = H ++ T
    length(H,1),                              % H tiene 1 elemento
    aplanar(H, HAplanada),                    % Aplanar H
    aplanar(T, TAplanada),                    % Aplanar T
    append(HAplanada,TAplanada,L).            % L = HAplanada ++ TAplanada

% -----------------------------------------------------------------------------
% EJ 7: INTERSECCIÓN sin duplicados
% -----------------------------------------------------------------------------

% Predicado auxiliar: sacar todas las ocurrencias de X de una lista
sacar(_, [], []).                             % Nada que sacar de lista vacía
sacar(X, [X|T], L) :- sacar(X, T, L).         % X es cabeza → no incluir, seguir
sacar(X, [H|T], [H|L]) :- X \= H,             % H no es X → incluir H
                          sacar(X, T, L).     % Seguir con T

% Intersección: elementos comunes, sin repeticiones, respetando orden de L1
interseccion([], _, []).                      % Caso base: L1 vacía → vacío
interseccion([X|L1], L2, [X|L3]) :-           % X está en L2:
    member(X, L2),                            %   - Verificar que X ∈ L2
    sacar(X, L1, L1SinX),                     %   - Sacar X de L1 (evita duplicados)
    interseccion(L1SinX, L2, L3).             %   - Continuar sin X

interseccion([X|L1], L2, L3) :-               % X NO está en L2:
    not(member(X, L2)),                       %   - Verificar que X ∉ L2
    interseccion(L1, L2, L3).                 %   - Continuar sin agregar X

% CLAVE: sacar(X, L1, ...) evita que X aparezca múltiples veces en resultado

% -----------------------------------------------------------------------------
% EJ: PARTIR lista en dos partes
% -----------------------------------------------------------------------------

partir(N, L, L1, L2) :-
    append(L1,L2,L),                          % L = L1 ++ L2
    length(L1,N).                             % L1 tiene N elementos

% REVERSIBILIDAD: Funciona con casi cualquier combinación de argumentos
% excepto cuando L está libre y al menos uno de L1/L2 también

% -----------------------------------------------------------------------------
% EJ: PERMUTACIÓN
% -----------------------------------------------------------------------------

permutación([], []).                          % Caso base: [] es permutación de []
permutación([H|T], L2) :-
    length([H|T], N),                         % L1 tiene N elementos
    length(L2, N),                            % L2 también (evita infinitas opciones)
    append(LA, [H|LB], L2),                   % H está en algún lugar de L2
    append(LA, LB, L3),                       % L3 = L2 sin H
    permutación(T, L3).                       % T es permutación de L3

% CLAVE: length(L2, N) ANTES de append para restringir L2

% -----------------------------------------------------------------------------
% EJ: SACAR DUPLICADOS
% -----------------------------------------------------------------------------

sacarDuplicados([], []).                      % Caso base: lista vacía
sacarDuplicados([H|T], [H|L3]) :-
    sacar(H, T, T1),                          % T1 = T sin ocurrencias de H
    sacarDuplicados(T1, L3).                  % Continuar con T1

% CLAVE: Al tomar H, sacarlo del resto para que no se repita

% -----------------------------------------------------------------------------
% EJ: REPARTO en N listas (pueden ser vacías)
% -----------------------------------------------------------------------------

reparto(L, 1, [L]).                           % Caso base: N=1 → [L]
reparto(L, N, [L1|LListas]) :-
    N >= 1,                                   % N debe ser al menos 1
    append(L1, L2, L),                        % L = L1 ++ L2
    N1 is N - 1,                              % Decrementar N
    reparto(L2, N1, LListas).                 % Repartir L2 en N-1 listas

% NOTA: L1 puede ser vacía (genera muchas soluciones)

% -----------------------------------------------------------------------------
% EJ: REPARTO SIN VACÍAS (N variable, listas no vacías)
% -----------------------------------------------------------------------------

repartoSinVacías([], []).                     % Caso base: lista vacía → 0 listas
repartoSinVacías(L, [L1|LListas]) :-
    append(L1, L2, L),                        % L = L1 ++ L2
    L1 = [_|_],                               % L1 no vacía (al menos 1 elemento)
    repartoSinVacías(L2, LListas).            % Continuar con L2

% CLAVE: L1 = [_|_] filtra las divisiones donde L1 sería vacía

% -----------------------------------------------------------------------------
% EJ 8: PARTE QUE SUMA (subconjunto que suma S)
% -----------------------------------------------------------------------------

parteQueSuma([], 0, []).                      % Caso base: suma 0 con lista vacía
parteQueSuma([H|T], S, [H|P]) :-              % TOMAR H:
    S1 is S - H,                              %   - Nueva suma objetivo = S - H
    S1 >= 0,                                  %   - S1 no puede ser negativo
    parteQueSuma(T, S1, P).                   %   - Buscar P en T que sume S1
parteQueSuma([_|T], S, P) :-                  % NO TOMAR H:
    parteQueSuma(T, S, P).                    %   - Buscar P en T que sume S

% CLAVE: Cada elemento se considera una vez (tomarlo o no), sin permutar
