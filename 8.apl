#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '8.input' 1

aaa ← 1
zzz ← 26*3
moves ← ⊃ input
ind lr ← ↓⍉((⊂1∘↑),(⊂1∘↓))⍤1(1+26⊥¯1+⎕A∘⍳)¨↑(⊢⊆⍨(~∊∘'=(,) '))¨2↓input
table ← lr@(,↑ind) ⊢ (zzz+1)⍴0

lookup ← { (1+⍺≡'R')⌷⊃table[⍵] }
solve ← { ⍝ ⍺⍺=verification-func ⍺=accumulator, ⍵=current-table-index
    ⍺ ← 0
    ⍺⍺ ⍵ : ⍺
    (⍺+≢moves) ∇ lookup¨/ (⌽moves),⍵
}

⎕ ← (≡∘zzz solve) aaa

__a ← 1+ (⊢(/⍨)(0=26|⊢)) ⊢ ,↑ind-1
__z ← 1+ (⊢(/⍨)(25=26|⊢)) ⊢ ,↑ind-1

⎕PP ← 30
⎕ ← ∧/ ((∨/∊∘__z) solve)¨ __a
