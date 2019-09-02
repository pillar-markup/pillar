"
I'm responsible for starting the parsing process of a Pillar document. If possible, I will use a compiled version of PRPillarParser. I will also use the STON reader to read potentital metadata at the begining of the stream.
"
Class {
	#name : #PRPillarParserMain,
	#superclass : #Object,
	#classVars : [
		'UseCompiledParser',
		'UsedParser'
	],
	#category : 'Pillar-PetitPillar'
}

{ #category : #'compiled parser' }
PRPillarParserMain class >> beCompiled [
	UseCompiledParser := true
]

{ #category : #'compiled parser' }
PRPillarParserMain class >> beNonCompiled [
	UseCompiledParser := false
]

{ #category : #'compiled parser' }
PRPillarParserMain class >> compileParser [
	PRPillarParser new compileWithOptions: {#parserName: . self compiledParserName asSymbol}.
	^ Smalltalk classNamed: self compiledParserName
	
]

{ #category : #'compiled parser' }
PRPillarParserMain class >> compiledParser [
	^ (self environment hasClassNamed: self compiledParserName)
		ifTrue: [ self environment classNamed: self compiledParserName ]
		ifFalse: [ self compileParser ]
]

{ #category : #'compiled parser' }
PRPillarParserMain class >> compiledParserName [
	^ 'PRPillarCompiled'
]

{ #category : #accessing }
PRPillarParserMain class >> documentParser [
	^ (self useCompiled and: [ Smalltalk globals hasClassNamed: 'PPCompiledParser' ])
		ifTrue: [ self compiledParser ]
		ifFalse: [ self usedParser ]
]

{ #category : #parsing }
PRPillarParserMain class >> parse: aStringOrStream [
	| stream hasProperties properties doc |
	stream := aStringOrStream readStream.
	[ stream atEnd
			ifTrue: [ ^ PRDocument new ].
		hasProperties := stream next = ${ and: [ stream next ~~ ${ ] ]
			ensure: [ stream close ].
	
	stream := aStringOrStream readStream.
	[ properties := hasProperties
			ifTrue: [ (STON reader on: stream) next ]
			ifFalse: [ Dictionary new ].
		doc := self parseDocument: stream upToEnd.
		properties
			keysAndValuesDo: [ :key :value | doc propertyAt: key put: value ].
		^ doc ] ensure: [ stream close ]
]

{ #category : #parsing }
PRPillarParserMain class >> parse: aString startingAt: aSymbol [
	^ self documentParser parse: aString startingAt: aSymbol
]

{ #category : #parsing }
PRPillarParserMain class >> parseDocument: stream [
	^ self documentParser parse: stream
]

{ #category : #'compiled parser' }
PRPillarParserMain class >> useCompiled [
	^ UseCompiledParser ifNil: [ self beCompiled. UseCompiledParser ]
]

{ #category : #configuration }
PRPillarParserMain class >> usePetitParserTwo [
	UsedParser := PRPillarParser new optimize 
]

{ #category : #configuration }
PRPillarParserMain class >> usedParser [
	UsedParser ifNil: [ self usePetitParserTwo ].
	^ UsedParser
]
