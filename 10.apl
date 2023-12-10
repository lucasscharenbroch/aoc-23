#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '10.input' 1

grid ← ¯1⊖ ¯1⌽ ((2+⍴)⍤⊢↑⊢) ↑input

step ← {
    l ← (1⌽⍵×grid∊'S7J-')×grid∊'LF-'
    r ← (¯1⌽⍵×grid∊'SLF-')×grid∊'J7-'
    u ← (1⊖⍵×grid∊'SLJ|')×grid∊'F7|'
    d ← (¯1⊖⍵×grid∊'SF7|')×grid∊'LJ|'
    ⍵∨l∨r∨u∨d
}

solve ← {
    next ← step ⍵
    next≡⍵ : 0
    1 + solve next
}

⎕ ← solve 'S'=grid

mask ← {
    next ← step ⍵
    next≡⍵ : ⍵
    mask next
}

same_dir ← {
    x ← step (1@⍺⍵) (⍴grid)⍴0
    x[(⊂⍺) + (1 0)(¯1 0)] ≡ x[(⊂⍵) + (1 0)(¯1 0)]
}

m ← mask 'S'=grid
dm ← (m∧grid∊'LF7J')∨ (⊢∨1∘⌽∨¯1∘⌽) (m∧grid='-')
grps ← ⊃ ,/ (↓⊆¨(↓⍳∘⍴)) dm

idxs_to_remove ← {
    inflections ← { ~ 2| +/ grid[⍵]∊'LF7J' : ⍵ (/⍨) grid[⍵]∊'LF7J' ⋄ ⍵ (/⍨) grid[⍵]∊'LF7JS' } ⍵
    l r ← ↓⍉(⊢⌺(2 1⍴2 2)) inflections
    2| +/ ~ (l same_dir¨ r) : ⍵ ~ 1↓inflections
    ⍵ ~ inflections
}

mp ← 0@(⊃ ,/ idxs_to_remove¨ grps) ⊢ m

⎕ ← +/ , (~m)∧ 2| +\ mp
