#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '12.input' 1

ss ps ← ↓⍉↑ (input≠' ') (⊆¨) input
ps ← (⍎¨','∘≠⊆⊢)¨ ps

step ← { ⍝ ⍺⍺=str, ⍵⍵=pat, ⍺=i, ⍵=dp[i+1..1+≢s;]
    l s ← (⊂⍤{ +/ ∧\ '#?'∊⍨⍵ },⊂⍤⊢) (¯1+⍺-≢⍺⍺)↑ ⍺⍺ ⍝ longest leading '#?', first char
    r ← (('#'≢⊃s) × ⊃↓⍵) + ((l ≥ ⍵⍵) × (((⍺⍺,(≢⍺⍺)/' ')[⍺+⍵⍵]≠'#')× (⊂⍵) { (⊃⍵)>⊃⍴⍺ : 0 ⋄ ⍵⌷⍺ }¨ 1+ ⍵⍵ ,¨ ⍳≢⍵⍵)),0 ⍝ new row (dp[i;])
    ↑(⊂r),↓⍵
}

solve ← { (⍺ step ⍵)/ (⍳≢⍺),⊂((0⍴⍨2,≢⍵),1) } ⍝ ⍺=string, ⍵=pattern

⎕ ← +/ (1 1∘⌷⊃)¨ ss solve¨ ps

ss ← { ¯1↓ ⊃ ,/ 5/ (⊂⍵,'?') }¨ ss
ps ← { ⊃ ,/ 5/ ⊂⍵ }¨ ps

⎕PP ← 30
⎕ ← +/ (1 1∘⌷⊃)¨ ss solve¨ ps
