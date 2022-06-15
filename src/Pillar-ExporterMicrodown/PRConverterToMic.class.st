"
```
PRConverterToMic new goForBook: '/Users/ducasse/Workspace/FirstCircle/ActiveResearch/Pharo/PillarDev/Booklet-PharoWithStyle/withStyle.pillar' asFileReference
```
"
Class {
	#name : #PRConverterToMic,
	#superclass : #Object,
	#pools : [
		'MicroSharedPool'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #conversion }
PRConverterToMic >> convertChapter: aPath [
	| input output fileReference |
	"We should check that the path exists"
	
	input := PRSlideTransformer new start: (PRPillarParser parse:  aPath readStream contents).
	fileReference := FileSystem workingDirectory / (aPath basenameWithoutExtension , '.md').
	fileReference ensureDelete.
	output := PRMicrodownWriter new 
		setStream: fileReference writeStream;
		start: input.
]

{ #category : #conversion }
PRConverterToMic >> convertSlide: aPath [
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
