tests - Annotation
testAnnotationWithoutParameterName
	| expected |
	super testAnnotationWithoutParameterName.
	expected := PRInputFileAnnotation withParameters: ( 
			PRParameters withAll: { 
				(PRParameter 
					keyNode: (PRParameterKey named: #path) 
					valueNode: (PRParameterValue value: 'Foo')) } ).
	self assert: result equals: expected