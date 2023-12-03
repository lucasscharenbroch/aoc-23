#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '1.input' 1
solve ← +/(⍎⍤(⊃,⊃⍤⌽)(∊∘⎕D¨(⊢⍤/)⊢))¨

⎕ ← solve input

nums ← 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' , 1↓⎕D
vals ← 18⍴⍳9
solve2 ← {+/(10∘⊥⍤(⊃,⊢/)(⊢(/⍨)≠∘0))¨(⌈/vals∘×⍤1)⍉nums∘(∘.⍷)⍵}

⎕ ← solve2 input
