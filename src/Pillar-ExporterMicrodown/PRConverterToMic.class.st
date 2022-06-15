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
	| input |
	input := PRSlideTransformer new start: (PRPillarParser parse:  aPath readStream contents).
	self writeMicrodownOn: aPath forInput: input
]

{ #category : #conversion }
PRConverterToMic >> convertSlide: aPath [

	| input firstParagraph dict metadata |
	input := PRSlideTransformer new start:
		         (PRPillarParser parse: aPath readStream contents).
	firstParagraph := input children first.
	dict := STONJSON fromString: firstParagraph text.
	metadata := PRMetadata new metadata: dict.
	input children at: 1 put: metadata.
	self writeMicrodownOn: aPath forInput: input
]

{ #category : #conversion }
PRConverterToMic >> writeMicrodownOn: aPath forInput: input [

	| fileReference |
	fileReference := FileSystem workingDirectory
	                 / (aPath basenameWithoutExtension , '.md').
	fileReference ensureDelete.
	^ PRMicrodownWriter new
		  setStream: fileReference writeStream;
		  start: input
]
