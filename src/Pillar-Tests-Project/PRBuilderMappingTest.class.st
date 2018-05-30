Class {
	#name : #PRBuilderMappingTest,
	#superclass : #TestCase,
	#category : 'Pillar-Tests-Project'
}

{ #category : #tests }
PRBuilderMappingTest >> testBuilderForHtmlIsHtmlBuilder [

	self assert: (PRTarget builderClassForName: 'html') equals: PRHtmlOutput.
	self assert: ((PRTarget builderForName: 'html') isKindOf: PRHtmlOutput)
]

{ #category : #tests }
PRBuilderMappingTest >> testBuilderForPdfIsPdfBuilder [

	self assert: (PRTarget builderClassForName: 'pdf') equals: PRPdfOutput
]
