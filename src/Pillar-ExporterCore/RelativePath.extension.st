Extension { #name : #RelativePath }

{ #category : #'*Pillar-ExporterCore' }
RelativePath >> pillarPrintString [
	self isEmpty ifTrue: [ ^ '' ].
	^ String streamContents: [ :str |
		str nextPutAll: (self at: 1) asString.
		2 to: self size do: [:i |
			str
				nextPut: self delimiter;
				nextPutAll: (self at: i) ] ]
					
			
]
