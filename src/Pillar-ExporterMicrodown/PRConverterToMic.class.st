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
PRConverterToMic >> convertBook: aPath [

	| input paths |
	paths := self getInputFilesPaths: aPath contents.
	self handleConfigFile.
	input := PRPillarParser parse:  aPath readStream contents.
	self writeMicrodownOn: aPath forInput: input.
	paths do: [ :path | self convertChapter: path ]
]

{ #category : #conversion }
PRConverterToMic >> convertChapter: aPath [
	| input |
	input := PRPillarParser parse:  aPath readStream contents.
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

{ #category : #collect }
PRConverterToMic >> getInputFilesPaths: aString [

	| paths |
	paths := aString substrings.

	paths := paths select: [ :string | string beginsWith: '${inputFile:path=' ].
	
	paths replace: [ :string | FileSystem workingDirectory / (string copyFrom: 18 to: string size - 2)].
	
	^ paths
]

{ #category : #config }
PRConverterToMic >> handleConfigFile [
	"We copy the config file to 'pillarconf.old'
	then we migrate it."
	| ston conf |
	conf := (FileSystem workingDirectory / 'pillar.conf').
	conf exists
		ifTrue: [ 
				| str |
				(FileSystem workingDirectory / 'pillarconf.old') ensureDelete.
				conf copyTo: (FileSystem workingDirectory / 'pillarconf.old').
				ston := (STON reader on: conf readStream) next.
				"unsure is this is like that for the plugin but no expansion is needed for annotation
				in Microdown" 
				ston removeKey: #plugins ifAbsent: [].
				ston at: #latexWriter put: ('mic', (ston at: #latexWriter)) asSymbol.
				conf ensureDelete.
				str := conf writeStream.
				STON put: ston asJsonOnStreamPretty: str.
				str close.
				]
		ifFalse: [ Stdio stdout nextPutAll: conf fullName , ' does not exist']
]

{ #category : #conversion }
PRConverterToMic >> writeMicrodownOn: aPath forInput: input [

	| fileReference |
	fileReference := aPath parent / (aPath basenameWithoutExtension , '.md').
	fileReference ensureDelete.
	^ PRMicrodownWriter new
		  setStream: fileReference writeStream;
		  start: input
]
