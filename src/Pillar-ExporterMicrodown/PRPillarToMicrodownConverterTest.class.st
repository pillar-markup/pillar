Class {
	#name : #PRPillarToMicrodownConverterTest,
	#superclass : #TestCase,
	#instVars : [
		'pillarParser',
		'writer'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #running }
PRPillarToMicrodownConverterTest >> setUp [ 
	super setUp.
	pillarParser := PRPillarParser new.
	writer := PRMicrodownWriter new.
	
	
]

{ #category : #tests }
PRPillarToMicrodownConverterTest >> testThreeSectionsNoExtraLines [

	| pillarobject result |
	pillarobject := pillarParser parse: '! Section 1
!Section 2
!Section 3'.
	result := writer start: pillarobject ; contents.
	self assert: result equals: '# Section 1

# Section 2

# Section 3
'
]

{ #category : #tests }
PRPillarToMicrodownConverterTest >> testTwoSections [

	| pillarobject result |
	pillarobject := pillarParser parse: '! Section 1

!Section 2'.
	result := writer start: pillarobject ; contents.
	"we get an extra line because the structure holds an empty paragraph and by default there is a new line emitted after any children."
	self assert: result equals: '# Section 1


# Section 2
'.
]

{ #category : #tests }
PRPillarToMicrodownConverterTest >> testTwoSectionsNoExtraLines [

	| pillarobject result |
	pillarobject := pillarParser parse: '! Section 1
!Section 2'.
	result := writer start: pillarobject ; contents.
	self assert: result equals: '# Section 1

# Section 2
'.
]

{ #category : #tests }
PRPillarToMicrodownConverterTest >> testTwoSectionsWithParagraph [

	| pillarobject result |
	pillarobject := pillarParser parse: '! Section 1
This is a paragraph.
On two lines.

!Section 2'.
	result := writer start: pillarobject ; contents.
	self assert: result equals: '# Section 1

This is a paragraph.
On two lines.

# Section 2
'.
]
