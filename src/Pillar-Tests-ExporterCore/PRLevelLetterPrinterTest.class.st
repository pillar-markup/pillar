Class {
	#name : #PRLevelLetterPrinterTest,
	#superclass : #PRTitlePrinterTest,
	#category : 'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #requirement }
PRLevelLetterPrinterTest >> actualClass [
	^ PRLevelLetterPrinter
]

{ #category : #requirement }
PRLevelLetterPrinterTest >> representationOf26 [
	^ 'z'
]

{ #category : #requirement }
PRLevelLetterPrinterTest >> representationOf27 [
	^ 'a'''
]

{ #category : #requirement }
PRLevelLetterPrinterTest >> representationOfOne [
	^ 'a'
]
