"
This visitor is about to disappeared. It was created just to make sure that we can have asPillar expressed as a visitor. 
Now this visitor is working on non expanded code blocks.
"
Class {
	#name : #MicMicrodownObjectToPillarObjectConverter,
	#superclass : #MicrodownVisitor,
	#category : #'Pillar-MicrodownToPillarConverter-Visitor'
}

{ #category : #formatting }
MicMicrodownObjectToPillarObjectConverter >> formatBlock: aMicFormatBlock [
	| childrenAsPillar |
	childrenAsPillar := aMicFormatBlock isOnlyChild 
		ifTrue: [ {(PRText new text: aMicFormatBlock substring )} ] 
		ifFalse: [ aMicFormatBlock children collect: [:e | e accept: self ] ].
	 ^ aMicFormatBlock associatedPillarClass new
				setChildren: childrenAsPillar;
				yourself
]

{ #category : #formatting }
MicMicrodownObjectToPillarObjectConverter >> urlBlock: aMicUrlBlock [
	
	| queries urlString |
	queries := aMicUrlBlock reference uri query.
	aMicUrlBlock reference uri query: nil.
	"UGLY we remove the query dicrtionary just to print."
	urlString := aMicUrlBlock reference uri asString.
	"the following test is needed as reported in https://github.com/pillar-markup/Microdown/issues/527"
	urlString first = $/ ifTrue: [ urlString := urlString allButFirst ].
	
	aMicUrlBlock reference uri query: queries.
	^ aMicUrlBlock associatedPillarClass new
		  setChildren:
			  ((aMicUrlBlock inlineParse: aMicUrlBlock substring) collect: [ :n | 
					   n accept: self ]);
		  reference: urlString;
		  yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitAnchor: aMicAnchorBlock [
 	^ PRAnchor new name: aMicAnchorBlock label; yourself
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitAnchorReference: aMicAnchorReference [
	^ PRInternalLink new anchor: aMicAnchorReference substring; yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitAnnotated: aMicAnnotatedBlock [
 	^ PRAnnotatedParagraph new 
			annotation: aMicAnnotatedBlock label; 
			setChildren: (aMicAnnotatedBlock pillarFrom: aMicAnnotatedBlock textElements);
			yourself
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitAnnotation: aMicAnnotation [
	^ aMicAnnotation associatedPillarClass new parameters: aMicAnnotation arguments
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitBold: aMicBold [
 	^ self formatBlock: aMicBold
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitCell: aCell [
	| cell |
	cell := PRTableCell new.
	aCell do: [ :each | cell add: (each accept: self)  ].
	^ cell
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitCode: aMicCodeBlock [

	| prBlock par pillars |
	prBlock := PRCodeblock new.
	prBlock text: aMicCodeBlock code.

	aMicCodeBlock arguments keysAndValuesDo: [ :k :v | 
		(aMicCodeBlock arguments includesKey: #language)
			ifFalse: [ 
				(aMicCodeBlock arguments keys first = k and: v isEmptyOrNil)
					ifTrue: [ prBlock parameterAt: 'language' put: k ]
					ifFalse: [ prBlock parameterAt: k put: v ] ]
			ifTrue: [ prBlock parameterAt: k put: v ] ].

	aMicCodeBlock hasCaption
		ifTrue: [ 
			prBlock parameters removeKey: #caption.
			par := PRParagraph new.
			pillars := aMicCodeBlock captionElements collect: [ :each | 
				           each accept: MicMicrodownObjectToPillarObjectConverter new ].
			pillars do: [ :each | par add: each ].
			prBlock setCaption: par ]
		ifFalse: [ 
			prBlock caption "Yes this is not an accessor but something with side effect" ].
	^ prBlock
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitComment: aMicCommentBlock [
 	^ PRCommentedLine new
 			text: aMicCommentBlock text ;
 			yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitEnvironment: aMicEnvironmentBlock [
	
	| env |
	env := PREnvironment new 
			name: aMicEnvironmentBlock environmentName;
			parameters: aMicEnvironmentBlock arguments; yourself.
	env add: (PRParagraph withAll: (aMicEnvironmentBlock pillarFrom: aMicEnvironmentBlock bodyElements)).
	^ env
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitFigure: aMicFigureBlock [

	| aPRFigure |
	aPRFigure := self urlBlock: aMicFigureBlock.
	^ aPRFigure
		  label: aMicFigureBlock substring;
		  parameters: aMicFigureBlock arguments;
		  yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitFormatBlock: aMicFormatBlock [
 	| childrenAsPillar |
 	childrenAsPillar := aMicFormatBlock isOnlyChild 
 		ifTrue: [ {(PRText new text: aMicFormatBlock substring )} ] 
 		ifFalse: [ aMicFormatBlock children collect: [:e | e accept: self ] ].
 	 ^ aMicFormatBlock associatedPillarClass new
 				setChildren: childrenAsPillar;
 				yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitHeader: aMicHeaderBlock [

 	^ PRHeader new
		level: aMicHeaderBlock level;
		setChildren: (aMicHeaderBlock children collect: [:each | each accept: self ]);
		yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitHorizontalLine: anHorizontalLineBlock [
 	^ PRHorizontalRule new 
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitItalic: aMicItalic [
 	^ self formatBlock: aMicItalic
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitLink: aMicLink [

	^ aMicLink associatedPillarClass new
		  setChildren:
			  ((aMicLink inlineParse: aMicLink substring) collect: [ :n | 
					   n accept: self ]);
		  reference: aMicLink url asString;
		  yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitListItem: aMicListItemBlock [
	
 	^ PRListItem new
		setChildren: "(aMicListItemBlock pillarFrom: aMicListItemBlock textElements)," (aMicListItemBlock children collect: [:child| child accept: self]);
		yourself;
		yourself

]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitMath: aMicMathBlock [
 	| captionElements |
	captionElements := aMicMathBlock arguments at: 'caption' ifAbsent: [ nil ]. 
	captionElements isNotNil 
		ifTrue: [ aMicMathBlock arguments at: 'caption' put: (aMicMathBlock pillarFrom: captionElements) ].
	^ PRMathEnvironment new 
	 	parameters: aMicMathBlock arguments;   
		add: (PRText content: aMicMathBlock body);
		yourself
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitMathInline: aMicMathInline [
 	^ self formatBlock: aMicMathInline
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitMetaData: aMicMetaData [
 	^ PRMetadata new 
			metadata: aMicMetaData body; yourself
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitMonospace: aMicMonospace [
 	^ self formatBlock: aMicMonospace
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitOrderedList: aMicOrderedListBlock [
 	^ PROrderedList new
		setChildren: (aMicOrderedListBlock children collect: [ :child | child accept: self ]);
		counter: aMicOrderedListBlock startIndex;
		yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitParagraph: aMicParagraphBlock [
 	^ PRParagraph  new
		setChildren: (aMicParagraphBlock pillarFromString: aMicParagraphBlock text);
		yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitQuote: aMicQuoteBlock [
 	^ PRPreformatted new
 		setChildren: (aMicQuoteBlock pillarFromString: aMicQuoteBlock text);
 		yourself
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitRaw: aMicRaw [
	^ PRRaw new text: aMicRaw substring ; yourself 
	
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitRoot: aMicRootBlock [
 	^ PRDocument new
 		setChildren: (aMicRootBlock children collect: [ :child | child accept: self ]);
 		yourself

]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitRow: aRow in: aTable at: i [

	| row |
	row := PRTableRow new.
	i = 1 
		ifTrue: [ aRow do: [ :cell | row add: ((self visitCell: cell) heading: true) ] ] 
		ifFalse: [ aRow do: [ :cell | row add: (self visitCell: cell) ] ].
	^ row
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitStrike: aMicStrike [
 	^ self formatBlock: aMicStrike
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitTable: aTable [
	| table |
	table := PRTable new.
	aTable rows doWithIndex: [ :row : i | 
		table add: (self visitRow: row in: aTable at: i)].
	^ table
]

{ #category : #'visiting inline' }
MicMicrodownObjectToPillarObjectConverter >> visitText: aMicTextBlock [
	
 	^ PRText new text: aMicTextBlock substring ; yourself
]

{ #category : #visiting }
MicMicrodownObjectToPillarObjectConverter >> visitUnorderedList: aMicUnorderedListBlock [
 	^ PRUnorderedList new
 		setChildren: (aMicUnorderedListBlock children collect:[:child| child accept: self]);
 		yourself
]
