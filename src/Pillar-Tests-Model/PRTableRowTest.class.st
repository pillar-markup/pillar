Class {
	#name : #PRTableRowTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRTableRowTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTableRowTest >> actualClass [
	^ PRTableRow
]

{ #category : #'tests-accessing' }
PRTableRowTest >> testCount [
	self instance add: PRTableCell new.
	self assert: self instance columnCount equals: 1.

	self instance add: PRTableCell new.
	self assert: self instance columnCount equals: 2
]

{ #category : #'tests-accessing' }
PRTableRowTest >> testRowWithHeadingCellIsHeading [
	self instance
		add:
			(self
				addText: 'foo'
				to:
					(PRTableCell new
						beHeading;
						yourself)).
	self assert: self instance isHeading
]

{ #category : #'tests-accessing' }
PRTableRowTest >> testRowWithHeadingCellsAndOneEmptyCellIsHeading [
	self instance
		add:
				(self
						addText: 'foo'
						to:
							(PRTableCell new
								beHeading;
								yourself));
		add: PRTableCell new.
	self assert: self instance isHeading
]

{ #category : #'tests-accessing' }
PRTableRowTest >> testRowWithOnlyEmptyCellIsNotHeading [
	self instance
		add: PRTableCell new;
		add: PRTableCell new.
	self deny: self instance isHeading
]
