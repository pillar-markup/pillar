Class {
	#name : #PRTableCellTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRTableCellTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTableCellTest >> actualClass [
	^ PRTableCell
]

{ #category : #'tests-accessing' }
PRTableCellTest >> testAlign [
	self instance align: #right.
	self assert: self instance align equals: #right
]

{ #category : #'tests-accessing' }
PRTableCellTest >> testBeAlignedCenter [
	self instance beAlignedCenter.
	self assert: self instance align equals: #center.
	self assert: self instance isAlignedCenter.
	self deny: self instance isAlignedLeft.
	self deny: self instance isAlignedRight
]

{ #category : #'tests-accessing' }
PRTableCellTest >> testBeAlignedLeft [
	self instance beAlignedLeft.
	self assert: self instance align equals: #left.
	self deny: self instance isAlignedCenter.
	self assert: self instance isAlignedLeft.
	self deny: self instance isAlignedRight
]

{ #category : #'tests-accessing' }
PRTableCellTest >> testBeAlignedRight [
	self instance beAlignedRight.
	self assert: self instance align equals: #right.
	self deny: self instance isAlignedCenter.
	self deny: self instance isAlignedLeft.
	self assert: self instance isAlignedRight
]

{ #category : #'tests-comparing' }
PRTableCellTest >> testEqualAlign [
	self deny: self actualClass new beAlignedRight equals: self actualClass new beAlignedCenter.
	self deny: self actualClass new beAlignedCenter equals: self actualClass new beAlignedLeft
]

{ #category : #'tests-accessing' }
PRTableCellTest >> testHeading [
	self deny: self instance heading.
	self deny: self instance isHeading.
	
	self instance heading: true.
	self assert: self instance heading.
	self assert: self instance isHeading.
	
	self instance heading: false.
	self deny: self instance heading.
	self deny: self instance isHeading
]
