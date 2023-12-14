#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '14.input' 1

col_solve ← {
    e i ← (⊂⍵≠'#') ⊆¨ ⍵ (⌽⍳≢⍵)
    +/ i { +/⍺↑⍨+/'O'=⍵ }¨ e
}

⎕ ← +/ col_solve¨ ↓⍉↑ input

col_tilt ← {
    e i ← (⊂⍵≠'#') ⊆¨ ⍵ (⍳≢⍵)
    n ← (+/'O'=⊢)¨ e
    (⊃ ,/ e {'O'@(⍳⍵) ⊢ '.'@(⍸⍺='O') ⊢ ⍺}¨ n)@(⊃ ,/ i) ⊢ ⍵
}

tilt_north ← ⍉⍤↑ (col_tilt¨ ↓⍤⍉)
tilt4 ← (⌽⍤⍉tilt_north)⍣4 ⍝ nwse
score ← +/⍤, ((⌽⍳⍤≢)×('O'=⊢))⍤1⍤⍉

score_billionth ← { ⍝ ⍺=grids, ⍵=cycle-start
    cyc_len ← (≢⍺) - (⍵-1)
    i ← 1 + cyc_len | (1E9) - ⍵ ⍝ zero-indexed
    score ⊃ ⍺[⍵ + i]
}

solve ← {
    ⍺ ← ⍬
    ∨/ (m ← (⍵∘≡)¨ ⍺) : ⍺ score_billionth ⍸m
    (⍺,⊂⍵) solve tilt4 ⍵
}

⎕ ← solve ↑input
