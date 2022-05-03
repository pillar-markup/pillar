Class {
	#name : #PRConverterToMic,
	#superclass : #Object,
	#pools : [
		'MicroSharedPool'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'as yet unclassified' }
PRConverterToMic >> go: aPath [
	| input output fileReference firstParagraph dict metadata |
	input := PRSlideTransformer new start: (PRPillarParser parse:  aPath readStream contents).
	firstParagraph := input children first.
	dict := STONJSON fromString: firstParagraph text.
	metadata := PRMetadata new metadata: dict.
	input children at: 1 put: metadata.
	
	fileReference := FileSystem workingDirectory / 'MyPresentation.md'.
	fileReference ensureDelete.
	output := PRMicrodownWriter new 
		setStream: fileReference writeStream;
		start: input.
]
