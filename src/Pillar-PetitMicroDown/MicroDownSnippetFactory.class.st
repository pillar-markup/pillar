Class {
	#name : #MicroDownSnippetFactory,
	#superclass : #Object,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #utils }
MicroDownSnippetFactory >> grammar [

	^ PRMicroDownGrammar 
]

{ #category : #sample }
MicroDownSnippetFactory >> headerLevel1Sample [
	^ self grammar headerMarkup, '#Foo'
]
