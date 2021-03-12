Class {
	#name : #PRTableTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRTableTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTableTest >> actualClass [
	^ PRTable
]

{ #category : #'tests-accessing' }
PRTableTest >> testCount [
	self instance
		add:
			(PRTableRow new
				add: PRTableCell new;
				yourself).
	self
		assert: self instance rowCount equals: 1;
		assert: self instance columnCount equals: 1.

	self instance
		add:
			(PRTableRow new
				add: PRTableCell new;
				add: PRTableCell new;
				yourself).
	self
		assert: self instance rowCount equals: 2;
		assert: self instance columnCount equals: 2.

	self instance
		add:
			(PRTableRow new
				add: PRTableCell new;
				yourself).
	self
		assert: self instance rowCount equals: 3;
		assert: self instance columnCount equals: 2
]
