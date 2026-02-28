Sean σ = ∃X.(P(X)=>∀Y.P(Y)), Γ = ¬∀Y.P(Y), ¬P(X), P(X)

_ax _De Morgan 2 ∀Y.P(Y), P(X) ⊢ ∀Y.P(Y) ⊢ ¬∀Y.P(Y) ⇔ ∃X.¬P(X) _⇒i _∧e1 ∀Y.P(Y) ⊢ P(X)=>∀Y.P(Y) ⊢ ¬∀Y.P(Y) ⇒ ∃X.¬P(X) _LEM _∃i ⇒i-1 ⊢ ∀Y.P(Y) ∨ ¬∀Y.P(Y) ∀Y.P(Y) ⊢ σ ¬∀Y.P(Y) ⊢ ∃X.¬P(X) \* (abajo) _∃e ¬∀Y.P(Y) ⊢ σ _∨e

\* _ax _ax   
Γ ⊢ P(X) Γ ⊢¬P(X) ¬e Γ ⊢ ⊥ ⊥e Γ ⊢ ∀Y.P(Y) ⇒ i   
¬∀Y.P(Y), ¬P(X) ⊢ P(X)=>∀Y.P(Y) _∃i   
¬∀Y.P(Y), ¬P(X) ⊢ σ