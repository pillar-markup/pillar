"
I include a reference to a pillar file. With me we can add a transformation to remplace an annotation to a pillar file by his tree.

My tag is: 'inputFile''.

I can have in parameter:
- a path to a file with the key ""value="" (required, you can write it without the key)

Examples: 

${inputFile:myFile.pillar}$

${inputFile:value=directory/myFile.pillar}$
"
Class {
	#name : #PRInputFileAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-Model-Document'
}

{ #category : #protected }
PRInputFileAnnotation class >> possibleParameters [

	^ #(value)
]

{ #category : #protected }
PRInputFileAnnotation class >> tag [
	^ #inputFile
]

{ #category : #protected }
PRInputFileAnnotation class >> value: aValue [

	^ self withParameters: (OrderedDictionary new
			at: 'value' put: aValue;
			yourself)
]

{ #category : #visiting }
PRInputFileAnnotation >> accept: aVisitor [
	aVisitor visitInputFileAnnotation: self
]

{ #category : #printing }
PRInputFileAnnotation >> asPillarParametersOn: aStream [
	self parameters
		at: 'value'
		ifPresent: [ :v | self asPillarKey: 'value' value: v on: aStream ]
]

{ #category : #private }
PRInputFileAnnotation >> errorFileNotFound: aFile [
	PRInputFileError signal: 'File at: ' , aFile fullName , ' not found.'
]

{ #category : #accessing }
PRInputFileAnnotation >> fileWithConfiguration: aConfiguration [
	"I search my file."

	^ aConfiguration baseDirectory resolve: (self parameters at: 'value')
]

{ #category : #accessing }
PRInputFileAnnotation >> value [
	
	^ self parameters at: 'value'
]
