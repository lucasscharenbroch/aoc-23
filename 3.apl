#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '3.input' 1

safe_exec ← {0=⍴⍵ : 0 ⋄ ⍎⍵}

neigh ← { (∨/⍤(∨/)(~(⎕D,'. ')∊⍨⊢)⌺3 3) ⍵ } ⍝ is a neighbor a symbol?
solve  ← { +/, ⍵ { ((∨/¨⍤⊆∘⍵) × (safe_exec¨⊆∘⍺)) ⍺∊⎕D }⍤1 neigh ⍵ }

⎕ ← solve ↑input

⍝ replace chars in ⍵ with the numbers they represent (or 0)
s_to_n ← { (((⊃,/) (safe_exec¨⊆∘⍵) × (⊢⊆⊢)) ⍵∊⎕D)@(⍸⍵∊⎕D) ⊢ (≢⍵)⍴0 }⍤1
⍝ values of cells if they are '*'
vals ← { ({ (×/×(=∘2≢)) (⊢(/⍨)≠∘0) ⊃ ,/ ((⊢(/⍨)1∘⌽≠⊢),∘0)¨ ↓ ⍵ }⊢)⌺3 3 ⊢ s_to_n ⍵ }
solve2 ← +/⍤,  vals × '*'∘=

⎕ ← solve2 ↑input
