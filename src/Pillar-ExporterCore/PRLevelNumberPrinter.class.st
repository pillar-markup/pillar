Class {
	#name : 'PRLevelNumberPrinter',
	#superclass : 'PRTitlePrinterSpecification',
	#category : 'Pillar-ExporterCore-Configuration',
	#package : 'Pillar-ExporterCore',
	#tag : 'Configuration'
}

{ #category : 'rendering-element' }
PRLevelNumberPrinter >> renderElement: aNumber on: stream [
	aNumber printOn: stream
]
