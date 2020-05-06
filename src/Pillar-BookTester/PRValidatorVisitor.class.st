Class {
	#name : #PRValidatorVisitor,
	#superclass : #PRVisitor,
	#instVars : [
		'anchors',
		'references'
	],
	#category : #'Pillar-BookTester'
}

{ #category : #initialization }
PRValidatorVisitor >> initialize [

	super initialize.
	anchors := OrderedCollection new. 
	references := OrderedCollection new. 
]

{ #category : #initialization }
PRValidatorVisitor >> isSuccess [

	references do: [ :each | 
			anchors remove: each ].
	^ anchors isEmpty
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitFigure: aFigure [
	
	super visitFigure: aFigure.
	anchors add: aFigure label.
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitInternalLink: aLink [

	super visitInternalLink: aLink.
	references add: aLink anchor.
]
