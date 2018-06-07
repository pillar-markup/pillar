Extension { #name : #Object }

{ #category : #'*Pillar-Model-Core-Core' }
Object >> accept: aVisitor [
	<ignoreForCoverage>
	self error: self printString , ' is missing #accept:'
]

{ #category : #'*Pillar-Model-Core-Core' }
Object >> acceptDecorated: aVisitor [
	self accept: aVisitor
]
