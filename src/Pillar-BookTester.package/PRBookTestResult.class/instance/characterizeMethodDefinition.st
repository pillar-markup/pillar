accessing
characterizeMethodDefinition
	"Precondition: fragmentedText should be filled in before using this method"
	
	((self fragmentedText) isString)
		ifTrue: [ ^ 'wrongSyntax' ].

	((((self fragmentedText) first size) = 2)  
		and: ((self fragmentedText) first) isArray) 
		ifTrue: [ ^ 'classSide' ].
		
	^ 'normalMethodDefinition'