#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '11.input' 1

⍝ part 1 can also be solved with a tweak to part 2
dzr ← ⊢(/⍨)(1+(∧/=∘'.'))¨ ⍝ duplicate zero rows
grid ← ↑ dzr ↓⍉↑ dzr input
⎕ ← 2÷⍨ +/ , +/¨ | (∘.-)⍨ ⍸grid='#'

grid ← ↑input

dist ← { | ∘.(-⍥(⌷∘⍺))⍨⍵ } ⍝ ⍵=coord-vec, ⍺=dist-prefix-sum

rcps ← { (⍳⍤≢+⊢) +\ 999999× (∧/=∘'.')⍤1 ⊢ ⍵ }¨ grid (⍉grid)
rc ← ↓⍉↑ ⍸grid='#'

⎕PP ← 30
⎕ ← 2÷⍨ +/ , ⊃ +/ (rcps (dist)¨ rc)
