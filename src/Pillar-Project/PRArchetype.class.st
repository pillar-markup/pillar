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

{ #category : 'accessing' }
PRArchetype class >> archetypesDirectory [
	"Answer the folder holding the archetypes: next to the image in a released Pillar (scripts/build.sh copies it there), in the Pillar repository in a development image."

	^ self archetypesDirectoryAmong: self candidateArchetypesDirectories
]

{ #category : 'accessing' }
PRArchetype class >> archetypesDirectoryAmong: directories [
	"Answer the first of directories that exists, or the first one when none does, so that the error names where archetypes are expected."

	^ directories
		  detect: [ :each | each exists ]
		  ifNone: [ directories first ]
]

{ #category : 'accessing' }
PRArchetype class >> candidateArchetypesDirectories [
	"Answer the folders where archetypes may be, the preferred one first."

	^ { (FileLocator imageDirectory asFileReference / 'archetypes') }
	  ,
	  (self repositoryDirectories collect: [ :each | each / 'archetypes' ])
]

{ #category : 'testing' }
PRArchetype class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
PRArchetype class >> repositoryDirectories [
	"Answer the local clones of the repositories holding the code of Pillar."

	^ IceRepository registry
		  select: [ :each |
				  each location isNotNil and: [
					  each includesPackageNamed: self package name ] ]
		  thenCollect: [ :each | each location ]
]

{ #category : 'accessing' }
PRArchetype >> directory [

	^ directory ifNil: [ self class archetypesDirectory / name ]
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
