#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '16.input' 1

new_dir ← {
    u d l r ← ⍵
    ' '≡⍺ : 0 0 0 0
    '.'≡⍺ : ⍵
    '-'≡⍺ : 1⌊0 0 (u+d+l) (u+d+r)
    '|'≡⍺ : 1⌊(l+r+u) (l+r+d) 0 0
    '/'≡⍺ : r l d u
    '\'≡⍺ : l r u d
}

grid ← ¯1⌽ ¯1⊖ (2+⍴↑input)↑ ↑input
dir ← (1@(⊂2 2 4)) ⊢ 0⍴⍨4,⍨⍴grid

solve ← {
    ⍺ ← 0⍴⍨⍴⍵
    0≡ ∨/ ,⍵ : +/ , ∨/ ⍺
    d1 ← (~⍺)∧ grid new_dir⍤(0 ¯2) ⊢ ⍵
    u d l r ← (⊂⍤2) 2 3 1⍉d1
    (⍺∨d1)∇ 3 1 2⍉ ↑ (1⊖u)(¯1⊖d)(1⌽l)(¯1⌽r)
}

⎕ ← solve dir

r c ← ⍴↑input
iu ← (1+r)∘,¨ 1+⍳c
id ← 2∘,¨ 1+⍳c
il ← ,∘(1+c)¨ 1+⍳r
ir ← ,∘2¨ 1+⍳r
u d l r ← (⊂1 0 0 0)(⊂0 1 0 0)(⊂0 0 1 0)(⊂0 0 0 1)
entry_dirs ← ⊃ ,/ (iu id il ir {⍺ ⍵}¨¨ u d l r)

⎕ ← ⊃ ⌈/ solve¨ { ↑ (⊂2⊃⍵)@(⊂⊃⍵)⊢ ↓ 0⍴⍨4,⍨⍴grid }¨ entry_dirs
