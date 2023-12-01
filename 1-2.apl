#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '1-1.input' 1

⍝ naive approach:
⍝ nums ← ('one' 1) ('two' 2) ('three' 3) ('four' 4) ('five' 5) ('six' 6) ('seven' 7) ('eight' 8) ('nine' 9) ('1' 1) ('2' 2) ('3' 3) ('4' 4) ('5' 5) ('6' 6) ('7' 7) ('8' 8) ('9' 9)
⍝ map_num ← {(≢⍵)<≢⊃⍺ : (≢⍵)/0 ⋄ ((0=2|≢⊃⍺)/0)∘,(((2⊃⍺)∘×∘(∧/∘(=∘(⊃⍺))))⊢)⌺(≢⊃⍺)⊢⍵} ⍝ ⍺=(needle, value), ⍵=haystack
⍝ solve ← +/⍤(10∘⊥⍤(⊃,⊃⍤⌽)⍤(≠∘0(⊢⍤/)⊢)¨)⌈⌿⍤(nums∘(∘.map_num))

⍝ updated version:
nums ← 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' , 1↓⎕D
vals ← 18⍴⍳9
solve ← {+/(10∘⊥⍤(⊃,⊢/)(⊢(/⍨)≠∘0))¨(⌈/vals∘×⍤1)⍉nums∘(∘.⍷)⍵}

⎕ ← solve input
