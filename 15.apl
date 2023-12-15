#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '15.input' 1

hash ← { 256|17×⍺+⍵ }/⌽⍤(0∘,)⍤('UTF-8'∘⎕UCS)

⎕ ← +/ hash¨ (≠∘','⊆⊢) ⊃ input

ik iv ← ↓⍉↑ (≠∘'='⊆⊢)¨ (≠∘','⊆⊢) ('-'⎕R'=0') ⊃ input
iv ← ⍎¨ iv
av ← ik ((⊂⊢)⌸) iv
ai ← ((⊂⊢)⌸) ik
k ← ∪ ik
v ← ⊢/¨ av
i ← ai { ⍺⌷⍨(≢⍵)⌊⊢/1+0,⍸0=⍵ }¨ av
h ← hash¨ k
v h i ← (v[⍋i])(h[⍋i])(i[⍋i])
v h i ← (v[⍋h])(h[⍋h])(i[⍋h])

⎕ ← +/ ⊃ ,/ (⊢×⍳⍤≢⍤⊢)¨ { (⍵≠0)/⍵ }¨ (1+h)⊆(v×1+h)
