# Machete: Tipos y Términos

Las expresiones de tipos (o simplemente tipos) son

$$
\sigma : : = { \mathsf { B o o l } } \mid { \mathsf { N a t } } \mid \sigma \to \sigma
$$

Sea $\mathcal { X }$ un conjunto infinito enumerable de variables y $x \in \mathcal { X }$ . Los términos estan dados por

M := x|入x : σ.M|M M|true| false|if M then M else Mzero| succ(M)| pred(M)| isZero(M)

# Machete: Axiomas y reglas de tipado

「├ true : Bool T-True ├ false : Bool T-False

$$
\overline { { \Gamma , x : \sigma \vdash x : \sigma } } ^ { } ^ { } \overline { { \cal T } } \ l V a r
$$

$$
\frac { \Gamma \vdash M : \mathsf { B o o l } \quad \Gamma \vdash P : \sigma \quad \Gamma \vdash Q : \sigma } { \Gamma \vdash \mathsf { i f } M \ t h e n \ : P \ : \mathsf { e l s e } \ : Q : \sigma } \quad T . I f
$$

$$
\frac { \therefore \sigma vdash M : \tau } { : \sigma . M : \sigma  \tau } \ T . A b s \quad \frac { \Gamma \vdash M : \sigma  \tau \quad \Gamma } { \Gamma \vdash M \ : N : \tau }
$$

# Machete: Axiomas y reglas de tipado

# Machete: Semäntica operacional

V : = true | false | $\lambda x : \sigma . M \mid$ zero | succ(V)

(Los valores de tipo Nat pueden escribirse como $\underline { n }$ , lo cual abrevia succ"(zero)).

# Reglas de Evaluacion en un paso

Si $M _ { 1 }  M _ { 1 } ^ { \prime }$ , entonces $M _ { 1 } M _ { 2 }  M _ { 1 } ^ { \prime } M _ { 2 }$ (E-App1 O μ)Si $M _ { 2 }  M _ { 2 } ^ { \prime }$ , entonces $V M _ { 2 }  V M _ { 2 } ^ { \prime }$ (E-App2 0 ν)$( \lambda x : \sigma . M ) V \to M \{ x : = V \}$ (E-AppAbs 0 $\beta$ ）

# Machete: Semäntica operacional

# Reglas de Evaluacion en un paso

if true then $M _ { 2 }$ else $M _ { 3 }  M _ { 2 }$ (E-IfTrue)

if false then $M _ { 2 }$ else $M _ { 3 }  M _ { 3 }$ (E-IfFalse)

Si $M _ { 1 }  M _ { 1 } ^ { \prime }$ ， entoncesif $M _ { 1 }$ then $M _ { 2 }$ else $M _ { 3 }  \mathsf { i f } \ M _ { 1 } ^ { \prime }$ then $M _ { 2 }$ else $M _ { 3 }$

# Machete: Semäntica operacional

# Reglas de Evaluacion en un paso

<table><tr><td>pred(succ(n)) → n</td><td>(E-PredSucc)</td></tr><tr><td>Opcional*: pred(zero) -→ zero</td><td>(E-Predo)</td></tr><tr><td>isZero(zero) → true</td><td>(E-IsZeroo)</td></tr><tr><td>isZero(succ(n)) → false</td><td>(E-IsZeron)</td></tr><tr><td>Si M -&gt; N, entonces succ(M) -→ succ(N)</td><td>(E-Succ)</td></tr><tr><td>Si M → N, entonces pred(M) → pred(N)</td><td>(E-Pred)</td></tr><tr><td>Si M →→ N, entonces isZero(M) → isZero(N)</td><td>(E-IsZero)</td></tr></table>

\*lntroducir la regla $\mathsf { p r e d } _ { 0 }$ restaura la propiedad de Progreso,pero ya no modela los naturales tradicionales, sino una variante.

$$
M : : = \dots | \mu x : \tau . M
$$

$$
\frac { \Gamma , x : \sigma \vdash M : \sigma } { \Gamma \vdash \mu x : \sigma . M : \sigma } T . F i x
$$

$$
\mu x : \sigma . M  M \{ x : = \mu x : \sigma . M \} \quad ( E . F i x )
$$