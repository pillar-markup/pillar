Extension { #name : #MicInlineParserTest }

{ #category : #'*Pillar-Microdown' }
MicInlineParserTest >> testAnnotationAsPillar [
	| res |
	res := self splitter pillarFrom: 'abc{!cite|a=2&b=5!}def'.
	self assert: res second class equals: PRCitationAnnotation.
	self assert: (res second parameters at: 'a') equals: '2'.
	self assert: (res second parameters at: 'b') equals: '5'.
]
