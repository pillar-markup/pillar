Class {
	#name : #PRTitlePrinterTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #testing }
PRTitlePrinterTest class >> isAbstract [
	^ self = PRTitlePrinterTest
]

{ #category : #requirement }
PRTitlePrinterTest >> actualClass [
	^ PRTitlePrinterSpecification
]

{ #category : #tests }
PRTitlePrinterTest >> configurationClass [ 
	^ ConfigurationForPillar
]

{ #category : #helpers }
PRTitlePrinterTest >> counterLevel3 [
	^ Array with: 1 with: -1 with: 3
]

{ #category : #helpers }
PRTitlePrinterTest >> defaultDictionary [
	^ Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'roman'
]

{ #category : #helpers }
PRTitlePrinterTest >> newDefaultConfiguration [
	^ self actualClass with: self defaultDictionary
]

{ #category : #requirement }
PRTitlePrinterTest >> representationOf26 [
	^ self subclassResponsibility
]

{ #category : #requirement }
PRTitlePrinterTest >> representationOf27 [
	^ self subclassResponsibility
]

{ #category : #requirement }
PRTitlePrinterTest >> representationOfOne [
	^ self subclassResponsibility
]

{ #category : #tests }
PRTitlePrinterTest >> testCounter [
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman' .
	spec size: 1.
	printer level1: spec. 
	
	spec := printer printerSpecFor: 'letter' .
	spec size: 2.
	printer level2: spec. 
	
	spec := printer printerSpecFor: 'letter' .
	spec size: 3.
	printer level3: spec. 

	self assert: (printer level3 printCounter: self counterLevel3) equals: 'I.c'
]

{ #category : #tests }
PRTitlePrinterTest >> testFillFrom [
	| specTarget specSource |
	specTarget := PRTitlePrinterSpecification new.
	specSource := PRTitlePrinterSpecification new.
	specSource level: 3.
	specSource size: 55.
	specSource renderAs: 'roman'.
	specSource numbering: true.
	specSource capitalization: 'capitalize english'.

	specTarget fillFromAnother: specSource.
	self assert: specTarget level equals: 3.
	self assert: specTarget size equals: 55.
	self assert: specTarget renderAs equals: 'roman'.
	self assert: specTarget numbering.
	self assert: specTarget capitalization equals: 'capitalize english'
]

{ #category : #tests }
PRTitlePrinterTest >> testPrintElement [
	| printer |
	printer := self newDefaultConfiguration.
	self assert:  (String streamContents: [:s | (printer printElement: -1 on: s)]) equals: ''.
	self assert:  (String streamContents: [:s | (printer printElement: 1 on: s)]) equals: self representationOfOne.
	self assert: (String streamContents: [:s | (printer printElement: 26 on: s)])equals: self representationOf26.
	self assert: (String streamContents: [:s | (printer printElement: 27 on: s)]) equals: self representationOf27.

]

{ #category : #tests }
PRTitlePrinterTest >> testSize [
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman' .
	spec size: 1.
	printer level1: spec. 
	
	spec := printer printerSpecFor: 'number' .
	
	spec size: 0.
	printer level2: spec. 
	
	spec := printer printerSpecFor: 'letter' .
	spec size: 3.
	printer level3: spec. 

	self assert: (printer level3 printCounter: #(1 -1 1)) equals: 'I.a'.

	printer level2 size: 2.
	
	self assert: (printer level3 printCounter: #(1 1 1)) equals: 'I.1.a'
	
]

{ #category : #tests }
PRTitlePrinterTest >> testSizeHigherThanThePossible [
	
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec size: 1.
	printer level1: spec. 	
		
	spec := printer printerSpecFor: 'number' .
	spec size: 2.
	printer level1: spec. 	
		
	self assert: (printer level2 printCounter: #(-1 1)) equals: '1'
]

{ #category : #tests }
PRTitlePrinterTest >> testSizeIsNotTheFullSizePossible [
	
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec size: 1.
	printer level1: spec. 	
		
	spec := printer printerSpecFor: 'number' .
	spec size: 1.
	printer level2: spec. 	
		
	self assert: (printer level1 printCounter: #(1)) equals: 'I'.
	self assert: (printer level2 printCounter: #(1 1)) equals: '1'
]

{ #category : #tests }
PRTitlePrinterTest >> testSizeWhenNumeratingIsFalse [
	| printer |
	printer := PRTitlePrinterSpecification with: ( Dictionary with: 'numbering' -> false with: 'size' -> 0).
	self assert: (printer size) equals: 0.
	
	printer := PRTitlePrinterSpecification with: ( Dictionary with: 'numbering' -> false with: 'size' -> 3).
	self assert: (printer size) equals: 0
]
