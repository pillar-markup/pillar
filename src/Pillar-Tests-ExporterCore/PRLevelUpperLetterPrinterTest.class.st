Class {
	#name : #PRLevelUpperLetterPrinterTest,
	#superclass : #PRTitlePrinterTest,
	#category : 'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #requirement }
PRLevelUpperLetterPrinterTest >> actualClass [
	^ PRLevelUpperLetterPrinter
]

{ #category : #requirement }
PRLevelUpperLetterPrinterTest >> representationOf26 [
	^ 'Z'
]

{ #category : #requirement }
PRLevelUpperLetterPrinterTest >> representationOf27 [
	^ 'A'''
]

{ #category : #requirement }
PRLevelUpperLetterPrinterTest >> representationOfOne [
	^ 'A'
]
