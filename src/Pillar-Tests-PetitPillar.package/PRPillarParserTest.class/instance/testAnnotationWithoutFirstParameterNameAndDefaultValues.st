tests - Annotation
testAnnotationWithoutFirstParameterNameAndDefaultValues
	| expected |
	super testAnnotationWithoutFirstParameterNameAndDefaultValues.
	expected := PRDocumentListAnnotation withParameters: ( 
			PRParameters withAll: { 
				PRParameter 
					keyNode: (PRParameterKey named: #path) 
					valueNode: (PRParameterValue value: 'Foo').
				PRParameter 
					keyNode: (PRParameterKey named: #limit) 
					valueNode: (PRParameterValue value: true).
				PRParameter 
					keyNode: (PRParameterKey named: #sort) 
					valueNode: (PRParameterValue value: true) } ).
	self assert: result equals: expected