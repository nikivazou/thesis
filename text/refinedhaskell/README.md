TODO
====

+ TIME TO CHECK INTO master

- how user specifies types? how well-formedness of such types is checked?

+ FIGURE 1 [ok]
  + expr, reft, type, env 
  + Banana definition up front: embedding: SUB -> VC
  + Add notation  `G |- t1 <: t`2    "A subtyping query"
  + Add Refinement `p ::= ...carefully restricted language...`
  + I think `p` would be better then `e` for refinements
  + (| x : (y:t1 -> t2) |) == true
  - [SKIP] What is T in "Basic Types" (again add `T :: = IntList | IntTree | ...`)

+ refinement-fin-wf [ok]
  + 2.4 STATE: refinements never return bottom (always t/f) refer to corollary in 4.2 
  + Add corollary in 4.2 (if type says fin/wnf then really fin/wnf)
  + Update WF_BASE in Fig 4 so refinements FIN-BOOL
  + THM 5: DO NOT call it preservation -- misleading -- just "soundness".
  ? 2.5? Explictly state that measures are over WNF/FIN (emp/len)

- denotations
  - Merge T-IMP into `[[ G |- e1 => e2 |]` (eliminate "B")
  - see dimitris' notes below 
  - CLEAN UP Sec 2.3 based on ABOVE

- singletons [ok]
  - x:{x≥0}, y:{y≥0} ⊢ {v≥0}≼{v>0} ON P2 -------> {v = y}
  - 2.1  (1) has {v = y+1} but previous query has {v >= 0}; should have {v = y}

Details
=======

refinement-fin-wf
-----------------

   2. "Denotation of a type" 
    we choose to define types so "p" must converge BUT other systems 
    (e.g. Halo allows it...)

In section 2: explain somewhere 2.4 that 
CRUCIAL: REFINEMENTS NEVER RETURN BOTTOM
  Is (Just bottom) a Div type or a Fin Type or what?
  2.4 is algorithmic, translation to VC
  STATE: in banana land, land of VCs, predicates never return bottom.

STATE: FIG 3 -- DON'T NEED TO WORRY ABOUT DIVERGENCE

UPDATE: WF_BASE in FIG 4 so refinements are BOOL-WNF

REFINEMENT-TERMINATES: Add a COROLLARY at the end of 4.2

THEOREM 5 -- NOT "preservation" but something else -- just soundness? -- 
drop "preservation", misleading.


denotations
-----------

Merge T-IMP and DENOTATIONS

3. Remove/flatten one D-SUB and T-IMP are split up by a new syntactic form 

    `G |- p1 => p2`

   do we REALLY need it? Can we just collapse the two D-SUB and T-IMP and 
   *GET RID OF* the above funny implication.
---


We don’t even *state* property which I assume is our gold standard!

            t1  is subtype of t2    iff   [[t1]] subset [[t2]]

and indeed the statement of denotation needs beefing up to take account
of open types.

 Maybe give sem for   `[[ t1 <= t2 ]]`
 `[[  {x:t|p} <= {y:t|p2} ]] = p => p2`
 `[[ G |- t1 <= t2 ]]  =  [[ G ]] => [[ t1 <= t2 ]]`


Dimitris' notes:

First, we had the discussion last time whether the 
"Semantic containment" of refinements corresponds 
to rule T-Imp. I thought it didn’t but I was wrong. 

In fact, let’s see:
 
A.      (e -> v then p1[v])   implies (e -> v then p2[v])  (Semantic containment)
 
VS.
 
B.      (e -> v then p1[v] implies p2[v])                  (What is actually used in rule T-Imp)

 
(A => B)
~~~~~~
Assume (e -> v) (H1) Assume p1[v] (H2). From (H2) it is also 
(e -> v then p1[v]). (H3). From (H3) and (A) we get: 
(e -> v then p2[v]). (H4). From (H1) + (H4) we get p2[v].
 
(B => A)
~~~~~~
Assume (e -> v then p1[v]). Assume (e -> v). Then p1[v], then (by B) p2[v] and hence 
also:  (e -> v then p2[v]).
 
Correct? If yes, this is very cool. I think basically we can
rewrite that part of the paper saying: “Look, ideally we would 
like to prove “A”. But look, we can simplify the statement 
equivalently and prove “B”. In fact we don’t even have to 
put (B) in rule T-Imp. 

We can let rule T-Imp use the *semantic* containment (A)
-- so that readers will not get confused -- and only when 
we prove that VC is sound go through the intermediate simpler
form (B).
 
What do you think?

--- Remove T-IMP, define a [[G |- e1 <: e2 ]] denotation and just use that instead.

   \denot{ Gamma |- e1 <: e2 }
   G |- e1 => e2   <<<<<<< goes away

T-IMP looks like a VC so its good to actually EXPLAIN that when we generate REAL
VC in section 4

