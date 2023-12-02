#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '2-1.input' 1

splitc ← {1↓¨(⍺∊⍨⍺,⍵)⊂⍺,⍵}
split ← {
    1=≢⍺ : ⍺ splitc ⍵
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
    (×/⊃)⍤(⌈/) nsets
}

⎕ ← +/ solve¨ input