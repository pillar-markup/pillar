"
I'm  a visitor of Pillar object entities that generates pillar file back. 
I collaborate with a PillarCanvas (which encodes the low level formatting). 

I start with start: anPillarEntity.

Now I also propose some utilities to escape markup elements. 


"
Class {
	#name : #PRPillarWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting',
		'markupsToEscape'
	],
	#category : #'Pillar-ExporterPillar'
}

{ #category : #private }
PRPillarWriter class >> escapeMarkup: markup [
	^ String streamContents: [ :str | markup do: [ :each | str nextPut: $\; nextPut: each ] ]
]

{ #category : #accessing }
PRPillarWriter class >> fileExtension [
	^ 'pillar'
]

{ #category : #accessing }
PRPillarWriter class >> folderName [
	^ #pillar
]

{ #category : #accessing }
PRPillarWriter class >> writerName [
	^ #pillar
]

{ #category : #accessing }
PRPillarWriter >> canvasClass [
	^ PRPillarCanvas
]

{ #category : #private }
PRPillarWriter >> escape: aString [
	^ self escape: aString all: markupsToEscape
]

{ #category : #private }
PRPillarWriter >> escape: aString all: anArray [
	^ anArray
		inject: (self escape: aString using: '\')
		into: [ :result :each | self escape: result using: each ]
]

{ #category : #private }
PRPillarWriter >> escape: aString during: aBlock [
	"Protect ==aString== (additionally to already existing protected strings) by adding $\ while evaluating ==aBlock==."
	^ (markupsToEscape includes: aString)
		ifTrue: aBlock
		ifFalse: [ 
			markupsToEscape add: aString.
			aBlock ensure: [ markupsToEscape remove: aString ] ]
]

{ #category : #private }
PRPillarWriter >> escape: aString using: aSearchString [
	| string index escapedMarkup |
	string := aString.
	escapedMarkup := self escapeMarkup: aSearchString.
	index := string findString: aSearchString.
	[ index > 0 ] whileTrue: [
		string := (string first: index - 1) , escapedMarkup , (string allButFirst: index - 1 + aSearchString size).
		index := string findString: aSearchString startingAt: index + escapedMarkup size].
	^ string
]

{ #category : #private }
PRPillarWriter >> escapeMarkup: markup [
	^ self class escapeMarkup: markup
]

{ #category : #'initialize-release' }
PRPillarWriter >> initialize [
	super initialize.
	markupsToEscape := PRPillarParser textMarkups values asSet
]

{ #category : #accessing }
PRPillarWriter >> markupEndFor: aPRObject [
	"Return the ending character for a given Pillar entity. Given a script (environment) returns ']]]'"
	^ PRPillarGrammar endMarkups at: aPRObject class
]

{ #category : #accessing }
PRPillarWriter >> markupFor: aPRObject [
	"Return the markup for a given pillar object. For example, given a pillar PRAnchor returns '@'"
	^ PRPillarGrammar markups at: aPRObject class
]

{ #category : #private }
PRPillarWriter >> nest: aString do: aBlock [
	nesting add: aString.
	aBlock ensure: [ nesting removeLast ]
]

{ #category : #visiting }
PRPillarWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject.
	canvas lastIsNewLine
		ifTrue: [ stream trimLastNewLine ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitAnchor: anObject [
	canvas
		raw: (self markupFor: anObject);
		nextPutAll: anObject name;
		newLine
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitAnnotatedParagraph: anObject [
	canvas 
		raw: (self markupFor: anObject);
		nextPutAll: anObject annotation.
	anObject hasChildren 
		ifTrue: [ canvas space ].
	super visitAnnotatedParagraph: anObject
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitAnnotation: anAnnotation [ 
	
	canvas raw: anAnnotation asPillar
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitCodeblock: aCodeBlock [
	canvas raw: (self markupFor: aCodeBlock).
	self visitParametersOf: aCodeBlock.
	canvas
		newLine;
		nextPutAllLines: aCodeBlock text;
		newLine;
		raw: (self markupEndFor: aCodeBlock)
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitCommentedLine: aCommentedLine [
	canvas potentialNewLine.
	canvas raw: (self markupFor: aCommentedLine).
	canvas raw: aCommentedLine text.
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitDefinitionList: anObject [
	canvas potentialNewLine.
	anObject children do: [ :each |
		self 
			nest: (self markupFor: each)
			do: [ self visit: each ] ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitDocument: aDocument [

	| propertiesSton |
	aDocument properties ifNotEmpty: [
		propertiesSton := String new: 100 streamContents: [ :internalStream |
		(STON writer on: internalStream) nextPut: aDocument properties ].
		canvas raw: propertiesSton.
		canvas newLine ].
	super visitDocument: aDocument
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitFigure: aFigure [
	canvas raw: (self markupFor: aFigure).
	super visitFigure: aFigure.
	canvas raw: (self markupFor: aFigure)
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitFormat: anObject [
	canvas raw: (self markupFor: anObject).
	super visitFormat: anObject.
	canvas raw: (self markupFor: anObject)
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitHeader: aHeader [
	aHeader level timesRepeat: [ canvas raw: (self markupFor: aHeader) ].
	super visitHeader: aHeader.
	canvas newLine
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitHorizontalRule: anHorizontalRule [
	canvas
		raw: (self markupFor: anHorizontalRule);
		newLine
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitLink: aLink [
	canvas raw: (PRPillarParser markups at: PRLink).
	super visitLink: aLink.
	canvas raw: (PRPillarParser markups at: PRLink)
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitList: aList [
	canvas potentialNewLine.
	self nest: (self markupFor: aList) do: [ super visitList: aList ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitListItem: aListItem [
	nesting do: [ :each | canvas raw: each ].
	super visitListItem: aListItem.
	canvas potentialNewLine.
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitParagraph: aParagraph [
	super visitParagraph: aParagraph.
	canvas newLine
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitParametersOf: objectWithParams [
	| needSeparator |
	self flag: 'TODO: fix this ugly code. Caption here are treated separately because they contain Pillar text in a string (and this string should not be protected)'.
	needSeparator := false.
	objectWithParams parameters associations
		do:
			[ :assoc | 
			assoc key = 'caption'
				ifFalse:
					[ needSeparator := true.
					canvas nextPutAll: assoc key.
					assoc value
						ifNotNil:
							[ :value | 
							canvas
								raw: PRPillarParser defaultMarkupParameterValue;
								nextPutAll: value asString ] ] ]
		separatedBy: [ canvas raw: PRPillarParser defaultMarkupParameter ].
	objectWithParams parameters at: 'caption'
		ifPresent:
			[ :caption | needSeparator
				ifTrue: [ canvas raw: PRPillarParser defaultMarkupParameter ].
			canvas
				nextPutAll: 'caption';
				raw: PRPillarParser defaultMarkupParameterValue.
				stream << [ self visitAll: objectWithParams caption children ] ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitPreformatted: aPreformatted [
	self
		writeRawDuring: [ 
			aPreformatted children
				do: [ :child | 
					canvas raw: (self markupFor: aPreformatted).
					self visit: child.
					canvas newLine ] ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitRaw: anObject [
	canvas raw: (self markupFor: anObject).
	anObject type
		ifNotNil: [ canvas
				nextPutAll: anObject type;
				raw: PRPillarParser defaultMarkupRawType ].
	canvas raw: anObject text.
	canvas raw: (self markupEndFor: anObject)
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitReference: aReference [
	aReference hasAlias
		ifTrue: [ super visitReference: aReference.
			canvas raw: PRPillarParser defaultMarkupReferenceAlias ].
	canvas raw: (aReference reference ifNil: [ '' ]).
	aReference hasAnchor
		ifTrue: [ canvas raw: PRPillarParser defaultMarkupReferenceAnchor.
			canvas nextPutAll: aReference anchor ].
	aReference hasParameters
		ifTrue: [ canvas raw: PRPillarParser defaultMarkupParameter.
			self visitParametersOf: aReference ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitTableCell: anObject [
	| cellMarkup |
	cellMarkup := self markupFor: anObject.
	canvas raw: cellMarkup.
	anObject isAligned ifTrue: [
		anObject isAlignedLeft ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableLeft ].
		anObject isAlignedCenter ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableCenter ].
		anObject isAlignedRight ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableRight ] ].
	anObject isHeading ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableHeader ].
	self escape: cellMarkup during: [	super visitTableCell: anObject ]
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitTableRow: aTableRow [
	super visitTableRow: aTableRow.
	canvas newLine
]

{ #category : #'visiting-document' }
PRPillarWriter >> visitText: anObject [
	"Write out ==anObject=='s text to the receivers output-stream and escape special characters within and at the beginning of a line."

	| string |
	string := anObject text.
	writingRaw
		ifTrue: [ canvas rawLines: string.
			^ self ].
	canvas lastIsNewLine
		ifTrue: [ | markup |
			markup := PRPillarParser lineMarkups values
				detect: [ :each | string beginsWith: each ]
				ifNone: [ nil ].
			markup
				ifNotNil: [ canvas
						nextPut: $\;
						raw: markup.
					string := string allButFirst: markup size ] ].
	canvas raw: (self escape: string)
]
