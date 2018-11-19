"
I'm responsible for starting the parsing process of a Pillar document. If possible, I will use a compiled version of PRPillarParser. I will also use the STON reader to read potentital metadata at the begining of the stream.
"
Class {
	#name : #PRPillarParserMainOld,
	#superclass : #Object,
	#classVars : [
		'UseCompiledParser'
	],
	#category : 'Pillar-PetitPillarOld'
}

{ #category : #'compiled parser' }
PRPillarParserMainOld class >> beCompiled [
	UseCompiledParser := true
]

{ #category : #'compiled parser' }
PRPillarParserMainOld class >> beNonCompiled [
	UseCompiledParser := false
]

{ #category : #'compiled parser' }
PRPillarParserMainOld class >> compileParser [
	PRPillarParserOld new compileWithOptions: {#parserName: . self compiledParserName asSymbol}.
	^ Smalltalk classNamed: self compiledParserName
	
]

{ #category : #'compiled parser' }
PRPillarParserMainOld class >> compiledParser [
	^ (self environment hasClassNamed: self compiledParserName)
		ifTrue: [ self environment classNamed: self compiledParserName ]
		ifFalse: [ self compileParser ]
]

{ #category : #'compiled parser' }
PRPillarParserMainOld class >> compiledParserName [
	^ 'PRPillarCompiled'
]

{ #category : #accessing }
PRPillarParserMainOld class >> documentParser [
	^ (self useCompiled and: [ Smalltalk globals hasClassNamed: 'PPCompiledParser' ])
		ifTrue: [ self compiledParser ]
		ifFalse: [ PRPillarParserOld ]
]

{ #category : #parsing }
PRPillarParserMainOld class >> parse: aStringOrStream [
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
PRPillarParserMainOld class >> parse: aString startingAt: aSymbol [
	^ self documentParser parse: aString startingAt: aSymbol
]

{ #category : #parsing }
PRPillarParserMainOld class >> parseDocument: stream [
	^ self documentParser parse: stream
]

{ #category : #'compiled parser' }
PRPillarParserMainOld class >> useCompiled [
	^ UseCompiledParser ifNil: [ self beCompiled. UseCompiledParser ]
]
