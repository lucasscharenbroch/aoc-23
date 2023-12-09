#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '9.input' 1
seqs ← (⍎¨≠∘' '⊆⊢)¨ input

step ← {
    arr acc ← ⍵
    (¯1↓(1⌽arr)-arr)(acc, ⍺⍺ arr)
}

solve ← { ⍵⍵/ 2⊃ ⊃ (⍺⍺ step)/ (⍳≢⍵),(⊂⍵ ⍬) }

⎕ ← +/ (⊢/solve+)¨ seqs
⎕ ← +/ (⊃solve-)¨ seqs
