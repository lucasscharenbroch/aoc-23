#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '2-1.input' 1

split ← {
    1=≢⍺ : ⍺ (≠⊆⊢) ⍵
    ⍵⊆⍨~+\(⍺⍷⍵)+-⌽(1↓,∘0)(⌽⍺)⍷⌽⍵
}

rgb ← { ⍝ ⍵ = (num-string color-string)
    n ← ⍎⊃⍵
    c ← 2⊃⍵
    (n × c ≡ 'red') (n × c ≡ 'green') (n × c ≡ 'blue')
}

solve ← {
    ssets ← '; ' split 2⊃': ' split ⍵
    nsets ← { ⊃ ⌈/ (rgb' '∘split)¨ ', ' split ⍵ }¨ ssets
    ∧/ (∧/⍤(12 13 14∘≥))¨ nsets
}

⎕ ← +/ (solve¨×(⍳≢)) input
