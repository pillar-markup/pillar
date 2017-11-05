accessing
renderAsText
	| text |
	text := String new writeStream.
	self reference isNotNil
		ifTrue: [ text nextPutAll: self reference ].
	self hasAnchor
		ifTrue: [ 
			text
				nextPutAll: '@';
				nextPutAll: self anchor ].
	^ text contents