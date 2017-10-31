visiting-document
visitAnnotatedParagraph: anAnnotatedParagraph
	
	|annotation|
	annotation := self searchAnnotation: anAnnotatedParagraph annotation.
	
	canvas precede: [ super visitParagraph: anAnnotatedParagraph ] by: (annotation, (annotation isEmpty ifTrue:[''] ifFalse:[' ']) ).
	canvas potentialNewLine.  
	