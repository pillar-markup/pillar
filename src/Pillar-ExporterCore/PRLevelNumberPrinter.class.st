Class {
	#name : 'PRLevelNumberPrinter',
	#superclass : 'PRTitlePrinterSpecification',
	#category : 'Pillar-ExporterCore-Kept for doc ',
	#package : 'Pillar-ExporterCore',
	#tag : 'Kept for doc '
}

{ #category : 'rendering-element' }
PRLevelNumberPrinter >> renderElement: aNumber on: stream [
	aNumber printOn: stream
]
