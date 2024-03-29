Class {
	#name : #PRMailLinkTest,
	#superclass : #PRExternalLinkTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'tests-accessing' }
PRMailLinkTest >> testTitle [
	super testTitle.
	self instance reference: self referenceString.
	self assert: self instance title equals: self referenceString
]

{ #category : #'tests-accessing' }
PRMailLinkTest >> testUrl [
	self instance reference: self referenceString.
	self assert: (self instance url beginsWith: 'mailto:').
	self assert: self instance url ~= ('mailto:' , self referenceString).
	self assert: self instance scrambledUrl ~= ('mailto:' , self referenceString).
	self assert: self instance unscrambledUrl equals: 'mailto:' , self referenceString
]
