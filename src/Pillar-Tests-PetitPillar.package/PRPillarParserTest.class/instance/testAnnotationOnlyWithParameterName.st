tests - Annotation
testAnnotationOnlyWithParameterName
	| expected |
	super testAnnotationOnlyWithParameterName.
	expected := PRInputFileAnnotation withParameters: (
			PRParameters withAll: { 
				(PRParameter 
					keyNode: (PRParameterKey named: #path) 
					valueNode: (PRParameterValue value: true)) } ).
	self assert: result equals: expected