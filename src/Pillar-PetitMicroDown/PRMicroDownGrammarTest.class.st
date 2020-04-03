Class {
	#name : #PRMicroDownGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#instVars : [
		'factory'
	],
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #accessing }
PRMicroDownGrammarTest >> factory [

	^ factory
]

{ #category : #accessing }
PRMicroDownGrammarTest >> factory: aFactory [

	factory := aFactory
]

{ #category : #accessing }
PRMicroDownGrammarTest >> parserClass [
	^ PRMicroDownGrammar
]

{ #category : #running }
PRMicroDownGrammarTest >> setUp [ 
	super setUp.
	self factory: MicroDownSnippetFactory new.
]

{ #category : #'tests - level1' }
PRMicroDownGrammarTest >> testHeaderLevel1 [
	self parse: factory headerLevel1Sample rule: #header
]
