#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '6.input' 1

timedist ← ((⍎¨' '∘≠⊆⊢) (2⊃':'∘≠⊆⊢))¨ input

ways ← { +/ ⍺ < ×/¨(⌽,¨⊢)1↓⌽⍳⍵ } ⍝ ⍺=record ⍵=ms

⎕ ← ×/ ⊃ ways¨/ ⌽timedist

t d ← ⍎⍤⊃⍤((⍕⍤⊣,⊢)/⍤(,∘' '))¨ timedist

roots ← {a b c←⍵ ⋄  (÷2×a)× (-b)+ (-,+) (((b*2) - 4×a×c) *0.5)}

⎕ ← 1 + -/ (⌊⍤⊃,⌈⍤(2∘⊃)) (⊂∘⍒⌷⊢) roots ¯1 t (-d)
