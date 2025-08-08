"
I'm a configuration that render myself as a Roman number.
"
Class {
	#name : 'PRLevelRomanPrinter',
	#superclass : 'PRTitlePrinterSpecification',
	#category : 'Pillar-ExporterCore-Kept for doc ',
	#package : 'Pillar-ExporterCore',
	#tag : 'Kept for doc '
}

{ #category : 'rendering-element' }
PRLevelRomanPrinter >> renderElement: aNumber on: stream [
	stream nextPutAll: aNumber printStringRoman
]
