Class {
	#name : #PRLevelNumberPrinter,
	#superclass : #PRTitlePrinterSpecification,
	#category : 'Pillar-ExporterCore-Configuration'
}

{ #category : #'rendering-element' }
PRLevelNumberPrinter >> renderElement: aNumber on: stream [
	aNumber printOn: stream
]
