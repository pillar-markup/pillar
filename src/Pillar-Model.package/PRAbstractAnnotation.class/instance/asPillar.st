rendering
asPillar
	"Return a representation similar to the one used to create the annotation the assumption here is that the parameter dictionary only hold strings."
	^ String streamContents: [ :s |  
		s
			nextPutAll: self class openingAnnotationString;
				"(PRPillarParser markups at: PRAbstractAnnotation)"
			nextPutAll: self class tag. 
			self  hasParameters
				ifTrue:
					[ s nextPut: self class markupParameterSeparator.  
					self asPillarParametersOn: s.
					 ].
				
			s nextPutAll:  self class closingAnnotationString.	
		]