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
	#category : #'Pillar-Model-Document'
}

{ #category : #protected }
PRInputFileAnnotation class >> path: aPath [

	^ self withParameters: (OrderedDictionary new
			at: 'path' put: aPath;
			yourself)
]

{ #category : #protected }
PRInputFileAnnotation class >> possibleParameters [

	^ #(path)
]

{ #category : #protected }
PRInputFileAnnotation class >> tag [
	^ #inputFile
]

{ #category : #protected }
PRInputFileAnnotation class >> value: aValue [
	
	self deprecated: 'Please use #path: instead'
		  transformWith: '`@receiver value: `@statements1' 
						 -> '`@receiver path: `@statements1'.
	^ self path: aValue
]

{ #category : #visiting }
PRInputFileAnnotation >> accept: aVisitor [
	^ aVisitor visitInputFileAnnotation: self
]

{ #category : #printing }
PRInputFileAnnotation >> asPillarParametersOn: aStream [
	self parameters
		at: 'path'
		ifPresent: [ :v | self asPillarKey: 'path' value: v asString on: aStream ]
]

{ #category : #private }
PRInputFileAnnotation >> errorFileNotFound: aFile [
	PRInputFileError signal: 'File at: ' , aFile fullName , ' not found.'
]

{ #category : #accessing }
PRInputFileAnnotation >> fileWithConfiguration: aConfiguration [
	"I search my file."

	^ aConfiguration baseDirectory resolve: self path
]

{ #category : #accessing }
PRInputFileAnnotation >> path [

	^ self parameters at: 'path'
]

{ #category : #accessing }
PRInputFileAnnotation >> value [
	self deprecated: 'Please use #path instead'
		  transformWith: '`@receiver value' 
						  -> '`@receiver path'.
	^ self path.
]
