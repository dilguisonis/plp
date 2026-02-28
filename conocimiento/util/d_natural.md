# Deducci´on Natural

# L´ogica Intuicionista

Reglas B´asicas

$$
\begin{array} { c } { { \displaystyle \frac { \Gamma \vdash \tau \quad \Gamma \vdash \sigma } { \Gamma \vdash \tau \wedge \sigma } \wedge _ { i } } } \\ { { \mathrm { } } } \\ { { \displaystyle \frac { \Gamma \vdash \tau \wedge \sigma } { \Gamma \vdash \tau } \wedge _ { e _ { 1 } } \qquad \frac { \Gamma \vdash \tau \wedge \sigma } { \Gamma \vdash \sigma } \wedge _ { e _ { 2 } } } } \end{array}
$$

$$
\begin{array} { c } { { \frac { \Gamma , \tau \vdash \sigma } { \Gamma \vdash \tau \Rightarrow \sigma } \Rightarrow _ { i } } } \\ { { } } \\ { { \frac { \Gamma \vdash \tau \Rightarrow \sigma \quad \Gamma \vdash \tau \Rightarrow _ { e } } { \Gamma \vdash \sigma } \quad \Rightarrow _ { e } } } \end{array}
$$

$$
\begin{array} { r l } & { \frac { \Gamma \vdash \tau } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 1 } } \quad \frac { \Gamma \vdash \sigma } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 2 } } } \\ & { \underline { { \Gamma \vdash \tau \lor \sigma } } \quad \Gamma , \tau \vdash \rho \quad \Gamma , \sigma \vdash \rho } \\ & { \quad \quad \quad \Gamma \vdash \rho } \end{array}
$$

$$
\begin{array} { c } { \frac { \Gamma , \tau \vdash \bot } { \Gamma \vdash \lnot } \lnot _ { i } } \\ { \frac { \Gamma \vdash \ l \tau \ l } { \Gamma \vdash \ l \textsc { i } } \lnot _ { e } } \end{array}
$$

Reglas Derivadas

$$
\frac { \Gamma \vdash \tau } { \Gamma \vdash \lnot \lnot \tau } \lnot \lnot \lnot _ { i }
$$

$$
\frac { \ \Gamma \vdash \tau \Rightarrow \sigma \quad \Gamma \vdash \neg \sigma } { \Gamma \vdash \neg \tau } M T
$$

L´ogica Cl´asica

Regla B´asica

$$
\frac { \Gamma \vdash \lnot \lnot \tau } { \Gamma \vdash \tau } \lnot \lnot \lnot e
$$