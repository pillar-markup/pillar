"
I add numbers to all titles, scripts, figures, and internal links.
"
Class {
	#name : #PRNumeratingVisitor,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'figureCounter',
		'topLevelNumerate',
		'scriptCounter',
		'headerCounter',
		'anchorsMapping'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'instance creation' }
PRNumeratingVisitor class >> executeOn: aPillarContext [
	self new
		configuration: aPillarContext configuration;
		start: aPillarContext input;
		actionOn: aPillarContext.
	^ aPillarContext
]

{ #category : #'instance creation' }
PRNumeratingVisitor class >> with: aConfiguration [
	^ self new
		configuration: aConfiguration;
		initializeTopNumerate;
		yourself
]

{ #category : #actions }
PRNumeratingVisitor >> actionOn: anInput [
	^ anInput
		propertyAt: #anchorsMapping put: anchorsMapping;
		yourself
]

{ #category : #initialization }
PRNumeratingVisitor >> initialize [
	super initialize.
	headerCounter := PRCascadingCounter maxLevel: 5.
	figureCounter := PRCascadingCounter maxLevel: 2.
	scriptCounter := PRCascadingCounter maxLevel: 2.
	anchorsMapping := Dictionary new
]

{ #category : #initialization }
PRNumeratingVisitor >> initializeTopNumerate [
	| cpt |
	cpt := 1.
	[ (configuration printer perform: ('level' , cpt asString) asSymbol) numbering or: [ cpt > 5 ] ] whileFalse: [ cpt := cpt + 1 ].
	topLevelNumerate := cpt
]

{ #category : #test }
PRNumeratingVisitor >> needNumbering: aHeader [
	^ (configuration levelConfigurationFor: aHeader) numbering
]

{ #category : #'visiting-document' }
PRNumeratingVisitor >> visitAnchor: anAnchor [
	anchorsMapping at: anAnchor name put: headerCounter current
]

{ #category : #'visiting-document' }
PRNumeratingVisitor >> visitCodeblock: aCodeBlock [
	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"

	aCodeBlock isEvaluated
		ifTrue: [ ^ self visitAll: aCodeBlock evaluate ].
	aCodeBlock hasLabel
		ifTrue: [ 
			scriptCounter incrementAt: 2.
			aCodeBlock counter: scriptCounter current.
			aCodeBlock parameters at: 'label' ifPresent: [ :label | anchorsMapping at: label put: scriptCounter current ] ]
]

{ #category : #'visiting-document' }
PRNumeratingVisitor >> visitFigure: aFigure [
	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"

	aFigure label
		ifNotNil: [ 
			figureCounter incrementAt: 2.
			aFigure counter: figureCounter current.
			aFigure parameters at: 'label' ifPresent: [ :label | anchorsMapping at: label put: figureCounter current ] ]
]

{ #category : #'visiting-document' }
PRNumeratingVisitor >> visitHeader: aHeader [
	| aLevel |
	aLevel := aHeader level.
	(self needNumbering: aHeader)
		ifTrue: [ headerCounter incrementAt: aLevel ]
		ifFalse: [ headerCounter dontIncrementAt: aLevel ].
	aHeader level = topLevelNumerate
		ifTrue: [ 
			figureCounter incrementAt: 1.
			scriptCounter incrementAt: 1 ].	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"
	aHeader counter: headerCounter current
]

{ #category : #'visiting-document' }
PRNumeratingVisitor >> visitSlideTitleAnnotation: aSlideTitleAnnotation [
	aSlideTitleAnnotation parameters
		at: 'label'
		ifPresent: [ :label | anchorsMapping at: label put: headerCounter current ]
]
