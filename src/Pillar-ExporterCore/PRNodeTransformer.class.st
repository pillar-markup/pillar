"
I'm an abstract class. I allow the transformation of a tree. I'll visit a tree and if a node needs to be transformed I'll replace the node by its transformation.

 replacement is a Stack with all the nodes of the branch of the node I'm visiting.
"
Class {
	#name : #PRNodeTransformer,
	#superclass : #PRVisitor,
	#instVars : [
		'replacement',
		'configuration'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'instance-creation' }
PRNodeTransformer class >> executeOn: aPillarContext [
	self new
		configuration: aPillarContext configuration;
		start: aPillarContext input.
	^ aPillarContext
]

{ #category : #testing }
PRNodeTransformer class >> isAbstract [
	^ self = PRNodeTransformer 
]

{ #category : #'instance-creation' }
PRNodeTransformer class >> withContext: aContext [
	"The API is done this way (without using the parameter) because most of the subclasses do not need to access the context of the process (such as files, configuration). Some subclasses may get access by redefine it."
	
	^ self new 
		
]

{ #category : #accessing }
PRNodeTransformer >> configuration [
	^ configuration
]

{ #category : #accessing }
PRNodeTransformer >> configuration: anObject [
	configuration := anObject.
	self flag: #SD.
	"self halt: 'configuration: dans NodeTransformer'"
]

{ #category : #pipeline }
PRNodeTransformer >> contributeToPipelineBuilding: aPRPipelineBuilder [ 
	
	aPRPipelineBuilder addPillarDocumentTransformation: self
]

{ #category : #protected }
PRNodeTransformer >> delete [
	"When we do a transformation I replace the current node by nothing."
	self replace: {  }
]

{ #category : #comparing }
PRNodeTransformer >> executeOn: aPillarContext [
	
	self start: aPillarContext input.
	^ aPillarContext
]

{ #category : #initialization }
PRNodeTransformer >> initialize [
	super initialize.
	replacement := Stack new
]

{ #category : #preparation }
PRNodeTransformer >> prepareForExecutionOn: aPRProject [ 
	"This is the setup of the process. This is before the pipeline building."
	"Do nothing by default"
]

{ #category : #protected }
PRNodeTransformer >> replace: newNodes [
	"When we do a transformation I replace the current node by his transformation."

	replacement pop.
	replacement push: newNodes
]

{ #category : #visiting }
PRNodeTransformer >> start: anObject [
	super start: anObject.
	^ anObject
]

{ #category : #'visiting-document' }
PRNodeTransformer >> visitDocumentGroup: aGroup [
	aGroup
		setChildren:
			(aGroup children
				flatCollect: [ :child | 
					replacement push: {child}.
					self visit: child.
					replacement pop]). 
]
