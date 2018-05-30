Class {
	#name : #PRWikipediaSemLinkTest,
	#superclass : #PRSemanticLinkTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRWikipediaSemLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRWikipediaSemLinkTest >> actualClass [
	^ PRWikipediaSemLink
]

{ #category : #private }
PRWikipediaSemLinkTest >> expectedUrlForReferenceString [
	^ 'https://en.wikipedia.org/wiki/Atom'
]

{ #category : #private }
PRWikipediaSemLinkTest >> expectedUrlForSimpleReferenceString [
	^ 'https://en.wikipedia.org/'
]

{ #category : #private }
PRWikipediaSemLinkTest >> referenceString [
	^ 'wikipedia:Atom'
]

{ #category : #private }
PRWikipediaSemLinkTest >> simpleReferenceString [
	^ 'wikipedia:'
]

{ #category : #'as yet unclassified' }
PRWikipediaSemLinkTest >> testUrlWithParameters [
	"this link could be for example *link to atom on wiki>wikipedia:Atom|lang=fr*"
	
	self instance reference: self referenceString;
		parameters: (Dictionary with: 'lang' -> 'fr').
	self assert: self instance url equals: 'https://fr.wikipedia.org/wiki/Atom'
]
