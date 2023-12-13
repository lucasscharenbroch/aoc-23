#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '13.input' 1

grids ← ((0≠≢¨)⊆⊢) input

prefix_eq ← { n ← (≢⍺)⌊(≢⍵) ⋄ a ← n↑⍺ ⋄ w ← n↑⍵ ⋄ ∧/ a=w }
row_mirror ← { (¯1↓⍳≢⊃⍵) × (∧⌿⍤↑((¯1↓,\)((⌽⊣)prefix_eq(⌽⊢))¨(⌽¯1↓,\⍤⌽))¨)⍵ }

solve ← row_mirror,(100×row_mirror⍤(↓⍤⍉↑))

⎕ ← +/ (+/solve)¨ grids

solve2 ← { x ← ↑⍵ ⋄ (solve↓)¨ (({⍵:'.' ⋄ '#'}¨=∘'#'){ ⍺@(⊂⍵) ⊢ x }¨(⍳⍴)) x }

⎕ ← +/ ((⌈/⊃)⍤(,/,/)0⌈solve2-⊂⍤solve)¨grids
