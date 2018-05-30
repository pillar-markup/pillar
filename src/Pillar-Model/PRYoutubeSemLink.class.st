"
I am an external link with a link that is translatable to a url pointing to a Youtube page.
"
Class {
	#name : #PRYoutubeSemLink,
	#superclass : #PRSemanticLink,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRYoutubeSemLink class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRYoutubeSemLink class >> linkName [
	^ 'youtube'
]

{ #category : #'accessing-dynamic' }
PRYoutubeSemLink >> urlEntry [
	
	| ref |
	ref := (self reference splitOn: ':') second.
	^ ref = '' ifTrue: [ '' ] ifFalse: [ 'watch?v=', ref ]
]

{ #category : #'accessing-dynamic' }
PRYoutubeSemLink >> urlPrefix [
	^ 'https://www.youtube.com/'
]
