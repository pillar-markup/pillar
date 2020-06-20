Class {
	#name : #PRSemanticAction,
	#superclass : #Object,
	#instVars : [
		'string',
		'entity',
		'tokens'
	],
	#category : #'Pillar-ExporterRichText'
}

{ #category : #'instance creation' }
PRSemanticAction class >> from: aString [ 
	^ self new from: aString; yourself
]

{ #category : #'instance creation' }
PRSemanticAction >> computeEntity [
	"Try to guess what 
		Point
		Point >> #setX:setY: 
		Point class >> 
		"
	| size |
	tokens := RBScanner scanTokens: string.
	size := tokens size.
	
	"either 'Point' for a class or #'''System-Caching''' for a package"
	size = 1 
		ifTrue: [ self getClassOrNil
						ifNil: [self getPackageOrNil ] ].

	"only 'Point class'"
	size = 2
		ifTrue: [ self getMetaClassOrNil ]
]

{ #category : #'instance creation' }
PRSemanticAction >> computeEntity2 [
	"Try to guess what 
		Point
		Point >> #setX:setY: 
		"
		
	| ast |
	ast := RBParser parseExpression: string.
	ast doSemanticAnalysis.
	ast isVariable	
		ifTrue: [ 
			self class environment 
				at: ast name 
				ifPresent: [ :cl | entity := cl. ^ self ]
				ifAbsent: [  ] ]
		ifFalse: [ 
			| package |
			package := RPackageOrganizer default packageNamed: string ifAbsent: [ nil ].
			package ifNotNil: [ entity := package. ^ self ]
			"may be this is a method ref?" 
			
			
			].
	ast.
]

{ #category : #'instance creation' }
PRSemanticAction >> computeEntity3 [
	"Try to guess what 
		Point
		Point >> #setX:setY: 
		Point class >> 
		"
	^ (string includesSubstring: '>>')
		ifTrue: [ self extractMethod ]
		ifFalse: [  
			(string includesSubstring: ' class')
				ifFalse: [
					| package |
					self class environment 
						at: string asSymbol  
						ifPresent: [ :cl | entity := cl. ^ self ]
						ifAbsent: [  ].
					package := RPackageOrganizer default packageNamed: string ifAbsent: [ nil ].
					package ifNotNil: [ entity := package. ^ self ].
					]
				ifTrue: [ 
					| pair |
					pair := string splitOn: Character space.
					self class environment 
						at: pair first   
						ifPresent: [ :cl | entity := cl class. ^ self ]
					 ] ]
]

{ #category : #accessing }
PRSemanticAction >> entity [
	^ entity
]

{ #category : #'instance creation' }
PRSemanticAction >> extractMethod [
	"
	Point class >> foo 
	Point >> foo 
	"
	" We could also invoke the compiler"
	
	[ entity := OpalCompiler new source: string ; evaluate ] on: Error, SyntaxErrorNotification do: [ ] 
]

{ #category : #'instance creation' }
PRSemanticAction >> from: aString [

	string := aString.
	self computeEntity.
]

{ #category : #'instance creation' }
PRSemanticAction >> getClassOrNil [

	self class environment 
			at: tokens first asSymbol  
			ifPresent: [ :cl | entity := cl ]
			ifAbsent: [ ].
	^ entity
				
]

{ #category : #'instance creation' }
PRSemanticAction >> getMetaClassOrNil [

	self class environment 
			at: tokens first asSymbol  
			ifPresent: [ :cl | entity := cl. tokens second = 'class' 
															ifTrue: [ entity := entity class ]
															ifFalse: [ entity := nil "because we do not want Point foo" ] ]
			ifAbsent: [ ].
	^ entity
				
]

{ #category : #'instance creation' }
PRSemanticAction >> getPackageOrNil [
	entity := RPackageOrganizer default packageNamed: tokens first asString ifAbsent: [ nil ].
	^ entity
				
]

{ #category : #testing }
PRSemanticAction >> hasEntity [
	^ entity isNotNil
]
