Class {
	#name : 'PRBuilderMappingTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'tests' }
PRBuilderMappingTest >> testBuilderForHtmlIsHtmlBuilder [

	self assert: (PRTarget builderClassForName: 'html') equals: PRHtmlTarget.
	self assert: ((PRTarget builderForName: 'html') isKindOf: PRHtmlTarget)
]

{ #category : 'tests' }
PRBuilderMappingTest >> testBuilderForPdfIsPdfBuilder [

	self assert: (PRTarget builderClassForName: 'pdf') equals: PRPdfTarget
]
