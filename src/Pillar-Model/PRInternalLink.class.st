"
I am an internal link pointing to a structure within the current kernel. I reference my owning structure to be able to lookup the referenced structure. The referenced structure is cached in the instance variable ==target==.
"
Class {
	#name : #PRInternalLink,
	#superclass : #PRLink,
	#instVars : [
		'target',
		'anchor'
	],
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRInternalLink class >> isAbstract [
	^ false
]

{ #category : #testing }
PRInternalLink class >> isValidReference: aString [
	^ true
]

{ #category : #accessing }
PRInternalLink class >> priority [
	^ 100
]

{ #category : #'instance creation' }
PRInternalLink class >> reference: aString [
	| index |
	^ (index := aString indexOf: $@) isZero
		ifTrue: [ super reference: aString ]
		ifFalse: [ 
			index = 1
				ifTrue: [ self new anchor: (aString copyFrom: index + 1 to: aString size) ]
				ifFalse: [ 
					self new
						reference: (aString copyFrom: 1 to: index - 1);
						anchor: (aString copyFrom: index + 1 to: aString size);
						yourself ] ]
]

{ #category : #comparing }
PRInternalLink >> = anObject [
	^ super = anObject
		and: [ self anchor = anObject anchor ]
]

{ #category : #visiting }
PRInternalLink >> accept: aVisitor [
	aVisitor visitInternalLink: self
]

{ #category : #accessing }
PRInternalLink >> anchor [
	"Answer an anchor string the receiver is pointing to."

	^ anchor
]

{ #category : #accessing }
PRInternalLink >> anchor: aString [
	anchor := aString trimBoth
]

{ #category : #testing }
PRInternalLink >> hasAnchor [
	^ self anchor notNil
]

{ #category : #testing }
PRInternalLink >> hasReference [
	^ self reference notNil
]

{ #category : #comparing }
PRInternalLink >> hash [
	^ super hash bitXor: self anchor hash
]

{ #category : #testing }
PRInternalLink >> isInternal [
	^ true
]

{ #category : #accessing }
PRInternalLink >> referenceAsHTML [
	"I return a reference to a pillar file as an html file."

	| ref |
	ref := self reference.
	((ref endsWith: '.pillar') or: [ ref endsWith: '.pier' ])
		ifTrue: [ ref := (ref copyUpToLast: $.) , '.html' ]
		ifFalse: [ PRLinkWarning signal: 'Reference : ' , ref , ' should end with .pillar or .pier' ].
	^ ref
]

{ #category : #accessing }
PRInternalLink >> referenceAsMarkdown [
	"I return a reference to a pillar file as a markdown file."

	| ref |
	ref := self reference.
	((ref endsWith: '.pillar') or: [ ref endsWith: '.pier' ])
		ifTrue: [ ref := (ref copyUpToLast: $.) , '.md' ]
		ifFalse: [ PRLinkWarning signal: 'Reference : ' , ref , ' should end with .pillar or .pier' ].
	^ ref
]

{ #category : #accessing }
PRInternalLink >> renderAsText [
	| text |
	text := String new writeStream.
	self reference isNotNil
		ifTrue: [ text nextPutAll: self reference ].
	self hasAnchor
		ifTrue: [ 
			text
				nextPutAll: '@';
				nextPutAll: self anchor ].
	^ text contents
]
