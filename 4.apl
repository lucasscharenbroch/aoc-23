#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '4.input' 1
points ← { +/, (⊃∘.=2∘⊃) (⍎¨≠∘' '⊆⊢)¨ 1↓ (~⍤(∊∘':|')⊆⊢) ⍵ }
score ← { ×/ (/∘2) ¯1+  points ⍵ }

⎕ ← +/ score¨ input

step ← {
    acc cnts ← ⍵
    c cs ← (1↑cnts)(1↓cnts)
    (acc + c)(cs+(≢cs)↑⍺/c)
}

solve2 ← { ⊃⊃ step/ (⌽⍵),⊂(0)(1/⍨≢⍵) } ⍝ ⍵ = pts

⎕ ← solve2 points¨ input
