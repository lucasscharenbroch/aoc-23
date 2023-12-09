#!/usr/bin/dyalogscript

input ← ⊃⎕NGET '5.input' 1

trans ← ↑¨ ((⍎¨(~∊∘' ')⊆⊢)¨ 1∘↓)¨ ((~0=≢¨)⊆⊢) 1↓input
seeds ← ⍎¨ ((~∊∘' ')⊆⊢) 2⊃ ((~∊∘':')⊆⊢) ⊃input
step ← { ⍵ + +/ (((2|⍸∘⍵)(+\1∘↓))×(-/2∘⍴))⍤1 ⊢ ⍺ }

⎕ ← ⌊/ { step/ (⌽trans),⍵ }¨ seeds

trange ← { ⍝ ⍺=(dest, src, cnt) ⍵=range
    dest src cnt ← ⍺
    low high ← ⍵
    offset ← -/2⍴⍺
    cmp ← (src (src+cnt))⍸⍵
    (1 1≡cmp) : ⍬ (⊂⍵+offset)
    0 1≡cmp : (⊂low (src-1)) (⊂offset + src high)
    1 2≡cmp : (⊂(src+cnt) high) (⊂offset + low (src+cnt-1))
    (0 2≡cmp) : ((low (src-1)) ((src+cnt) high)) (⊂dest (dest+cnt-1))
    (⊂⍵) ⍬
}

ftrans ← ⌽ ↓¨ trans
fseeds ← +\¨ ↓ ((≢seeds)÷2) 2⍴seeds

⎕ ← ⌊/ ⊃ ,/ ⊃ ,/ ⊃ (⊃⍤({ 0≡≢⊃⍵: ⍵ ⋄ (⍬)(2⊃⍵) ,¨ ⊃ ,¨/ (⊂⍺) trange¨ ⊃⍵}/)⍤((⊣,(⊂,∘(⊂⍬)⍤(,/⍤⊢)))))/⊢ (ftrans) , (⊂(fseeds)⍬)
