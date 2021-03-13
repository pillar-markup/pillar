Class {
	#name : #PRPreformattedTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRPreformattedTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPreformattedTest >> actualClass [
	^ PRPreformatted
]

{ #category : #'tests-parsing' }
PRPreformattedTest >> testText [
	self instance addAll: self foobarInstances.
	self assert: self instance text equals: 'foo
bar'

"This test is redefined because for formatted!!!! = Pre merging lines to not make sense!
It got unnoticed because we do not use preformatted."
]
