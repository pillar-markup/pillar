"
I add line numbers to each script with ==lineNumber=true==.

[[[lineNumber=true
	
	
	
	
	
]]]

S. Ducasse: String new writeStream is no correct because imagine that we are on mac and we want to produce document for windows... We should not output mac end of line. This is why PROutputStream should be used instead. 
"
Class {
	#name : #PRScriptLineNumber,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'stream'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #adding }
PRScriptLineNumber >> add: aString untilNewLineAt: firstOccurence withNumber: number [

	| length |
	length := firstOccurence + self configuration newLine size -1.
	self add: (aString first: length) withNumber: number.
	^ aString allButFirst: length
]

{ #category : #adding }
PRScriptLineNumber >> add: aString withNumber: number [

	stream
		<< number asString;
		tab;
		<< aString
]

{ #category : #adding }
PRScriptLineNumber >> addLineNumberTo: aScript [
	"I add a numerotation at each line of a script."

	| text firstOccurence number |
	text := aScript text.
	number := 1.
	firstOccurence := text indexOfSubCollection: self configuration newLine.
	[ firstOccurence = 0 ]
		whileFalse: [ 
			text := self add: text untilNewLineAt: firstOccurence withNumber: number.
			firstOccurence := text indexOfSubCollection: self configuration newLine.
			number := number + 1 ].
	self add: text withNumber: number.
	^ aScript text: stream contents
]

{ #category : #testing }
PRScriptLineNumber >> hasLineNumber: aScript [
	^ aScript parameters 
			at: 'lineNumber' 
			ifPresent: [ :lN | lN = 'true' or: [ lN = true ] ] ifAbsent: [ false ]
]

{ #category : #initialization }
PRScriptLineNumber >> initialize [
	super initialize.
	stream := PROutputStream on: (String new writeStream). 
]

{ #category : #'visiting-document' }
PRScriptLineNumber >> visitCodeblock: aScript [
	(self hasLineNumber: aScript)
		ifTrue: [ self replace: {self addLineNumberTo: aScript} ]
]
