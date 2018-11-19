"
I'm a configuration that render myself as a Roman number.
"
Class {
	#name : #PRLevelRomanPrinter,
	#superclass : #PRTitlePrinterSpecification,
	#category : 'Pillar-ExporterCore-Configuration'
}

{ #category : #'rendering-element' }
PRLevelRomanPrinter >> renderElement: aNumber on: stream [
	stream nextPutAll: aNumber printStringRoman
]
