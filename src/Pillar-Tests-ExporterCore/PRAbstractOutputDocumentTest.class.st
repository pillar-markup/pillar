Class {
	#name : 'PRAbstractOutputDocumentTest',
	#superclass : 'PRTestWithMemoryFileSystem',
	#category : 'Pillar-Tests-ExporterCore-Base',
	#package : 'Pillar-Tests-ExporterCore',
	#tag : 'Base'
}

{ #category : 'tests' }
PRAbstractOutputDocumentTest >> testParseInput [

	| doc |
	doc := PRAbstractOutputDocument new parseInputFile: (PRPillarInputDocument new file: memoryFileSystem / 'input1.pillar').
	self assert: doc class equals: PRDocument.

]
