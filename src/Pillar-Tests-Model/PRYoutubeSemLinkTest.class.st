Class {
	#name : #PRYoutubeSemLinkTest,
	#superclass : #PRSemanticLinkTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRYoutubeSemLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRYoutubeSemLinkTest >> actualClass [
	^ PRYoutubeSemLink 
]

{ #category : #private }
PRYoutubeSemLinkTest >> expectedUrlForReferenceString [
	^ 'https://www.youtube.com/watch?v=MYSVMgRr6pw'
]

{ #category : #private }
PRYoutubeSemLinkTest >> expectedUrlForSimpleReferenceString [
	^ 'https://www.youtube.com/'
]

{ #category : #private }
PRYoutubeSemLinkTest >> referenceString [
	^ 'youtube:MYSVMgRr6pw'
]

{ #category : #private }
PRYoutubeSemLinkTest >> simpleReferenceString [
	^ 'youtube:'
]
