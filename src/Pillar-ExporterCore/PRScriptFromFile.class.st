"
I replace each script with a ==fromFile== parameter with the content of the referenced file.
"
Class {
	#name : #PRScriptFromFile,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'firstLine',
		'lastLine',
		'fileStream'
	],
	#category : #'Pillar-ExporterCore-Feature-ScriptFromFile'
}

{ #category : #adding }
PRScriptFromFile >> addScript: aScript [
	| content |
	content := String new writeStream.
	aScript hasNoCode
		ifFalse: [ 
			PRWarning
				signal:
					'Be careful, you used the fromFile parameter on a script which is not empty. This has been erased : ' , aScript text ].
	firstLine - 1 timesRepeat: [ fileStream nextLine ].
	lastLine - firstLine + 1
		timesRepeat: [ 
			content nextPutAll: fileStream nextLine.
			content nextPutAll: self configuration newLine ].
	^ aScript text: content contents
]

{ #category : #accessing }
PRScriptFromFile >> fileLineNumber [
	| tmpStream cpt |
	tmpStream := fileStream copy.
	cpt := 0.
	[ tmpStream nextLine isNotNil ] whileTrue: [ cpt := cpt + 1 ].
	^ cpt
]

{ #category : #testing }
PRScriptFromFile >> hasFromFile: aScript [
	"I check if the transformer need to transform the script. If the script has bad parameters i raise a warning."

	aScript parameters
		at: 'firstLine'
		ifPresent: [ :lineNumber | 
			firstLine := lineNumber asInteger.
			firstLine ifNil: [ PRPropertyError signal: 'firstLine parameter must contains digits' ].
			aScript parameters
				at: 'fromFile'
				ifAbsent: [ PRWarning signal: 'firstLine has to be with a fromFile parameter.'.
					^ false ] ].
	aScript parameters
		at: 'lastLine'
		ifPresent: [ :lineNumber | 
			lastLine := lineNumber asInteger.
			lastLine ifNil: [ PRPropertyError signal: 'lastLine parameter must contains digits' ].
			aScript parameters
				at: 'fromFile'
				ifAbsent: [ PRWarning signal: 'lastLine has to be with a fromFile parameter.'.
					^ false ] ].
	aScript parameters
		at: 'fromFile'
		ifPresent: [ :fileName | 
			self setFileAndInterval: fileName.
			^ true ]
		ifAbsent: [ ^ false ]
]

{ #category : #action }
PRScriptFromFile >> setFileAndInterval: aFileName [
	"I get the File and i set the line numbers."

	fileStream := self configuration baseDirectory resolve: aFileName.
	fileStream exists
		ifTrue: [ 
			fileStream := fileStream contents readStream.
			self updateInterval ]
		ifFalse: [ PRInputFileError signal: aFileName , ' is not a valid file name into ' , self configuration baseDirectory asString , '.' ]
]

{ #category : #action }
PRScriptFromFile >> updateInterval [
	| fileLineNumber |
	fileLineNumber := self fileLineNumber.
	firstLine
		ifNil: [ firstLine := 1 ]
		ifNotNil: [ firstLine <= fileLineNumber
				ifFalse: [ PRPropertyError signal: 'firstLine parameter is not a valid parameter. Please choose a firstLine lower than the file size.' ] ].
	lastLine
		ifNil: [ lastLine := fileLineNumber ]
		ifNotNil: [ (lastLine >= firstLine and: [ lastLine <= fileLineNumber ])
				ifFalse:
					[ PRPropertyError signal: 'lastLine parameter is not a valid parameter. Please choose a lastLine lower than the file size and higher then the firstLine.' ] ]
]

{ #category : #'visiting-document' }
PRScriptFromFile >> visitCodeblock: aCodeBlock [
	(self hasFromFile: aCodeBlock)
		ifTrue: [ self replace: {(self addScript: aCodeBlock)} ]
]
