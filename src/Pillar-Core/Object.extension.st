Extension { #name : 'Object' }

{ #category : '*Pillar-Core' }
Object >> accept: aVisitor [
	<ignoreForCoverage>
	self error: self printString , ' is missing #accept:'
]

{ #category : '*Pillar-Core' }
Object >> asMustachableValue [
	"Return a string that represents the value of an object that mustache will inject in a template.
	For example true as MustachableValue should return 'true'
	"
	"true asMustachableValue >>> 'true'"
	"1 asMustachableValue >>> '1'"
	"'1' asMustachableValue >>> '1'"
	"(Path * 'foo.bib') asMustachableValue >>> 'foo.bib'"
	
	^ self
]
