"
I support the use of a printer to print title and sections related transformations.
"
Class {
	#name : #PRPrintingTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'printer'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #initialization }
PRPrintingTransformer >> initialize [
	super initialize.
	self flag: 'Why printer is not accessed via the configuration'.
	printer := PRTitlePrinter new
]

{ #category : #accessing }
PRPrintingTransformer >> printer [ 

	^ printer
]

{ #category : #accessing }
PRPrintingTransformer >> printer: aPrinter [

	printer := aPrinter
]
