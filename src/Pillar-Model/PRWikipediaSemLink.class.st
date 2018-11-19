"
I am an external link with a link that is translatable to a url pointing to a Wikipedia page.
"
Class {
	#name : #PRWikipediaSemLink,
	#superclass : #PRSemanticLink,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRWikipediaSemLink class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRWikipediaSemLink class >> linkName [
	^ 'wikipedia'
]

{ #category : #'accessing-parameters' }
PRWikipediaSemLink >> lang [
	^ self parameters at: 'lang' ifAbsent: [ ^ 'en' ]
]

{ #category : #'accessing-dynamic' }
PRWikipediaSemLink >> urlEntry [

	| ref |
	ref := (self reference splitOn: ':') second.
	^ ref = '' ifTrue: [ '' ] ifFalse: [ 'wiki/' , ref ]
]

{ #category : #'accessing-dynamic' }
PRWikipediaSemLink >> urlPrefix [
	^ 'https://' , self lang , '.wikipedia.org/'
]
