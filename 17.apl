#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '17.input' 1

inf ← 999999

grid ← (inf∘,∘⍉∘⌽)⍣4 ↑ ⍎¨¨ input

drot ← {
    ⍺=1 : 1⌽[1]⍵
    ⍺=2 : ¯1⌽[1]⍵
    ⍺=3 : 1⌽[2]⍵
    ⍺=4 : ¯1⌽[2]⍵
}

opp ← ⌷∘2 1 4 3

update_direction ← { ⍝ ⍺⍺=min, ⍵⍵=max
    w ← ⍵
    w[;;⍺;1] ⌊← grid + ⍺ drot ⌊/ ⌊/ ⍵[;;(⍳4)~⍺,opp ⍺;(⍺⍺-1)↓⍳⍵⍵]
    w[;;⍺;1↓⍳⍵⍵] ⌊← 3 1 2⍉ (grid+⍺∘drot)⍤2 ⊢ 2 3 1⍉ ⍵[;;⍺;¯1↓⍳⍵⍵]
    w
}

step ← { ⊃ ⌊/ (⍳4) (⍺⍺ update_direction ⍵⍵)¨ ⊂⍵ }

solve ← { (1-⍨ ⍴grid)⌷ ⌊/⌊/ ((⍺⍺-1)↓⊢)⍤1 (⍺⍺ step ⍵⍵)⍣(≢⊃,/input) ⊢ (0@(2 2 1 ⍵⍵)(2 2 2 ⍵⍵)) inf⍴⍨4 ⍵⍵,⍨⍴⍵ }

⎕ ← (1 solve 3) grid
⎕ ← (4 solve 10) grid
