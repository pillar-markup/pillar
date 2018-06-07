Class {
	#name : #PRArchetype,
	#superclass : #PRObject,
	#instVars : [
		'name',
		'project'
	],
	#category : 'Pillar-Project-Core'
}

{ #category : #testing }
PRArchetype class >> isAbstract [

	^ false
]

{ #category : #accessing }
PRArchetype >> directory [

	^  FileLocator imageDirectory / 'archetypes' / name
]

{ #category : #actions }
PRArchetype >> installIn: baseDirectory [

	(self directory / 'sample')
		children do: [ :child | child copyAllTo: baseDirectory / child basename ].
		
	self installTemplateIn: baseDirectory.
]

{ #category : #actions }
PRArchetype >> installTemplateIn: baseDirectory [ 

	| destination |
	destination := baseDirectory / '_support'.
	destination ensureDeleteAll.

	"Because we move the support folder into a folder called _support"
	(self directory / 'support')
		copyAllTo: destination
]

{ #category : #accessing }
PRArchetype >> name: aString [ 
	name := aString
]

{ #category : #accessing }
PRArchetype >> project: aPRProject [ 
	project := aPRProject
]

{ #category : #validating }
PRArchetype >> validateExists [

	self directory exists ifFalse: [
		self error: 'Archetype ', name, ' does not exist'
	].
]
