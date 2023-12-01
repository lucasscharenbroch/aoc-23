#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '1-1.input' 1
solve ← +/(⍎⍤(⊃,⊃⍤⌽)(∊∘⎕D¨(⊢⍤/)⊢))¨

⎕ ← solve input
