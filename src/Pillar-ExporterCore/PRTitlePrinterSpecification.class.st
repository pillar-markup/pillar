"
I describe how a level should be printed. 

- My level is the level of the header I describe.

- Numbering is a boolean.
	 If numbering is false, the numerator will not take this level of header into account.
	If size is at 0, i'll take this level of header into account for the numerator but i'll not render the counter. If my size is at 1 i'll only render the numer of my header level. If my size x i'll render the counter of my level and the counter of x-1 of my parents.

- renderAs represents the kind of representation I want for my counter. It can be ""number"", ""roman"", ""letter"" or ""upperLetter"".

If numbering is at false, the size need to be 0.
"
Class {
	#name : #PRTitlePrinterSpecification,
	#superclass : #Object,
	#instVars : [
		'numbering',
		'size',
		'level',
		'autoAnchor',
		'configuration',
		'capitalization',
		'printer',
		'renderAs'
	],
	#category : #'Pillar-ExporterCore-Configuration'
}

{ #category : #'accessing - defaults' }
PRTitlePrinterSpecification class >> defaultLevel [
	^ 1
]

{ #category : #'instance creation' }
PRTitlePrinterSpecification class >> new [
	^ self with: Dictionary new
]

{ #category : #'instance creation' }
PRTitlePrinterSpecification class >> with: aDictionary [
	"what a ugly API"
	| inst |
	inst := super new
		numbering: (aDictionary at: 'numbering' ifAbsent: [ true ]);
		autoAnchor: (aDictionary at: 'autoAnchor' ifAbsent: [ false ]);
		capitalization: (aDictionary at: 'capitalization' ifAbsent: [ 'raw' ]);
		yourself.
	inst numbering
		ifTrue: [ inst size: (aDictionary at: 'size' ifAbsent: [ 0 ]) ]
		ifFalse: [ inst size: 0 ].
	^ inst
]

{ #category : #accessing }
PRTitlePrinterSpecification >> autoAnchor [
	^ autoAnchor 
]

{ #category : #accessing }
PRTitlePrinterSpecification >> autoAnchor: anObject [ 

	autoAnchor := anObject 
]

{ #category : #accessing }
PRTitlePrinterSpecification >> capitalization [
	^ capitalization
]

{ #category : #accessing }
PRTitlePrinterSpecification >> capitalization: anObject [
	capitalization := anObject 
]

{ #category : #rendering }
PRTitlePrinterSpecification >> elementSeparator [
	"why hardcoding it?"
	^ $.
]

{ #category : #initialization }
PRTitlePrinterSpecification >> fillFromAnother: another [
	"copy all the field from another instance this is used to convert a configuration specification to an instance of one of the subclasses."
	"the equivalent of a changeClassToThatOf:"
	
	self autoAnchor: another autoAnchor. 
	self capitalization: another capitalization. 
	self level: another level. 
	self numbering: another numbering. 
	self renderAs: another renderAs. 
	self size: another size
]

{ #category : #accessing }
PRTitlePrinterSpecification >> headerSize [
	^ size
]

{ #category : #accessing }
PRTitlePrinterSpecification >> headerSize: anInteger [
	"Pay attention changing the size only makes sense when numbering is true."

	size := numbering
		ifTrue: [ anInteger ]
		ifFalse: [ 0 ]
]

{ #category : #initialization }
PRTitlePrinterSpecification >> initialize [

	super initialize.
	numbering := true. 
	autoAnchor := false.
	capitalization := 'raw'.
	level := 1. 
	renderAs := 'number'
]

{ #category : #accessing }
PRTitlePrinterSpecification >> level [
	^ level ifNil: [ self class defaultLevel ]
]

{ #category : #accessing }
PRTitlePrinterSpecification >> level: anObject [
	level := anObject
]

{ #category : #accessing }
PRTitlePrinterSpecification >> numbering [
	^ numbering
]

{ #category : #accessing }
PRTitlePrinterSpecification >> numbering: anObject [
	numbering := anObject
]

{ #category : #accessing }
PRTitlePrinterSpecification >> predecessor [
	^ level = 1
			ifTrue: [ nil ]
			ifFalse: [ self printer perform: ('level' , (self level - 1) asString) asSymbol ]
]

{ #category : #rendering }
PRTitlePrinterSpecification >> printCounter: aCollection [
	^ String streamContents: [ :s | self printCounter: aCollection withMaxSize: self size on: s ]

]

{ #category : #rendering }
PRTitlePrinterSpecification >> printCounter: aCollection withMaxSize: aSize on: stream [
	aSize > 0
		ifTrue: [ (self predecessor isNotNil and: [ aSize - 1 > 0 ])
				ifTrue: [ self predecessor printCounter: aCollection allButLast withMaxSize: aSize - 1 on: stream.
					aCollection allButLast last = -1
						ifFalse: [ stream nextPut: self elementSeparator ] ].
			self printElement: aCollection last on: stream ]
]

{ #category : #'rendering-element' }
PRTitlePrinterSpecification >> printElement: aNumber on: stream [
	aNumber = -1
		ifFalse: [ self renderElement: aNumber on: stream ]
]

{ #category : #printing }
PRTitlePrinterSpecification >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: 'level:'; 
		nextPutAll: self level asString.
	aStream nextPutAll: ' autoAnchor:'; 
		nextPutAll: self autoAnchor asString.
]

{ #category : #accessing }
PRTitlePrinterSpecification >> printer [

	^ printer
]

{ #category : #accessing }
PRTitlePrinterSpecification >> printer: aPrinter [

	printer := aPrinter
]

{ #category : #accessing }
PRTitlePrinterSpecification >> renderAs [
	"only use during serialisation to serve as an marker to create instance of adequate subclasses"
	^ renderAs 
]

{ #category : #accessing }
PRTitlePrinterSpecification >> renderAs: aString [
	"only use during serialisation"
	renderAs := aString
]

{ #category : #'rendering-element' }
PRTitlePrinterSpecification >> renderElement: aNumber on: stream [
	^ self subclassResponsibility
]

{ #category : #accessing }
PRTitlePrinterSpecification >> size [
	^ self headerSize
]

{ #category : #accessing }
PRTitlePrinterSpecification >> size: anInteger [
	"Pay attention changing the size only makes sense when numbering is true."
	self headerSize: anInteger
]
