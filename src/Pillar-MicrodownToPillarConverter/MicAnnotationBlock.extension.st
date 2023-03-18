Extension { #name : #MicAnnotationBlock }

{ #category : #'*Pillar-MicrodownToPillarConverter' }
MicAnnotationBlock >> associatedPillarClass [ 

	^  PRAbstractAnnotation findClassAcceptingTag: self name ifNone: [ PRUndefinedAnnotation ]
	
]
