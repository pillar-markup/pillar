"
This class represents a toc. 
A Toc can have children. 
Then a Title is considered as a Toc without children
"
Class {
	#name : #PRToc,
	#superclass : #PRDocumentItem,
	#instVars : [
		'name',
		'level',
		'children',
		'fileReference'
	],
	#category : #'Pillar-Model-Toc'
}

{ #category : #testing }
PRToc class >> isAbstract [
	^ false
]

{ #category : #comparing }
PRToc >> = anItem [
	^ self species = anItem species
		and: [ self name = anItem name
				and: [ self level = anItem level and: [ self fileReference = anItem fileReference ] ] ]
]

{ #category : #adding }
PRToc >> addChildren: aToc [
	children add: aToc
]

{ #category : #converting }
PRToc >> asCTEnvironmentWithParent: aParent [
	| dictionary |
	dictionary := CTEnvironment new.
	dictionary parent: aParent.
	
	dictionary at: #name put: name.
	dictionary at: #level put: level.
	self hasFileReference ifTrue: [ 
		dictionary
			at: #href
			put: '/', (self changeFileExtension: fileReference) , '#' , self name asLowercase.
	].
	dictionary at: #hasChildren put: self children isNotEmpty.
	dictionary at: #children put: (self children collect: [ :each | 
		each asCTEnvironmentWithParent: dictionary ]).
	^ dictionary
]

{ #category : #converting }
PRToc >> asDictionary [
	| dictionary |
	dictionary := Dictionary new.
	dictionary at: #name put: name.
	dictionary at: #level put: level.
	self hasFileReference ifTrue: [ 
		dictionary
			at: #href
			put: '/', (self changeFileExtension: fileReference) , '#' , self name asLowercase.
	].
	dictionary at: #hasChildren put: self children isNotEmpty.
	dictionary at: #children put: (self children collect: [ :each | 
		each asDictionary
			at: #parent put: dictionary;
			yourself ]).
	^ dictionary
]

{ #category : #converting }
PRToc >> changeFileExtension: aPillarFile [
	^ ((aPillarFile splitOn: '.') at: 1) , '.html'
]

{ #category : #accessing }
PRToc >> children [
	^ children
]

{ #category : #accessing }
PRToc >> children: anObject [
	children := anObject
]

{ #category : #comparing }
PRToc >> compareChildren: anItem [
	^ (self children with: anItem children collect: [ :elem1 :elem2 | elem1 = elem2 ])
		inject: true
		into: [ :res :elem | res & elem ]
]

{ #category : #accessing }
PRToc >> fileReference [
	^ fileReference
]

{ #category : #accessing }
PRToc >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #testing }
PRToc >> hasFileReference [
	^ fileReference isNotNil
]

{ #category : #comparing }
PRToc >> hash [
	^ name hash + level hash + fileReference hash
]

{ #category : #comparing }
PRToc >> hashChildren [
	^ (self children collect: [ :elem | elem hash ])
		inject: 0
		into: [ :sum :value | sum + value ]
]

{ #category : #adding }
PRToc >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #accessing }
PRToc >> level [
	^ level
]

{ #category : #accessing }
PRToc >> level: anObject [
	level := anObject
]

{ #category : #accessing }
PRToc >> name [
	^ name
]

{ #category : #accessing }
PRToc >> name: anObject [
	name := anObject
]
