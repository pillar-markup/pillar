"
I am a class that will generate the documentation of the transformers in Pillar.

I will use the 'pillarTransformer:key:documentation' pragma. 
I will display the keyword and the documentation of a transformer. The keyword is use to disable a transformer into a configuration.

To use me you can execute :

| stream |
stream := '' writeStream.
PRTransformersDocumentation on: stream.
stream contents
"
Class {
	#name : #PRTransformersDocumentation,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : 'Pillar-ExporterCore-Configuration'
}

{ #category : #'instance creation' }
PRTransformersDocumentation class >> on: aStream [
	"I generate the documentation of the Pillar transformers on a Stream."

	^ self new
		stream: aStream;
		generateDoc;
		stream
]

{ #category : #accessing }
PRTransformersDocumentation >> allTransformers [
	
	^ PRNodeTransformer withAllConcreteClasses
]

{ #category : #action }
PRTransformersDocumentation >> generateDoc [
	| transformers |
	transformers := self allTransformers.
	stream
		lf;
		lf;
		nextPutAll: 'Transformers and keywords to disable them:';
		lf;
		lf.
	self generateDocumentationOf: transformers
]

{ #category : #action }
PRTransformersDocumentation >> generateDocumentationOf: transformers [
	transformers
		do: [ :transformer | 
			stream
				nextPutAll: ';==';
				nextPutAll: transformer class printString;
				nextPutAll: '==';
				nextPutAll: Smalltalk os lineEnding;
				nextPutAll: ':';
				nextPutAll: transformer comment;
				nextPutAll: Smalltalk os lineEnding ]
]

{ #category : #accessing }
PRTransformersDocumentation >> stream [
	^ stream
]

{ #category : #accessing }
PRTransformersDocumentation >> stream: anObject [
	stream := anObject
]
