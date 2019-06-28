Extension { #name : #PPParser }

{ #category : #'*petitmarkdown-core-operators' }
PPParser >> oddNodes [
	^ self ==> [ :nodes | | size array |
		size := nodes size.
		array := Array new: size + 1 // 2.
		1 to: size by: 2 do: [ :i |
			array
				at: i // 2 + 1
				put: (nodes at: i) ].
			
		array ]
			
]
