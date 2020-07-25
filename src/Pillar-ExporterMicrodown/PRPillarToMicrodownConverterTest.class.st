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

{ #category : #'tests paragraph list' }
PRPillarToMicrodownConverterTest >> testNestedLists [

	| pillarobject result |
	pillarobject := pillarParser parse: 'This is a list
- item 1 ""this is bold again my friend"" and not
-- item 11
-- item 12
- item 2
-- item 21
- item 3
'.
	result := writer start: pillarobject ; contents.
	self assert: result equals: 'This is a list
- item 1 **this is bold again my friend** and not
  - item 11
  - item 12
- item 2
  - item 21
- item 3
'
]

{ #category : #'tests paragraph list' }
PRPillarToMicrodownConverterTest >> testParagraphList [

	| pillarobject result |
	pillarobject := pillarParser parse: 'This is not bold 

This is a list
- item 1 ""this is bold again my friend""
- item 2
'.
	result := writer start: pillarobject ; contents.
	self assert: result equals: 'This is not bold 

This is a list
- item 1 **this is bold again my friend**
- item 2
'.
]

{ #category : #tests }
PRPillarToMicrodownConverterTest >> testSectionParagraphWithBold [

	| pillarobject result |
	pillarobject := pillarParser parse: '!!Heading Twoo 

""this is bold""

This is not bold '.
	result := writer start: pillarobject ; contents.
	"we get extra lines because the pillar parser generates empty paragraphs the structure holds an empty paragraph and by default there is a new line emitted after any children."
	self assert: result equals: '## Heading Twoo 


**this is bold**

This is not bold '.
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

{ #category : #'tests paragraph list' }
PRPillarToMicrodownConverterTest >> testTwoLists [

	| pillarobject result |
	pillarobject := pillarParser parse: 'This is list 1
- item 11 ""this is bold again my friend""
- item 12

This is list 2
- item 21 ""this is bold again my friend""
- item 22 and not bold
'.
	result := writer start: pillarobject ; contents.
	self assert: result equals: 'This is list 1
- item 11 **this is bold again my friend**
- item 12


This is list 2
- item 21 **this is bold again my friend**
- item 22 and not bold
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
