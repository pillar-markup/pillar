Class {
	#name : #PRLevelRomanPrinterTest,
	#superclass : #PRTitlePrinterTest,
	#category : 'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #requirement }
PRLevelRomanPrinterTest >> actualClass [
	^ PRLevelRomanPrinter
]

{ #category : #requirement }
PRLevelRomanPrinterTest >> representationOf26 [
	^ 'XXVI'
]

{ #category : #requirement }
PRLevelRomanPrinterTest >> representationOf27 [
	^ 'XXVII'
]

{ #category : #requirement }
PRLevelRomanPrinterTest >> representationOfOne [
	^ 'I'
]
