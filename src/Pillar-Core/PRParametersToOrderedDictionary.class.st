Class {
	#name : #PRParametersToOrderedDictionary,
	#superclass : #PRVisitor,
	#instVars : [
		'dictionary'
	],
	#category : #'Pillar-Core-Visitor'
}

{ #category : #actions }
PRParametersToOrderedDictionary class >> of: aPRParameters [ 
	<return: #OrderedDictionary>
	| anInstance |
	anInstance := self new.
	aPRParameters accept: anInstance.
	^ anInstance dictionary
]

{ #category : #accessing }
PRParametersToOrderedDictionary >> dictionary [
	^ dictionary
]

{ #category : #initialization }
PRParametersToOrderedDictionary >> initialize [
	super initialize.
	dictionary := OrderedDictionary new.
]

{ #category : #visiting }
PRParametersToOrderedDictionary >> visitParameter: anObject [
	dictionary at: anObject key put: anObject value
]
