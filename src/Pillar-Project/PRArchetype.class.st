Class {
	#name : 'PRArchetype',
	#superclass : 'PRObject',
	#instVars : [
		'name',
		'project',
		'directory'
	],
	#category : 'Pillar-Project-Core',
	#package : 'Pillar-Project',
	#tag : 'Core'
}

{ #category : 'testing' }
PRArchetype class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
PRArchetype >> directory [

	^ directory ifNil: [ ^ FileLocator imageDirectory / 'archetypes' / name ] 
]

{ #category : 'accessing' }
PRArchetype >> directory: aDirectory [
	directory := aDirectory
]

{ #category : 'actions' }
PRArchetype >> installGHWorkflowIn: baseDirectory [ 

	| destination source |
	source := self directory / 'support' / 'github'.
	source exists ifFalse: [ ^ self]. 

	destination := baseDirectory / '.github' / 'workflows'.
	(baseDirectory / '.github') createDirectory.
	(baseDirectory / '.github' / 'workflows') createDirectory.
	
	source copyAllTo: destination
]

{ #category : 'actions' }
PRArchetype >> installIn: baseDirectory [

	(self directory / 'sample')
		children do: [ :child | child copyAllTo: baseDirectory / child basename ].
		
	self installTemplateIn: baseDirectory.
	self installGHWorkflowIn: baseDirectory
]

{ #category : 'actions' }
PRArchetype >> installTemplateIn: baseDirectory [ 

	| destination |
	destination := baseDirectory / '_support'.
	destination ensureDeleteAll.

	"Because we move the support folder into a folder called _support"
	(self directory / 'support')
		copyAllTo: destination
]

{ #category : 'accessing' }
PRArchetype >> name: aString [ 
	name := aString
]

{ #category : 'accessing' }
PRArchetype >> project: aPRProject [ 
	project := aPRProject
]

{ #category : 'validating' }
PRArchetype >> validateExists [
	
	self directory exists ifFalse: [
		self error: 'Archetype ', name, ' does not exist'
	].
]
