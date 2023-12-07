#! /usr/bin/dyalogscript

input ← ⊃⎕NGET '7.input' 1

c2n ← '23456789TJQKA'∘⍳
classify ← (5-≢⍤∪),(⌈/(+/∘.=⍨)),((5≡∪)×(⌈/c2n))
h2n ← 13⊥classify,(¯1∘+c2n)

hands bids ← ↓⍉↑(~⍤(' '∘=)⊆⊢)¨ input
bids ← ⍎¨ bids

⎕ ← +/ (⍳≢bids) × bids[⍋ h2n¨ hands]

modes ← ((⊂0~⍨⊢/)0,⊢⌸)⌷⊢
change_joker ← { (⊃ 'A' ,⍨ modes (⍵~'J'))@(⍸⍵='J') ⊢ ⍵ }

c2n ← 'J23456789TQKA'∘⍳
h2n ← 13⊥(classify change_joker),(¯1∘+c2n)

⎕ ← +/ (⍳≢bids) × bids[⍋ h2n¨ hands]
