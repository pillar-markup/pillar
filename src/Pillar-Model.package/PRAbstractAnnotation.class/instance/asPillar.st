rendering
asPillar
	"Return a representation similar to the one used to create the annotation the assumption here is that the parameter dictionary only hold strings."
	^ String streamContents: [ :s |  
		s
			nextPutAll: '${';
				"(PRPillarParser markups at: PRAbstractAnnotation)"
			nextPutAll: self class tag. 
			self  hasParameters
				ifTrue:
					[ s nextPut: $:.  "PRPillarParser defaultMarkupAnnotationSeparato"
					self asPillarParametersOn: s.
					 ].
				
			s nextPutAll: (PRPillarParser endMarkups at: PRAbstractAnnotation).	
		]